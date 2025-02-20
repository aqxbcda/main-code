function [sys, x0, str, ts] = MUX_gradient(t, x, u, flag)
switch flag
    case 0
        [sys, x0, str, ts] = mdlInitializeSizes;
    case 1
        sys = mdlDerivatives(t, x, u);
    case 3
        sys = mdlOutputs(t, x, u);
    case {2, 4, 9}
        sys = [];
    otherwise
        error(['Unhandled flag = ', num2str(flag)]);
end

function [sys, x0, str, ts] = mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 54; 
sizes.NumInputs      = 55; 
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0 = [];
str = [];
ts = [];

function sys = mdlOutputs(t, x, u)
T = 54;
N = 54; 
A = zeros(N); 


for i = 1:N
    A(i, mod(i, N) + 1) = 1; 
    A(mod(i - 2, N) + 1, i) = 1; 
end

extra_connections = [1, 27; 2, 28; 3, 29; 10, 27];

for k = 1:size(extra_connections, 1)
    i = extra_connections(k, 1);
    j = extra_connections(k, 2);
    A(i, j) = 1;
    A(j, i) = 1; 
end
A = max(A, A'); 


p1_p2 = u(55);  


if p1_p2 <= 0 || p1_p2 > 2
    error('p1_p2 must be in the range (0, 2]');
end

SUM = zeros(1, T); 


for i = 1:T
    SUM(i) = 0; 
    for j = 1:T
        diff_u = u(i) - u(j);
        sign_function = sign(diff_u);
        abs_diff = abs(diff_u);
        SUM(i) = SUM(i) + A(i, j) * sign_function * abs_diff^(2 - p1_p2) ...
                        + A(i, j) * sign_function * abs_diff^p1_p2;
    end

    if isnan(SUM(i)) || ~isreal(SUM(i))
        error('SUM(%d) has invalid value: %f', i, SUM(i));
    end
end

sys = SUM'; 

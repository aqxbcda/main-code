function [sys,x0,str,ts] = MUX(t,x,u,flag)
switch flag
    case 0
        [sys,x0,str,ts] = mdlInitializeSizes;
    case 3
        sys = mdlOutputs(t,x,u);
    case {1,2,4,9}
        sys = [];
    otherwise
        error(['Unhandled flag = ', num2str(flag)]);
end

function [sys,x0,str,ts] = mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 108; 
sizes.NumInputs      = 108;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0 = [];
str = [];
ts = [];

function sys = mdlOutputs(t,x,u)
T = 54;
x_min = 10;
x_max = 130;
sys = zeros(1, 108); 

a = 6.78 + 67.55 * rand(1, T);
b = 8.3391 + 29.3577 * rand(1, T);
c = 0.24 + 0.439 * rand(1, T);

x = u(1:T); 
sum_d = sum(u(T+1:2*T)); 

gamma = 0.1;
eta = 1;
for i = 1:T
    df11 = 2 * c(i) * x(i) + b(i);
    h1 = (x_min - x(i)) * (x_max - x(i)) + gamma;
    dh1 = (2 * x(i) - x_min - x_max);
    if h1 < 0
        sys(i) = df11;
    elseif h1 >= 0 && h1 <= gamma
        sys(i) = df11 + eta / gamma * h1 * dh1;
    else
        sys(i) = df11 + eta * dh1;
    end
end

x0 = x_min * ones(1, T); 
objective = @(x) sum(c .* x.^2 + b .* x + a);
nonlcon = @(x) deal([], sum(x) - sum_d);
lb = x_min * ones(1, T);
ub = x_max * ones(1, T);
options = optimoptions('fmincon', 'Display', 'off', 'Algorithm', 'sqp');
[x_opt, ~] = fmincon(objective, x0, [], [], [], [], lb, ub, nonlcon, options);

sys(T+1:2*T) = x_opt; 

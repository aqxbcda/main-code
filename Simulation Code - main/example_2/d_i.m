function [sys,x0,str,ts] = d_i(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1,
    sys=mdlDerivatives(t,x,u);
case 3,
    sys=mdlOutputs(t,x,u);
case {2,4,9}
    sys=[];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 54;
sizes.NumInputs      = 1;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0 =[];
str = [];
ts = [];
function sys=mdlOutputs(t,x,u)

T = 54; 
rng(0); 
if t<150
    for i = 1:T
        rng(i);
        d_i = 50 + 10 * rand;        
        sys(i) = d_i;
    end
else
    for i = 1:T
        rng(i); 
        d_i = 40 + 10 * rand;        
        sys(i) = d_i;
    end
end


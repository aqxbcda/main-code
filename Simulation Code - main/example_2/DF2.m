function [sys,x0,str,ts] = DF2(t,x,u,flag)
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
sizes.NumOutputs     = 1;
sizes.NumInputs      = 1;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0 =[];
str = [];
ts = [];
function sys=mdlOutputs(t,x,u)
x = u(1);%V=1
x_min=30;
x_max=40;
gamma=0.02;
eta=1;

df11=2*x+4;

h1=(x_min - x)*(x_max - x) + gamma;

dh1=(2*x - x_min - x_max);

if h1<0
    sys(1) = df11;
elseif h1>=0 && h1<=gamma
    sys(1) = df11 + eta/gamma*h1*dh1;
else
    sys(1) = df11 + eta*dh1;
end


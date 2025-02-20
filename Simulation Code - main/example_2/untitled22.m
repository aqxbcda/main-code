
T = 54; 
c = rand(1, T); 
b = rand(1, T); 
a = rand(1, T); 
x_min = 10; 
x_max = 100; 
d = rand(1, T) * (x_max - x_min) + x_min; 


sum_d = sum(d); 


x0 = (x_max - x_min) * rand(1, T) + x_min;


objective = @(x) sum(c .* x.^2 + b .* x + a);


nonlcon = @(x) deal([], sum(x) - sum_d);


lb = x_min * ones(1, T); 
ub = x_max * ones(1, T); 


options = optimoptions('fmincon', 'Display', 'iter', 'Algorithm', 'sqp'); 
[x_opt, fval] = fmincon(objective, x0, [], [], [], [], lb, ub, nonlcon, options);



disp(x_opt);


disp(fval);


disp(sum(x_opt) - sum_d);

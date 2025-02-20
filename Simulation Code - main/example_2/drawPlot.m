
t = out.t;     
P = out.x;     
figure('Color', 'w');
hold on;
for i = 1:size(P, 2)  
    plot(t, P(:, i), 'LineWidth', 1.5); 
end
hold off;
xlabel('Time $t$', 'Interpreter', 'latex', 'FontSize', 14); 
ylabel('$P_i(t)$', 'Interpreter', 'latex', 'FontSize', 14); 
set(gca, 'FontSize', 12, 'FontName', 'Times New Roman', 'LineWidth', 1); 
box on; 
set(gca, 'TickLabelInterpreter', 'latex');
t = out.t;                
error_x = out.error_x;   
error_x_abs = (error_x);  
figure('Color', 'w');  
hold on;
for i = 1:size(error_x_abs, 2) 
    plot(t, error_x_abs(:, i), 'LineWidth', 1.5); 
end
hold off;
xlabel('Time $t$', 'Interpreter', 'latex', 'FontSize', 14); 
ylabel('$P_i(t) - P_i^*$', 'Interpreter', 'latex', 'FontSize', 14); 
set(gca, 'FontSize', 12, 'FontName', 'Times New Roman', 'LineWidth', 1); 
box on; 
set(gca, 'TickLabelInterpreter', 'latex'); 
%%
t = out.t;      
P = out.x;     
di = out.di;    
P_sum = sum(P, 2); 
di_sum = sum(di, 2);  
figure('Color', 'w');  
hold on;
plot(t, P_sum, 'LineWidth', 1.5, 'DisplayName', '$\sum_{i=1}^{N=54}P_i(t)$'); 
plot(t, di_sum, 'LineWidth', 1.5, 'DisplayName', '$\sum_{i=1}^{N=54}d_i(t)$'); 
hold off;
xlabel('Time $t$', 'Interpreter', 'latex', 'FontSize', 14); 
ylabel('$\sum_{i=1}^{N=54}P_i(t)$ and $\sum_{i=1}^{N=54}d_i(t)$', 'Interpreter', 'latex', 'FontSize', 14);
set(gca, 'FontSize', 12, 'FontName', 'Times New Roman', 'LineWidth', 1); % 坐标轴字体和线宽
box on; 
set(gca, 'TickLabelInterpreter', 'latex'); 
legend('show', 'Location', 'best', 'Interpreter', 'latex');

%%
t = out.t;        
hf = out.hf;      
f = out.f;        
error_est = hf - f; 
figure('Color', 'w'); 
hold on;
plot(t, error_est, 'LineWidth', 1.5, 'DisplayName', '$\hat{x}_{i,5}(t) - q(x(t), \omega(t))$');
hold off;
xlabel('Time $t$', 'Interpreter', 'latex', 'FontSize', 14); 
ylabel('Error between $\hat{x}_{i,5}(t)$ and $q_i(x(t), \omega(t))$', 'Interpreter', 'latex', 'FontSize', 14); 
set(gca, 'FontSize', 12, 'FontName', 'Times New Roman', 'LineWidth', 1); 
box on; 
set(gca, 'TickLabelInterpreter', 'latex'); 
%%
t = out.t;          
gradient_data = out.gradient; 
figure('Color', 'w');  
hold on;
plot(t, gradient_data, 'LineWidth', 1.5);
hold off;
xlabel('Time $t$', 'Interpreter', 'latex', 'FontSize', 14); 
ylabel('$\nabla f_i(P_i(t))$', 'Interpreter', 'latex', 'FontSize', 14); 
set(gca, 'FontSize', 12, 'FontName', 'Times New Roman', 'LineWidth', 1); 
box on; 
set(gca, 'TickLabelInterpreter', 'latex'); 



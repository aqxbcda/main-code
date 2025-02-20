%out.t, out.v1x1, ..., out.v2x4

% Time
t = out.t;

% 
v1x1 = out.v1x1;
v1x2 = out.v1x2;
v1x3 = out.v1x3;
v1x4 = out.v1x4;
v2x1 = out.v2x1;
v2x2 = out.v2x2;
v2x3 = out.v2x3;
v2x4 = out.v2x4;

% color
colors = {[0 0.4470 0.7410], [0.8500 0.3250 0.0980], [0.9290 0.6940 0.1250], [0.4940 0.1840 0.5560], ...
          [0.4660 0.6740 0.1880], [0.3010 0.7450 0.9330], [0.6350 0.0780 0.1840], [0.25 0.25 0.25]};

% 
figure;
hold on;
plot(t, v1x1, 'Color', colors{1}, 'LineWidth', 1.5);
plot(t, v1x2, 'Color', colors{2}, 'LineWidth', 1.5);
plot(t, v1x3, 'Color', colors{3}, 'LineWidth', 1.5);
plot(t, v1x4, 'Color', colors{4}, 'LineWidth', 1.5);

plot(t, v2x1, 'Color', colors{5}, 'LineWidth', 1.5);
plot(t, v2x2, 'Color', colors{6}, 'LineWidth', 1.5);
plot(t, v2x3, 'Color', colors{7}, 'LineWidth', 1.5);
plot(t, v2x4, 'Color', colors{8}, 'LineWidth', 1.5);

% 
xline(4.617, '--', 'Color', [0.1 0.1 0.1], 'LineWidth', 1.5);
text(4.617, max([v1x1; v1x2; v1x3; v1x4; v2x1; v2x2; v2x3; v2x4]), ...
    '  4.617s', 'Color', [0.1 0.1 0.1], 'VerticalAlignment', 'bottom', 'FontSize', 10);
box on;
% 
legend({'P^1_1(t)', 'P^1_2(t)', 'P^1_3(t)', 'P^1_4(t)', ...
       'P^2_1(t)', 'P^2_2(t)', 'P^2_3(t)', 'P^2_4(t)'}, 'Location', 'Best', 'NumColumns', 4);

title('The evolution of the state variable P_i(t) for all agents');
xlabel('Time t');
ylabel('State Variable P_i(t)');

hold off;




%% Assuming variables out.t, out.v1e1, ..., out.v2e4 are known

% Time
% t = out.t;

% State variables
v1e1 = out.v1e1;
v1e2 = out.v1e2;
v1e3 = out.v1e3;
v1e4 = out.v1e4;
v2e1 = out.v2e1;
v2e2 = out.v2e2;
v2e3 = out.v2e3;
v2e4 = out.v2e4;

% Color settings
colors = {[0 0.4470 0.7410], [0.8500 0.3250 0.0980], [0.9290 0.6940 0.1250], [0.4940 0.1840 0.5560], ...
          [0.4660 0.6740 0.1880], [0.3010 0.7450 0.9330], [0.6350 0.0780 0.1840], [0.25 0.25 0.25]};

% Plot
figure;
hold on;
plot(t, v1e1, 'Color', colors{1}, 'LineWidth', 1.5);
plot(t, v1e2, 'Color', colors{2}, 'LineWidth', 1.5);
plot(t, v1e3, 'Color', colors{3}, 'LineWidth', 1.5);
plot(t, v1e4, 'Color', colors{4}, 'LineWidth', 1.5);

plot(t, v2e1, 'Color', colors{5}, 'LineWidth', 1.5);
plot(t, v2e2, 'Color', colors{6}, 'LineWidth', 1.5);
plot(t, v2e3, 'Color', colors{7}, 'LineWidth', 1.5);
plot(t, v2e4, 'Color', colors{8}, 'LineWidth', 1.5);


xline(4.617, '--', 'Color', [0.1 0.1 0.1], 'LineWidth', 1.5);
text(4.617, max([v1e1; v1e2; v1e3; v1e4; v2e1; v2e2; v2e3; v2e4]), ...
    '  4.617s', 'Color', [0.1 0.1 0.1], 'VerticalAlignment', 'bottom', 'FontSize', 10);

% Enable box around the plot
box on;

% Legend and labels
legend({'e^1_1(t)', 'e^1_2(t)', 'e^1_3(t)', 'e^1_4(t)', ...
       'e^2_1(t)', 'e^2_2(t)', 'e^2_3(t)', 'e^2_4(t)'}, 'Location', 'Best', 'NumColumns', 2);

title('The trajectory of e_i(t)');
xlabel('Time t');
ylabel('e_i(t)');

hold off;

%%
% Time
% t = out.t;

% State observation errors
error1 = out.v1x1 - out.v1hx1;
error2 = out.v1x2 - out.v1hx2;
error3 = out.v1x3 - out.v1hx3;
error4 = out.v1x4 - out.v1hx4;
error5 = out.v2x1 - out.v2hx1;
error6 = out.v2x2 - out.v2hx2;
error7 = out.v2x3 - out.v2hx3;
error8 = out.v2x4 - out.v2hx4;

% Color settings
colors = {[0 0.4470 0.7410], [0.8500 0.3250 0.0980], [0.9290 0.6940 0.1250], [0.4940 0.1840 0.5560], ...
          [0.4660 0.6740 0.1880], [0.3010 0.7450 0.9330], [0.6350 0.0780 0.1840], [0.25 0.25 0.25]};

% Plot
figure;
hold on;
plot(t, error1, 'Color', colors{1}, 'LineWidth', 1.5);
plot(t, error2, 'Color', colors{2}, 'LineWidth', 1.5);
plot(t, error3, 'Color', colors{3}, 'LineWidth', 1.5);
plot(t, error4, 'Color', colors{4}, 'LineWidth', 1.5);

plot(t, error5, 'Color', colors{5}, 'LineWidth', 1.5);
plot(t, error6, 'Color', colors{6}, 'LineWidth', 1.5);
plot(t, error7, 'Color', colors{7}, 'LineWidth', 1.5);
plot(t, error8, 'Color', colors{8}, 'LineWidth', 1.5);

% Enable box around the plot
box on;

% Legend and labels
% Enable LaTeX interpreter in the legend
legend({'$x^1_{1,1}(t)-\hat{x}^1_{1,1}(t)$', '$x^1_{2,1}(t)-\hat{x}^1_{2,1}(t)$', '$x^1_{3,1}(t)-\hat{x}^1_{3,1}(t)$', '$x^1_{4,1}(t)-\hat{x}^1_{4,1}(t)$', ...
       '$x^2_{1,1}(t)-\hat{x}^2_{1,1}(t)$', '$x^2_{2,1}(t)-\hat{x}^2_{2,1}(t)$', '$x^2_{3,1}(t)-\hat{x}^2_{3,1}(t)$', '$x^2_{4,1}(t)-\hat{x}^2_{4,1}(t)$'}, ...
       'Location', 'Best', 'NumColumns', 2, 'Interpreter', 'latex');

% Title and labels with LaTeX formatting
title('The error between $x_{i,1}(t)$ and $\hat{x}_{i,1}(t)$', 'Interpreter', 'latex');
xlabel('Time $t$', 'Interpreter', 'latex');
ylabel('The error between $x_{i,1}(t)$ and $\hat{x}_{i,1}(t)$', 'Interpreter', 'latex');

hold off;

%% Assuming variables out.t, out.v1x1, ..., out.v2x4 are known

% Time
% t = out.t;

% Calculate the variables
x1_sum = out.v1x1 + out.v1x2 + out.v1x3 + out.v1x4 - 145;
x2_sum = out.v2x1 + out.v2x2 + out.v2x3 + out.v2x4 - 145;

% Calculate initial and final points
x_start = x1_sum(1);
y_start = x2_sum(1);
x_end = x1_sum(end);
y_end = x2_sum(end);
t_start = t(1);
t_end = t(end);

% Color settings
line_color = [0 0.4470 0.7410]; % Line color
start_marker = ''; % Marker for start
end_marker = '*'; % Marker for end
start_marker_color = line_color; % Color for start marker
end_marker_color = 'red'; % Color for end marker

% Plot
figure;
plot3(t, x1_sum, x2_sum, 'Color', line_color, 'LineWidth', 1.5);
hold on;

% Add starting and ending points
plot3(t_start, x_start, y_start, start_marker, 'Color', start_marker_color, 'MarkerFaceColor', start_marker_color, 'MarkerSize', 8);
plot3(t_end, x_end, y_end, end_marker, 'Color', end_marker_color, 'MarkerSize', 10);

% Annotate the starting and ending points
text(t_start, x_start, y_start, '$\sum_{i=1}^{4}x_{i,1}(0)-\sum_{i=1}^{4}d_i$', 'Interpreter', 'latex', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize', 10);
text(t_end, x_end, y_end, '$\sum_{i=1}^{4}x^*_{i,1}-\sum_{i=1}^{4}d_i$', 'Interpreter', 'latex', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'left', 'FontSize', 10);

% Labels and title
xlabel('Time $t$', 'Interpreter', 'latex');
ylabel('$\sum_{i=1}^{4}x^1_{i,1}(t)-\sum_{i=1}^{4}d^1_i$', 'Interpreter', 'latex');
zlabel('$\sum_{i=1}^{4}x^2_{i,1}(t)-\sum_{i=1}^{4}d^2_i$', 'Interpreter', 'latex');
title('3D State Error Comparison over Time', 'Interpreter', 'latex');

% Enable grid
grid on;
box on;

hold off;


%% Assuming variables out.t, out.v1f1, ..., out.v2hf4 are known

% Time
% t = out.t;

% Calculate the error between the variables
errors = [out.v1f1 - out.v1hf1, out.v1f2 - out.v1hf2, out.v1f3 - out.v1hf3, out.v1f4 - out.v1hf4, ...
          out.v2f1 - out.v2hf1, out.v2f2 - out.v2hf2, out.v2f3 - out.v2hf3, out.v2f4 - out.v2hf4];

% Plot settings
figure;
plot(t, errors(:, 1), '-', 'Color', [0, 0.4470, 0.7410], 'LineWidth', 2); hold on; % Blue
plot(t, errors(:, 2), '-', 'Color', [0.8500, 0.3250, 0.0980], 'LineWidth', 2); % Orange
plot(t, errors(:, 3), '-', 'Color', [0.9290, 0.6940, 0.1250], 'LineWidth', 2); % Yellow
plot(t, errors(:, 4), '-', 'Color', [0.4940, 0.1840, 0.5560], 'LineWidth', 2); % Purple
plot(t, errors(:, 5), '-', 'Color', [0.4660, 0.6740, 0.1880], 'LineWidth', 2); % Green
plot(t, errors(:, 6), '-', 'Color', [0.3010, 0.7450, 0.9330], 'LineWidth', 2); % Cyan
plot(t, errors(:, 7), '-', 'Color', [0.6350, 0.0780, 0.1840], 'LineWidth', 2); % Dark Red
plot(t, errors(:, 8), '-', 'Color', [0.0000, 0.0000, 0.0000], 'LineWidth', 2); % Black

% Labels and title
xlabel('Time $t$', 'Interpreter', 'latex');
ylabel('Error between $q_i(t)$ and $\widehat{x}_i(t)$', 'Interpreter', 'latex');
title('ESO Estimation Error of Unknown Disturbances', 'Interpreter', 'latex');

% Legend
legend({'$q^1_1(t) - \widehat{x}^1_{1,3}(t)$', '$q^1_2(t) - \widehat{x}^1_{2,3}(t)$', ...
        '$q^1_3(t) - \widehat{x}^1_{3,3}(t)$', '$q^1_4(t) - \widehat{x}^1_{4,3}(t)$', ...
        '$q^2_1(t) - \widehat{x}^2_{1,3}(t)$', '$q^2_2(t) - \widehat{x}^2_{2,3}(t)$', ...
        '$q^2_3(t) - \widehat{x}^2_{3,3}(t)$', '$q^2_4(t) - \widehat{x}^2_{4,3}(t)$'}, ...
        'Interpreter', 'latex', 'Location', 'Best', 'NumColumns', 2);

% Grid and box
% grid on;
box on;

hold off;
%%%  out.t, out.v1x1, out.v1x2, out.v1x3, out.v1x4, out.v2x1, out.v2x2, out.v2x3, out.v2x4 已知

% 
t = out.t;

% 
v1x = [out.v1x1, out.v1x2, out.v1x3, out.v1x4];
v2x = [out.v2x1, out.v2x2, out.v2x3, out.v2x4];

% 
limits_y = [
    10 20;
    30 40;
    60 70;
    20 30
];

limits_z = [
    20 40;
    25 35;
    35 50;
    25 45
];

% 
colors = [
    0 0.4470 0.7410;  % 
    0.8500 0.3250 0.0980;  % 
    0.9290 0.6940 0.1250;  % 
    0.4940 0.1840 0.5560;  % 
];

% 
figure;
hold on;

% 
for i = 1:4
    % 
    plot3(t, v1x(:, i), v2x(:, i), '-', 'Color', colors(i,:), 'LineWidth', 2);
end

% 
legend({'P_1(t)', 'P_2(t)', 'P_3(t)', 'P_4(t)'}, 'Location', 'Best', 'Interpreter', 'latex');

for i = 1:4
    % 
    plot3([t(end) t(end) t(end) t(end) t(end)], ...
          [limits_y(i,1) limits_y(i,2) limits_y(i,2) limits_y(i,1) limits_y(i,1)], ...
          [limits_z(i,1) limits_z(i,1) limits_z(i,2) limits_z(i,2) limits_z(i,1)], ...
          '--', 'Color', colors(i,:), 'LineWidth', 1.5);
end

plot3(t(end)*ones(1,4), v1x(end,:), v2x(end,:), '*', 'MarkerEdgeColor', 'r', 'MarkerSize', 8); % 终点


% 
xlabel('Time $t$', 'Interpreter', 'latex');
ylabel('$P^1_i(t)$', 'Interpreter', 'latex');
zlabel('$P^2_i(t)$', 'Interpreter', 'latex');
title('Evolutions of the decisions of four agents', 'Interpreter', 'latex');

% 
grid on;
box on;

view(3);  % 

hold off;








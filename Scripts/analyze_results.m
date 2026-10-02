% analyze_results.m
% Load and plot simulation data for portfolio

% 1. Extract data from the 'out' variable created by Simulink
t = out.current_data.Time;
I_actual = out.current_data.Data;

t_soc = out.soc_data.Time;
SOC = out.soc_data.Data;

% 2. Create the reference signal array for comparison
% (15A before t=1, -15A after t=1)
I_ref = 15 * (t < 1) - 15 * (t >= 1);

% 3. Generate the Figure
fig = figure('Name', 'Bidirectional Charger Performance', 'Position', [100, 100, 900, 700]);

% Top Subplot: Current Tracking
subplot(2,1,1);
plot(t, I_actual, 'b', 'LineWidth', 1.2);
hold on;
plot(t, I_ref, 'r--', 'LineWidth', 1.5);
title('Current Loop Step Response (G2V to V2G Transition)', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Time (s)', 'FontSize', 10);
ylabel('Battery Current (A)', 'FontSize', 10);
legend('Actual Plant Current', 'Reference Target', 'Location', 'best');
grid on;

% Bottom Subplot: State of Charge
subplot(2,1,2);
plot(t_soc, SOC, 'g', 'LineWidth', 2);
title('Battery State of Charge Dynamics', 'FontSize', 12, 'FontWeight', 'bold');
xlabel('Time (s)', 'FontSize', 10);
ylabel('SOC (%)', 'FontSize', 10);
grid on;

% 4. Save the figure to the project root
saveas(fig, '../bidirectional_charger_results.png');
disp('Analysis complete. Graph saved as bidirectional_charger_results.png');
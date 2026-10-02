%% System Parameters
Ts = 1e-5;            % Simulation step size (s)
f_sw = 10000;         % Switching frequency (Hz)
V_dc = 400;           % DC Link Voltage (V)

%% Passive Components
L_val = 2e-3;         % Inductor (2 mH)
C_val = 1000e-6;      % DC Link Capacitor (1000 uF)

%% Battery Parameters
V_batt_nom = 250;     % Nominal Battery Voltage (V)
Batt_cap = 40;        % Battery Capacity (Ah)
Initial_SOC = 50;     % Initial State of Charge (%)

%% Control Loop Gains (PI Controller)
Kp = 0.1;             % Proportional gain
Ki = 15;              % Integral gain

%% Step Response References
I_charge = 15;        % Charging current (G2V) in Amps
I_discharge = -15;    % Discharging current (V2G) in Amps
Step_Time = 1;        % Time to switch modes (s)
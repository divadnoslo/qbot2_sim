% load_qbot2_sim.m

% Initializer for qbot2_sim.slx

% Open Simulink Model
open('qbot2_sim')

% Load Qbot2 Parameters
init_qbot2_params;

% Load Qbot2 IMU Calibration Results
P.IMU_prop_flag = true;
IMU_Error_Properties;

% Plotting Flag
P.plotsim_flag = true;

% load_qbot2_sim.m

% Initializer for qbot2_sim.slx

% % Clear Previous Simulation and Parameter Data
% if (isempty(out) ~= 1)
%     clear out
%     clear P
% end

% Open Simulink Model
open('qbot2_sim')

% Load Qbot2 Parameters
init_qbot2_params;

% Load Qbot2 IMU Calibration Results
P.IMU_prop_flag = true; % set to false for monte carlo
IMU_Error_Properties;

% Load Qbot 2 Motion Plan
P.plot_motion_plan_flag = false; 
qbot2_motion_plan;

% Plotting Flag
P.plotsim_flag = true;

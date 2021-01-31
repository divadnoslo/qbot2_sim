function plot_sim(out, P)

% Provides plots of relevant states quickly and easily

%**************************************************************************
%% Plot Flags -- Turn on/off what plots you want to see!

% Plotting PVA Ground Truth________________________________________________
motion_3D_flag = false;
p_truth_flag   = true;
v_truth_flag   = true;
a_truth_flag   = true;

% Plotting  PVA Measurements_______________________________________________
p_meas_flag = false;
v_meas_flag = false;
a_meas_flag = false;

% Plotting IMU Truth & Meas________________________________________________
accel_truth_flag = true;
accel_meas_flag  = false;
gyro_truth_flag  = true;
gyro_meas_flag   = false;
delta_accel_flag = false;
delta_gyro_flag  = false;

% Plotting PVA Errors______________________________________________________
delta_p_flag = false;
delta_v_flag = false;
delta_a_flag = false;

%**************************************************************************
%% Plot Ground Truth

plot_truth(motion_3D_flag, p_truth_flag, v_truth_flag, a_truth_flag, out, P)

%% PVA Meas ---------------------------------------------------------------

plot_meas(p_meas_flag, v_meas_flag, a_meas_flag, out, P)

%% Plot IMU I/O -----------------------------------------------------------

plot_IMU(accel_truth_flag, accel_meas_flag, ...
                  gyro_truth_flag,  gyro_meas_flag, ...
                  delta_accel_flag, delta_gyro_flag, ...
                  out, P)
              
%% Plot PVA Error ---------------------------------------------------------

plot_error(delta_p_flag, delta_v_flag, delta_a_flag, out, P)

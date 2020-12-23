% init_qbot2_params.m

% Load all paramters regarding the simulation to the workspace

%% Qbot2 Simulation Model Parameters
P.Fs  = 100;                % Sample frequency (Hz)
P.dt  = 1/P.Fs;             % Sample interval (sec)
P.t_start = 0;              % Simulation start time (sec)
P.t_end = 100;              % Simulation end time (sec)

P.fidelity = 1;             % Tan_Mech Attitude Update Parameter 
                            % (0 for low fidelity, 1 for high fidelity)

%% Qbot 2 Physical Specs (from datasheet)
P.mass = 4.5; % kg
P.diameter = 0.35; % m
P.radius = P.diameter / 2;
P.max_speed = 0.7;  % m/s

%% Qbot2 Depth Sensor Range
P.min_range = 0.5; % m
P.max_range = 6; % m

%% Earth Characteristics (WGS-84 Values)
P.w_ie = 72.92115167e-6;                   % Earth's rotational rate (rad/s)
P.w_i__i_e = [0; 0; P.w_ie];               % Angular velocity of {e} wrt {i} resolved in {i} (rad/s)
P.Ohm_i__i_e = [0,      -P.w_ie, 0; ...         % Skew symmetric version of w_i__i_e (rad/s)
                P.w_ie,  0,      0; ...
                0,       0,      0];
P.mu = 3.986004418e14;      % Earth's gravitational constant (m^3/s^2)
P.J2 = 1.082627e-3;         % Earth's second gravitational constant
P.R0 = 6378137.0;           % Earth's equatorial radius (meters)
P.Rp = 6356752.314245;      % Earth's polar radius (meters)
P.e = 0.0818191908425;      % Eccentricity
P.f = 1 / 298.257223563;    % Flattening

%% From ECEF to Tangential Frame (lat/long are from my house)

P.L_b = 48.24816 * pi/180;          % rad
P.lambda_b = -101.30724 * pi/180;   % rad
P.h_b = 491;                        % m
P.C_e__n = Lat_Lon_2C_e__n(P.L_b, P.lambda_b);
P.C_n__t = eye(3); % Subject to change
P.C_e__t = P.C_e__n * P.C_n__t;
P.r_e__e_t = P.C_e__n * [P.R0; 0; 0];
P.Ohm_t__i_e = P.C_e__t' * P.Ohm_i__i_e * P.C_e__t;

%% Gravity Vector
P.g_n__bD = [0; 0; gravity(P.L_b, P.h_b, P)];          % Compute the acceleration due to gravity
P.g_e__b = P.C_e__n * P.g_n__bD;                       % Compute the gravity of the body in the {e} frame
P.g_t__b = P.C_e__t' * P.g_e__b;                       % Compute the gravity of the body in the {t} frame

%% IMU Error Model Terms

load("IMU_Cal_Data/IMU_Cal_Const_Error_Sources.mat")
load("IMU_Cal_Data/IMU_Cal_Varying_Error_Sources.mat")

% Gyro Terms
P.gyro.BI.sigma_n = sigma_n_gyro;
P.gyro.BI.correlation_time = 1; % unknown thus far
P.gyro.b_g_FB = b_g_FB;
P.gyro.sigma_ARW = gyro_std;
P.gyro.M_g = M_g;
P.gyro.G_g = (pi/180) * 0.05 * eye(3); % VN200 data sheet, Cross-Axis Sensitivity
P.gyro.b_g_BS = zeros(3,1); % can set to random values at another time

% Acceleration Terms
P.accel.BI.sigma_n = sigma_n_accel;
P.accel.BI.correlation_time = 1; % Unknown thus far
P.accel.b_a_FB = b_a_FB;
P.accel.sigma_VRW = accel_std;
P.accel.M_a = M_a;
P.accel.b_a_BS = zeros(3,1); % can be set to random later



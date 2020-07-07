% init_qbot2_params.m

% Load all paramters regarding the simulation to the workspace

%% Qbot2 Simulation Model Parameters
P.dt = 1/50;

%% Qbot 2 Physical Specs (from datasheet)
P.mass = 4.5; % kg
P.diameter = 0.35; % m
P.radius = P.diameter / 2;
P.max_speed = 0.7;  % m/s

%% Qbot2 Depth Sensor Range
P.min_range = 0.5; % m
P.max_range = 6; % m

%% Earth Characteristics (WGS-84 Values)
P.w_i__i_e = [0; 0; 72.9e-6];

%% From ECEF to Tangential Frame (lat/long are from my house)
P.radius_earth = 6.378e6; % m
P.lat = 48.24816 * pi/180; % rad
P.long = -101.30724 * pi/180; %rad
P.C_e__n = ...
       [-sin(P.lat)*cos(P.long), -sin(P.long), -cos(P.lat)*cos(P.long); ...
        -sin(P.lat)*sin(P.long), cos(P.long),  -cos(P.lat)*sin(P.long); ...
         cos(P.lat),             0,            -sin(P.lat)];
P.C_n__t = eye(3); % Subject to change
P.C_e__t = P.C_e__n * P.C_n__t;
P.r_e__e_t = P.C_e__t * [P.radius_earth; 0; 0];

%% Gravity Vector
P.e = 0.0818191908425;  % eccentricity
% Somigliana Model
P.g0 = 9.7803253359 * ((1 + 0.001931853*(sin(P.lat)^2)) / ...
                     sqrt(1 - (P.e^2)*(sin(P.lat)^2)));
P.g_t__b = [0; 0; P.g0];

%% Simulation Initial Conditions

P.r_t__t_b_init = [0; 0; 0];
P.v_t__t_b_init = [0; 0; 0];
P.C_t__b_init = eye(3);
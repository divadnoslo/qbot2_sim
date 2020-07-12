function [phi_ba, theta_ba, psi_ba] = dcm2rpy(C_b__a)

% Takes in a DCM, takes its transpose, then returns roll pitch and yaw in
% units of radians. 

C_a__b = C_b__a';

phi_ba = atan2(C_a__b(2,3), C_a__b(3,3));
theta_ba = -asin(C_a__b(1,3));
psi_ba = atan2(C_a__b(1,2), C_a__b(1,1));
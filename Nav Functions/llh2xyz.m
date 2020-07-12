function [r_e__e_b] = llh2xyz(L_b, lambda_b, h_b, P)

%% ll2xyz takes Lat Long Height and converts in x,y,z coords in ECEF

% Radius of Curvature for east-west motion
RE = P.R0 / sqrt(1 - (P.e^2 * sin(L_b)^2));

% X, Y, Z coordinates in ECEF frame
x = (RE + h_b)*cos(L_b)*cos(lambda_b);
y = (RE + h_b)*cos(L_b)*sin(lambda_b);
z = ((1 - P.e^2)*RE + h_b) * sin(L_b);

% Position Vector in ECEF Coordinates
r_e__e_b = [x; y; z];


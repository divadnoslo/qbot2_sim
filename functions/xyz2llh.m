function [L_b, lambda_b, h_b] = xyz2llh(r_e__e_b, P)

%% Converts x,y,z coordinates in the ECEF frame to Lat, Long, Height

x = r_e__e_b(1);
y = r_e__e_b(2);
z = r_e__e_b(3);
r = sqrt(x^2 + y^2);

% Longitude: lambda_b
lambda_b = atan2(y, x);

%% Solve iteratively for L_b and h_b

% Initial Conditions
h_b = 0;
RE = P.R0;

for ii = 1 : 10 % fixed number of iterations
    sin_L_b = z / ((1 - P.e^2)*RE + h_b);
    L_b = atan((z + P.e*P.e*RE*sin_L_b) / r);
    RE = P.R0 / sqrt(1 - P.e^2*sin_L_b^2);
    h_b = (r / cos(L_b)) - RE;
end

end
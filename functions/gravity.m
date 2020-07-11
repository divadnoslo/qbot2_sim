function [g_n__bD] = gravity(L_b, h_b, P)

%% gravity
% Computes the force of gravity experianced by the body frame wrt the nav
% frame when "near" the surface of the earth

% A few constants
e    = P.e;     % Eccentricity
f    = P.f;     % Flattening
R0   = P.R0;    % Equatorial radius in meters
Rp   = P.Rp;    % Polar radius in meters
mu   = P.mu;    % Earth’s gravitational constant (WGS 84 value) in m^3/s^2
w_ie = P.w_ie;  % Earth’s angular rate in radian/sec

%==========================================================================
% Somigliana model from page 47 of text - Eqn 2.85
% Acceleration due to gravity in m/s^2
g_0 = 9.7803253359*(1 + 0.001931853 * sin(L_b)*sin(L_b)) / sqrt(1 - e^2 * sin(L_b)*sin(L_b)); % (m/s^2)

%==========================================================================
% An approximation for the variation of the down component with height
% From: Anon., Department of Defense World Geodetic System 1984
g_n__bD = g_0 * (1 - (2/R0)*(1 + f +(w_ie^2*R0^2*Rp)/mu)*h_b + 3*h_b^2/(R0^2)); % (m/s^2)

end
function [unused] = qbot2_data_logging(u, P)
%QBOT2_DATA_LOGGING Collects data from simulation, returns "out" structure
%with all relevent data

%% Assign Prior State Variables from feedback signal

k = 1;       r_t__t_b = u(k:k+2);
k = k+3;     v_t__t_b = u(k:k+2);
             C_t__b = zeros(3,3);
k = k+3;     C_t__b(:,1) = u(k:k+2);
k = k+3;     C_t__b(:,2) = u(k:k+2);
k = k+3;     C_t__b(:,3) = u(k:k+2);
             t_now = u(end);

%% Create "O" structure to return data

% Initialize Index and 'O' structure
persistent ii 
if (t_now == 0)
    ii = 1;
    O = [];
    assignin('base', 'O', O)
end

% Acquire out structure from base workspace
O = evalin('base', 'O');

% Time
O.time_s(ii) = t_now;

% Position (tangential frame)
O.x_pos_m(ii) = r_t__t_b(1);
O.y_pos_m(ii) = r_t__t_b(2);
O.z_pos_m(ii) = r_t__t_b(3);

% Velocity (tangential frame)
O.x_vel_m(ii) = v_t__t_b(1);
O.y_vel_m(ii) = v_t__t_b(2);
O.z_vel_m(ii) = v_t__t_b(3);

% Attitude (via Euler Angles of the body wrt the t-frame)
phi = atan2(C_t__b(2,3), C_t__b(3,3));
theta = -asin(C_t__b(1,3));
psi = atan2(C_t__b(1,2), C_t__b(1,1));
O.roll_deg(ii) = phi * 180/pi;
O.pitch_deg(ii) = theta * 180/pi;
O.yaw_deg(ii) = psi * 180/pi;


%% Return "O" structure to workspace
assignin('base', 'O', O)
ii = ii + 1;
unused = 0; 

end


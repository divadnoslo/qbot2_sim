% {t} frame is set Noth East Down (NED)
% Position of {b} wrt {t} in the {t} frame (m) 
a = 0.25;
r_t__t_b = [0; 0; 0];
        
% Velocity of {b} wrt {t} in the {t} frame (m/s)
v_t__t_b = [0; 0; 0];
        
% Acceleration of {b} wrt {t} in the {t} frame (m/s^2)
a_t__t_b = [0; 0; 0];

w_t__t_b = zeros(3,1);

C_t__b = eye(3);

% % Figure Eight Parameters
% T = P.t_end;   % Period
% f = 1/T;       % Frequency
% w = 4*pi*f;    % Natural Frequency
% 
% % Figure Eight Amplitudes in {t} frame
% Ax = 1;
% Ay = 0.55;
% Az = 0.025;
% 
% % {t} frame is set Noth East Down (NED)
% % Position of {b} wrt {t} in the {t} frame (m) 
% r_t__t_b = [      Ax*sin(w*t); ...
%                  -Ay*sin((w/2)*t); ...
%              Az - Az*cos((2*w)*t)];
%         
% % Velocity of {b} wrt {t} in the {t} frame (m/s)
% v_t__t_b = [    w * Ax*cos(w*t); ...
%            -(w/2) * Ay*cos((w/2)*t); ...
%             (2*w) * Az*sin((2*w)*t)];
%         
% % Acceleration of {b} wrt {t} in the {t} frame (m/s^2)
% a_t__t_b = [   -w^2 * Ax*sin(w*t); ...
%             (w/2)^2 * Ay*sin((w/2)*t); ...
%             (2*w)^2 * Az*cos((2*w)*t)];
% %          
% % Orientation of {b} wrt {t} in the {t} frame (forward-right-down frame)
% x_axis = v_t__t_b / norm(v_t__t_b); % Due to plant dynamics
% 
% % Determine Pitch and Yaw in {t} frame
% roll = 0;
% pitch = -asin(x_axis(3));
% yaw = atan2(x_axis(2), x_axis(1));
% C_t__b_temp = ypr2dcm(yaw, pitch, roll);
% 
% % Rotate a_t__t_b into {b} frame, compare w/ gravity vector for Roll
% a_b__t_b_temp = C_t__b_temp' * a_t__t_b;
% roll = atan2(a_b__t_b_temp(2), 10);
% C_t__b = ypr2dcm(yaw, pitch, roll); 
% 
% if (init_flag == 0) % first time entering function
%     w_t__t_b = [0; 0; 0];
%     init_flag = 1;
%     C_t__b_old = eye(3);
% else % Be sure to ask about initial method of what went wrong
%     delta_C = C_t__b * C_t__b_old';
%     w_t__t_b = dcm2k(delta_C) / P.dt;
% end

function out = qbot2_kin_update(u, P)
%QBOT2_KIN_UPDATE Updates the kinematic states of the mobile robot
% based on the accelerations and rotation rates it experiances.  

%% Assign Prior State Variables from feedback signal

if (u(end) == 0) % Initial Conditions
    r_t__t_b_old = P.r_t__t_b_init;
    v_t__t_b_old = P.v_t__t_b_init;
    C_t__b_old = P.C_t__b_init;
    
    k = 16;      f_b__i_b = u(k:k+2);
    k = k+3;     w_b__i_b = u(k:k+2);
    k = k+1;     time = u(k);
else
    k = 1;       r_t__t_b_old = u(k:k+2);
    k = k+3;     v_t__t_b_old = u(k:k+2);
    C_t__b_old = zeros(3,3);
    k = k+3;     C_t__b_old(1:3,1) = u(k:k+2);
    k = k+3;     C_t__b_old(1:3,2) = u(k:k+2);
    k = k+3;     C_t__b_old(1:3,3) = u(k:k+2);
    k = k+3;     f_b__i_b = u(k:k+2);
    k = k+3;     w_b__i_b = u(k:k+2);
    k = k+1;     time = u(k);
end

persistent ii 
ii = 1;
disp(ii)
ii = ii + 1;

%% Begin Kinematic State Updates

% C_t__b Rotation Matrix Update
C_t__b_new = (C_t__b_old*(eye(3) + w_b__i_b*P.dt)) - ...
             (P.C_e__t' * skew(-P.w_i__i_e) * P.C_e__t)*C_t__b_old*P.dt;
         
% f_t__t_b Specific Force Update
f_t__t_b = C_t__b_new * f_b__i_b;

% a_t__t_b Acceleration Vector Update
a_t__t_b = f_t__t_b + P.g_t__b - ...
           2*P.C_e__t'*skew(-P.w_i__i_e)*P.C_e__t*v_t__t_b_old*P.dt;
       
% v_t__t_b Velocity Vector Update
v_t__t_b_new = v_t__t_b_old + a_t__t_b*P.dt;

% r_t__t_b Position Vector Update
r_t__t_b_new = r_t__t_b_old + v_t__t_b_old*P.dt + ...
               a_t__t_b*((P.dt^2)/2);
           
%% Assign Updated State Variables to x_out

k = 1;     x_out(k:k+2) = r_t__t_b_new;
k = k+3;   x_out(k:k+2) = v_t__t_b_new;
k = k+3;   x_out(k:k+2) = C_t__b_new(:,1);
k = k+3;   x_out(k:k+2) = C_t__b_new(:,2);
k = k+3;   x_out(k:k+2) = C_t__b_new(:,3);

out = x_out;

end


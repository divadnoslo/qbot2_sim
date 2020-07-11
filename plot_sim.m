% plot_sim.m

% Provides plots of relevant states quickly and easily

%% Plot Flags -- Turn on/off what plots you want to see!

flag_PVA_truth = 1;
flag_PVA_meas = 1;
flag_IMU_truth = 1;
flag_IMU_meas = 1;

% Extract Time
t = out.PVA_Truth.r_t__t_b.Time;

%% PVA Truth

if (flag_PVA_truth)
    
    % Extract Variables
    [pos, vel, rpy] = extract_PVA(out.PVA_Truth.r_t__t_b.Data, ...
                                  out.PVA_Truth.v_t__t_b.Data, ...
                                  out.PVA_Truth.C_t__b.Data);
    
    % Position
    figure
    hold on
    plot(t, pos(1), 'r', t, pos(2), 'g',t, pos(3), 'b')
    title('Position (m)')
    xlabel('Time (s)')
    ylabel('r^t_tb (m)')
    grid on
    legend('r_x (m)', 'r_y (m)', 'r_z (m)', 'Location', 'Best')
    hold off
    
    % Velocity
    figure
    hold on
    plot(O.time_s, O.x_vel_m, 'r', O.time_s, O.y_vel_m, 'g', O.time_s, O.z_vel_m, 'b')
    title('Velocity (m/s)')
    xlabel('Time (s)')
    ylabel('vel (m/s)')
    grid on
    legend('v_x (m)', 'v_y (m)', 'v_z (m)', 'Location', 'Best')
    hold off
    
    % Attitude (Euler Angles)
    figure
    hold on
    subplot(3,1,1)
    plot(O.time_s, O.roll_deg, 'r')
    title('Roll')
    xlabel('Time (s)')
    ylabel('\phi (deg)')
    grid on
    subplot(3,1,2)
    plot(O.time_s, O.pitch_deg, 'g')
    title('Pitch')
    xlabel('Time (s)')
    ylabel('\theta (deg)')
    grid on
    subplot(3,1,3)
    plot(O.time_s, O.yaw_deg, 'b')
    title('Yaw')
    xlabel('Time (s)')
    ylabel('\psi (deg)')
    grid on
    hold off
    
end
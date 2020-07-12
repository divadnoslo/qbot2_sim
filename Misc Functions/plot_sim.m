function plot_sim(out, P)

% Provides plots of relevant states quickly and easily

%% Plot Flags -- Turn on/off what plots you want to see!

flag_PVA_truth = 1;
flag_PVA_meas = 0;
flag_IMU_truth = 1;
flag_IMU_meas = 0;

% Extract Time
t = out.tout;

%% PVA Truth --------------------------------------------------------------

if (flag_PVA_truth)
    
    % Extract Variables
    [pos, vel, rpy] = extract_PVA(out.P_truth.Data, ...
                                  out.V_truth.Data, ...
                                  out.A_truth.Data);
    
    % Position
    figure
    hold on
    plot(t, pos(1,:), 'r', t, pos(2,:), 'g',t, pos(3,:), 'b')
    title('TRUTH: Position (m)')
    xlabel('Time (s)')
    ylabel('r^t_tb (m)')
    grid on
    legend('r_x (m)', 'r_y (m)', 'r_z (m)', 'Location', 'Best')
    hold off
    
    % Velocity
    figure
    hold on
    plot(t, vel(1,:), 'r', t, vel(2,:), 'g', t, vel(3,:), 'b')
    title('TRUTH: Velocity (m/s)')
    xlabel('Time (s)')
    ylabel('vel (m/s)')
    grid on
    legend('v_x (m)', 'v_y (m)', 'v_z (m)', 'Location', 'Best')
    hold off
    
    % Attitude (Euler Angles)
    figure
    hold on
    subplot(3,1,1)
    plot(t, rpy(1,:), 'r')
    title('TRUTH: Roll')
    xlabel('Time (s)')
    ylabel('\phi (deg)')
    grid on
    subplot(3,1,2)
    plot(t, rpy(2,:), 'g')
    title('TRUTH: Pitch')
    xlabel('Time (s)')
    ylabel('\theta (deg)')
    grid on
    subplot(3,1,3)
    plot(t, rpy(3,:), 'b')
    title('TRUTH: Yaw')
    xlabel('Time (s)')
    ylabel('\psi (deg)')
    grid on
    hold off
    
end

%% PVA Meas ---------------------------------------------------------------

if (flag_PVA_meas)
    
    % Extract Variables
    [pos, vel, rpy] = extract_PVA(out.P_meas.Data, ...
                                  out.V_meas.Data, ...
                                  out.A_meas.Data);
    
    % Position
    figure
    hold on
    plot(t, pos(1,:), 'r', t, pos(2,:), 'g',t, pos(3,:), 'b')
    title('MEAS: Position (m)')
    xlabel('Time (s)')
    ylabel('r^t_tb (m)')
    grid on
    legend('r_x (m)', 'r_y (m)', 'r_z (m)', 'Location', 'Best')
    hold off
    
    % Velocity
    figure
    hold on
    plot(t, vel(1,:), 'r', t, vel(2,:), 'g', t, vel(3,:), 'b')
    title('MEAS: Velocity (m/s)')
    xlabel('Time (s)')
    ylabel('vel (m/s)')
    grid on
    legend('v_x (m)', 'v_y (m)', 'v_z (m)', 'Location', 'Best')
    hold off
    
    % Attitude (Euler Angles)
    figure
    hold on
    subplot(3,1,1)
    plot(t, rpy(1,:), 'r')
    title('MEAS: Roll')
    xlabel('Time (s)')
    ylabel('\phi (deg)')
    grid on
    subplot(3,1,2)
    plot(t, rpy(2,:), 'g')
    title('MEAS: Pitch')
    xlabel('Time (s)')
    ylabel('\theta (deg)')
    grid on
    subplot(3,1,3)
    plot(t, rpy(3,:), 'b')
    title('MEAS: Yaw')
    xlabel('Time (s)')
    ylabel('\psi (deg)')
    grid on
    hold off
    
end

%% IMU Truth --------------------------------------------------------------

if (flag_IMU_truth)
    
    % Accels:  Specific Force (N)
    figure
    hold on
    subplot(3,1,1)
    plot(t, out.accel_truth.Data(:,1), 'r')
    title('IMU Truth: X-axis specific force')
    xlabel('Time (s)')
    ylabel('Acceleration (m/s^2)')
    grid on
    subplot(3,1,2)
    plot(t, out.accel_truth.Data(:,2), 'g')
    title('IMU Truth: Y-axis specific force')
    xlabel('Time (s)')
    ylabel('Acceleration (m/s^2)')
    grid on
    subplot(3,1,3)
    plot(t, out.accel_truth.Data(:,3), 'b')
    title('IMU Truth: Z-axis specific force')
    xlabel('Time (s)')
    ylabel('Acceleration (m/s^2)')
    grid on
    hold off
    
    % Gyros:  Rotation Rates  (deg/s)
    figure
    hold on
    subplot(3,1,1)
    plot(t, out.gyro_truth.Data(:,1) * 180/pi, 'r')
    title('IMU Truth: X-axis angular velocity')
    xlabel('Time (s)')
    ylabel('Angular Velocity (deg/s)')
    grid on
    subplot(3,1,2)
    plot(t, out.gyro_truth.Data(:,2) * 180/pi, 'g')
    title('IMU Truth: Y-axis angular velocity')
    xlabel('Time (s)')
    ylabel('Angular Velocity (deg/s)')
    grid on
    subplot(3,1,3)
    plot(t, out.gyro_truth.Data(:,3) * 180/pi, 'b')
    title('IMU Truth: Z-axis angular velocity')
    xlabel('Time (s)')
    ylabel('Angular Velocity (deg/s)')
    grid on
    
end

%% IMU Meas --------------------------------------------------------------

if (flag_IMU_meas)
    
    % Accels:  Specific Force (N)
    figure
    hold on
    subplot(3,1,1)
    plot(t, out.accel_meas.Data(:,1), 'r')
    title('IMU Meas: X-axis specific force')
    xlabel('Time (s)')
    ylabel('Acceleration (m/s^2)')
    grid on
    subplot(3,1,2)
    plot(t, out.accel_meas.Data(:,2), 'g')
    title('IMU Meas: Y-axis specific force')
    xlabel('Time (s)')
    ylabel('Acceleration (m/s^2)')
    grid on
    subplot(3,1,3)
    plot(t, out.accel_meas.Data(:,3), 'b')
    title('IMU Meas: Z-axis specific force')
    xlabel('Time (s)')
    ylabel('Acceleration (m/s^2)')
    grid on
    hold off
    
    % Gyros:  Rotation Rates  (deg/s)
    figure
    hold on
    subplot(3,1,1)
    plot(t, out.gyro_meas.Data(:,1) * 180/pi, 'r')
    title('IMU Meas: X-axis angular velocity')
    xlabel('Time (s)')
    ylabel('Angular Velocity (deg/s)')
    grid on
    subplot(3,1,2)
    plot(t, out.gyro_meas.Data(:,2) * 180/pi, 'g')
    title('IMU Meas: Y-axis angular velocity')
    xlabel('Time (s)')
    ylabel('Angular Velocity (deg/s)')
    grid on
    subplot(3,1,3)
    plot(t, out.gyro_meas.Data(:,3) * 180/pi, 'b')
    title('IMU Meas: Z-axis angular velocity')
    xlabel('Time (s)')
    ylabel('Angular Velocity (deg/s)')
    grid on
    
end

end
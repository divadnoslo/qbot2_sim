function plot_kalman_filter_tuning(r_KF_flag, v_KF_flag, psi_KF_flag, residuals_flag, out, P)
% Plots truth minus estimate for error, w/ Covariance Matrix

% Extract Time
t = out.tout;

% Format P
P = format_P(out.P_posteriori.Data);

if (r_KF_flag == true)
    
    % Calculate Truth minus Error
    r_error = out.delta_r_t__t_b.Data' - out.delta_x_t__t_b_est.Data(:,(1:3))';
    
    figure
    subplot(3,1,1)
    hold on
    plot(t, r_error(1,:), 'r')
    plot(t, P(7,:), 'k', t, -P(7,:), 'k')
    title('r^t_t_b_,_x error = tan error mech - KF estimates')
    xlabel('Time (s)')
    xlim([0 t(end)])
    ylabel('Position (m)')
    legend('r_x error', '\sigma_1_,_1', '-\sigma_1_,_1', 'Location', 'Best')
    grid on
    
    subplot(3,1,2)
    hold on
    plot(t, r_error(2,:), 'g')
    plot(t, P(8,:), 'k', t, -P(8,:), 'k')
    title('r^t_t_b_,_y error = tan error mech - KF estimates')
    xlabel('Time (s)')
    xlim([0 t(end)])
    ylabel('Position (m)')
    legend('r_y error', '\sigma_2_,_2', '-\sigma_2_,_2', 'Location', 'Best')
    grid on
    
    subplot(3,1,3)
    hold on
    plot(t, r_error(3,:), 'b')
    plot(t, P(9,:), 'k', t, -P(9,:), 'k')
    title('r^t_t_b_,_z error = tan error mech - KF estimates')
    xlabel('Time (s)')
    xlim([0 t(end)])
    ylabel('Position (m)')
    legend('r_z error', '\sigma_3_,_3', '-\sigma_3_,_3', 'Location', 'Best')
    grid on
    
end


if (v_KF_flag == true)
    
    % Calculate Truth minus Error
    v_error = out.delta_v_t__t_b.Data' - out.delta_x_t__t_b_est.Data(:,(4:6))';
    
    figure
    subplot(3,1,1)
    hold on
    plot(t, v_error(1,:), 'r')
    plot(t, P(4,:), 'k', t, -P(4,:), 'k')
    title('v^t_t_b_,_x error = tan error mech - KF estimates')
    xlabel('Time (s)')
    xlim([0 t(end)])
    ylabel('Velocity (m/s)')
    legend('v_x error', '\sigma_4_,_4', '-\sigma_4_,_4', 'Location', 'Best')
    grid on
    
    subplot(3,1,2)
    hold on
    plot(t, v_error(2,:), 'g')
    plot(t, P(5,:), 'k', t, -P(5,:), 'k')
    title('v^t_t_b_,_y error = tan error mech - KF estimates')
    xlabel('Time (s)')
    xlim([0 t(end)])
    ylabel('Velocity (m/s)')
    legend('v_y error', '\sigma_5_,_5', '-\sigma_5_,_5', 'Location', 'Best')
    grid on
    
    subplot(3,1,3)
    hold on
    plot(t, v_error(3,:), 'b')
    plot(t, P(6,:), 'k', t, -P(6,:), 'k')
    title('v^t_t_b_,_z error = tan error mech - KF estimates')
    xlabel('Time (s)')
    xlim([0 t(end)])
    ylabel('Velocity (m/s)')
    legend('v_z error', '\sigma_6_,_6', '-\sigma_6_,_6', 'Location', 'Best')
    grid on
    
end


if (psi_KF_flag == true)
    
        % Calculate Truth minus Error
    psi_error = out.delta_psi_t__t_b.Data' - out.delta_x_t__t_b_est.Data(:,(7:9))';
    
    figure
    subplot(3,1,1)
    hold on
    plot(t, psi_error(1,:) * 180/pi, 'r')
    plot(t, P(1,:) * 180/pi, 'k', t, -P(1,:) * 180/pi, 'k')
    title('\psi^t_t_b_,_\phi error = tan error mech - KF estimates')
    xlabel('Time (s)')
    xlim([0 t(end)])
    ylabel('Roll (\circ)')
    legend('\phi error', '\sigma_7_,_7', '-\sigma_7_,_7', 'Location', 'Best')
    grid on
    
    subplot(3,1,2)
    hold on
    plot(t, psi_error(2,:) * 180/pi, 'g')
    plot(t, P(2,:) * 180/pi, 'k', t, -P(2,:) * 180/pi, 'k')
    title('\psi^t_t_b_,_\theta error = tan error mech - KF estimates')
    xlabel('Time (s)')
    xlim([0 t(end)])
    ylabel('Pitch (\circ)')
    legend('\theta error', '\sigma_8_,_8', '-\sigma_8_,_8', 'Location', 'Best')
    grid on
    
    subplot(3,1,3)
    hold on
    plot(t, psi_error(3,:) * 180/pi, 'b')
    plot(t, P(3,:) * 180/pi, 'k', t, -P(3,:) * 180/pi, 'k')
    title('\psi^t_t_b_,_\psi error = tan error mech - KF estimates')
    xlabel('Time (s)')
    xlim([0 t(end)])
    ylabel('Yaw (\circ)')
    legend('\psi error', '\sigma_9_,_9', '-\sigma_9_,_9', 'Location', 'Best')
    grid on
    
end

if (residuals_flag == true)
    
    
    figure
    subplot(3,1,1)
    hold on
    plot(t, out.residuals.Data(:,1:3))
    title('angular measurement residuals')
    xlabel('Time (s)')
    xlim([0 t(end)])
    ylabel('error')
    grid on
    
    subplot(3,1,2)
    hold on
    plot(t, out.residuals.Data(:,4:6))
    title('velocity measurement residuals')
    xlabel('Time (s)')
    xlim([0 t(end)])
    ylabel('error')
    grid on
    
    subplot(3,1,3)
    hold on
    plot(t, out.residuals.Data(:,7:9))
    title('position measurement residuals')
    xlabel('Time (s)')
    xlim([0 t(end)])
    ylabel('error')
    grid on
    
    
end

end


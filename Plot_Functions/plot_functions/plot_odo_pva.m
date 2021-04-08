function plot_odo_pva(r_odo_flag, v_odo_flag, a_odo_flag, out, P)
% plots odometry PVA

% Extract Time
t = out.tout;

%% Plot delta P
if (r_odo_flag == true)
    
    % Position from Odometry
    figure
    hold on
    subplot(2,1,1)
    plot(t, out.r_t__t_b_odo.Data(:,1), 'r')
    title('r^t_t_b_,_x_,_o_d_o')
    xlabel('Time (s)')
    xlim([0 P.t_end])
    ylabel('Position (m)')
    grid on
    subplot(2,1,2)
    plot(t, out.r_t__t_b_odo.Data(:,2), 'g')
    title('r^t_t_b_,_y_,_o_d_o')
    xlabel('Time (s)')
    xlim([0 P.t_end])
    ylabel('Position (m)')
    grid on
    
end


%% Plot delta V
if (v_odo_flag == true)
    
    % Velocity from Odometry
    figure
    hold on
    subplot(2,1,1)
    plot(t, out.v_t__t_b_odo.Data(:,1), 'r')
    title('v^t_t_b_,_x_,_o_d_o')
    xlabel('Time (s)')
    xlim([0 P.t_end])
    ylabel('Velocity (m)')
    grid on
    subplot(2,1,2)
    plot(t, out.v_t__t_b_odo.Data(:,2), 'g')
    title('v^t_t_b_,_y_,_o_d_o')
    xlabel('Time (s)')
    xlim([0 P.t_end])
    ylabel('Velocity (m)')
    grid on

end

%% Plot delta A
if (a_odo_flag == true)
    
    % Attitude from Odometry
    figure
    plot(t, out.psi_t__t_b_odo.Data(:,3) * 180/pi, 'b')
    title('\psi^t_t_b_,_o_d_o')
    xlabel('Time (s)')
    xlim([0 P.t_end])
    ylabel('Heading (\circ)')
    grid on

end


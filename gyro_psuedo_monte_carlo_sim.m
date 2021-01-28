%% Puedo Monte Carlo Simulation
% Really just doing 50 runs of each sensor error type to see how they
% compare.  Might have to get more detailed later.  

%% Important:  Set Flag to either re-run 50 sims, or just plot data
rerun_flag = false;

%% Define Monte Carlo Parameters

num_runs = 50;
color_str = ['r', 'g', 'c', 'b', 'm'];

load_qbot2_sim
delta_x = zeros(num_runs, length(0:P.dt:P.t_end));
delta_y = zeros(num_runs, length(0:P.dt:P.t_end));
delta_z = zeros(num_runs, length(0:P.dt:P.t_end));
delta_r = zeros(num_runs, length(0:P.dt:P.t_end));

%% ReRun if required -- Begin Simulation

if (rerun_flag == true)
    
    % Load Simulation
    load_qbot2_sim
      
    tic
    
    % Begin Loop
    for kk = 1 : num_runs
        
        %     % Re-Initialize
        %     close all
        %     clear all
        %     clc
        
        % Randomly Re-Seed RNG
        % rng(rand)
        
        % Run Simulation -- plot_sim() in StopFcn commented out!
        out = sim('qbot2_sim');
        
        % Isolate the Position Error
        if (kk == 1)
            t = out.tout;
        end
        delta_xyz = out.delta_r_t__t_b.Data;
        
        
        % Isolate XYZ errors
        delta_x(kk,:) = delta_xyz(:,1);
        delta_y(kk,:) = delta_xyz(:,2);
        delta_z(kk,:) = delta_xyz(:,3);
        
        % Find the magntiude of the position error
        for jj = 1 : length(delta_xyz)
            delta_r(kk,jj) = sqrt(delta_xyz(jj,1)^2 + delta_xyz(jj,2)^2 + delta_xyz(jj,3)^2);
        end
        
        % Clear Simulation Output
        clear out
        
    end
    
    % Program Stats
    toc
    beep
    
    % So how bad was it?
    end_error = delta_r(:,end);
    avg_error = mean(end_error);
    
% If NOT reprocessing the psuedo monte carlo
else
    load('gyro_monte_carlo.mat')
end
    
% %% Ending Error Plot
% 
% % Print Resulting Error
% fprintf('Ending Average Position Error:  %4.3f m \n', avg_error)
% 
% % Plot Error of Each Run
% figure;
% hold on
% plot(1:num_runs, end_error, 'k*')
% title('Ending Position Error of each Run')
% xlabel('Run #')
% ylabel('Ending \deltar^t_t_b (m)')
% grid on
% hold off

%% Subplots of X, Y, and Z position error

fig_num = 1;

figure(fig_num)
hold on
for ii = 1 : num_runs
    plot(t, delta_x(ii,:), color_str(mod(ii, length(color_str)) + 1))
end
title('Monte Carlo:  Error in X-Position')
xlabel('Time (s)')
ylabel('\deltar_x (m)')
grid on
hold off

fig_num = 2;

figure(fig_num)
hold on
for ii = 1 : num_runs
    plot(t, delta_y(ii,:), color_str(mod(ii, length(color_str)) + 1))
end
title('Monte Carlo:  Error in Y-Position')
xlabel('Time (s)')
ylabel('\deltar_y (m)')
grid on
hold off
fig_num = 3;

figure(fig_num)
hold on
for ii = 1 : num_runs
    plot(t, delta_z(ii,:), color_str(mod(ii, length(color_str)) + 1))
end
title('Monte Carlo:  Error in Z-Position')
xlabel('Time (s)')
ylabel('\deltar_z (m)')
grid on
hold off

%% Extracting the StdDev at each timestep

for ii = 1 : length(t)
    
    % Std-Dev in X at each time step
    sigma_x(ii) = std(delta_x(:,ii));
    
    % Std-Dev in Y at each time step
    sigma_y(ii) = std(delta_y(:,ii));
    
    % Std-Dev in Z at each time step
    sigma_z(ii) = std(delta_z(:,ii));
    
end
    
figure
subplot(3,1,1)
hold on
plot(t, (1/6)*abs(P.gyro.b_g_FB(1)*t.^3), 'k:')
plot(t, sigma_x, 'r')
title('Std-Dev in X-Position Error')
xlabel('Time (s)')
ylabel('\sigma_x (m)')
grid on
hold off
subplot(3,1,2)
hold on
plot(t, (1/6)*abs(P.gyro.b_g_FB(2)*t.^3), 'k:')
plot(t, sigma_y, 'g')
title('Std-Dev in Y-Position Error')
xlabel('Time (s)')
ylabel('\sigma_y (m)')
grid on
hold off
subplot(3,1,3)
hold on
plot(t, (1/6)*abs(P.gyro.b_g_FB(3)*t.^3), 'k:')
plot(t, sigma_z, 'b')
title('Std-Dev in Z-Position Error')
xlabel('Time (s)')
ylabel('\sigma_z (m)')
grid on
legend('Expected Error Growth', 'Error Std Dev of 50 Sims', 'Location', 'Best')
hold off

%% Monte Carlo Sim Plot

figure
hold on
for kk = 1 : num_runs
    plot(t, delta_r(kk,:), color_str(mod(kk, length(color_str)) + 1))
end
line([t(1) t(end)], [avg_error avg_error], 'Color', 'red', 'LineStyle', '--')
text(0.5, avg_error + 0.1 * avg_error, 'Average Ending Position Error')
text(0.5, avg_error - 0.1 * avg_error, [num2str(avg_error), ' m'])
title('Monte Carlo:  \delta|r^t_t_b|  -- Position Error via Gyro Errors Only')
xlabel('Time (s)')
ylabel('\delta|r^t_t_b| (m)')
grid on
hold off

%% Save Output

if (rerun_flag == true)
    
    save('gyro_monte_carlo.mat', 't', 'delta_xyz', 'delta_x', 'delta_y', ...
         'delta_z', 'delta_r', 'end_error', 'avg_error', 'num_runs', 'color_str')
    
end



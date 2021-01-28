%% You need to put a debug point on the dummy action in ECEF to ECI

lat = 48.24816 * pi/180;          % rad
lon = -101.30724 * pi/180;   % rad
r = [1.5 0 0]';

figure
hold on
plot_frame(eye(3), [0; 0; 0], 'e', 'k')

C1 = rotate_z(lon);
plot_frame(C1, C1*r, '1', 'b')

C2 = C1 * rotate_y(-lat - pi/2);
plot_frame(C2, C2*r, '2', 'r')

grid on
axis equal
hold off

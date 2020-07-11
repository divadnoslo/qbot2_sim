function [C] = Rodrigues_k(k, theta)

%% Rodrigues_k 
% Computes the resulting DCM from some angle and axis of rotation.  Input
% can be a unit vector and angle, or simply the angular velocity vector.
% The angular velocity vector normalized resulting in said unit vector for
% the axis of rotation, and its magnitude is the rotation angle itself.  

if (nargin == 1)
    theta = norm(k);
    k = k / theta;
end

    K = skew(k);
    
    C = eye(3) + sin(theta)*K + (1 - cos(theta))*(K*K);
    
end

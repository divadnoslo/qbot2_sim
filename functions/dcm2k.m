function [k] = dcm2k(C)

% dcm2k takes in a DCM and returns k (unnormalized)
% k = unit_vec(k) * theta

theta = acos((trace(C) - 1)/2);

k_unit_vec = (1/(2*sin(theta))) * [C(3,2) - C(2,3); ...
                                   C(1,3) - C(3,1); ...
                                   C(2,1) - C(1,2)];
                               
k = theta * k_unit_vec;
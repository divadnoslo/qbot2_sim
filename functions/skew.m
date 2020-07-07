function [out] = skew(in)
%SKEW provides the skew-symmetric matrix of a vector

out = [0, -in(3), in(2); ...
       in(3), 0, -in(1); ...
       -in(2), in(1), 0];
   
end


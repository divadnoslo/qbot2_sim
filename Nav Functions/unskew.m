function [out] = unskew(in)
%UNSKEW returns the vector from a skew-symmetric matrix

out = [in(3,2); in(1,3); in(2,1)];

end


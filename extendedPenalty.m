function [fx] = extendedPenalty(x)
% Extended Penalty Function
n = length(x);
m = n - 1;
c = 0;
d = 0;
fx = 0;
for k =1:m
    cu = (x(k) - 1)^2;
    c = c + cu;
    d = d + x(k)^2 - .25;
end
d = d + x(n)^2-.25;
fx = c + d^2;



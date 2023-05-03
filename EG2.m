function [fx] = EG2(x)
% 
n = length(x);
m = n-1;
suma = 0;
for i= 1:m
    suma = suma + sin(x(1)+x(i)^2-1)+.5*(sin(x(n)^2));
end

fx = suma;
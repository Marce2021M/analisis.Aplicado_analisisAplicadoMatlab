function [fx] = funlanczos2(x)
load data2
% t .- vector de tiempos
% y.- datos observados, y(i) datos al tiempo t(i)
% m .- números de datos obsrrvados. 


fx = 0;
 for i = 1:m
     b = x(1)*exp(-1*x(2)*t(i)) + x(3)*exp(-1*x(4)*t(i)) + x(5)*exp(-1*x(6)*t(i));
     fx = fx + (y(i) - b)^2;

 end
 % ^º⁓º
fx = fx/2;

end

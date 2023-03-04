function [fx] = rosenbrock(x)
% Función de Rosenbrock para probar algoritmos de minimización
%   Análisis Aplicado
% ITAM
% 19 de enero de 2023

a = x(1); b = x(2);
fx = 100*(b-a^2)^2 + ( 1- a)^2;
end

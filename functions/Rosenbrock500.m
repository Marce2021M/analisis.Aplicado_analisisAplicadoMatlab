function [fx] = Rosenbrock500(x)
% Función de Rosenbrock de dimensión 500. Es la generalización
% de la función de Rosenbrock de dimensión 2.
% f(x) = sum_{k=1}^{50} [ (x(2*k) - x(2*k-1)^2)^2 + (1 -x(2*k-1))^2]
% El mínimo de la función es le punto x* = [1, 1, . . ., 1]';
% In.
% In.
% x.- vector columna de dimensión 500.
% Out
%fx.- número real.
% 
% Análisis Aplicado
% ITAM
%  6 de noviembre de 2015


n = length(x);

if (n==500)
  fx = 0;
  for k = 1:250
      fx = fx + (x(2*k) - x(2*k -1)^2)^2;
      fx = fx +(1 -x(2*k-1))^2;
  end  
else
    disp('La dimension no es correcta')
    fx =[];
end
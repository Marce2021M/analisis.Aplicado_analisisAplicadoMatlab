function [xf,k] = newton(fname,x)
% Método de Newton para fname_R^n --> R^n
% iniciando en el punto x cercano a la raíz
% x*.

tol = 1e-05; % tolerancia a la norma del gradiente
kmax = 50;
Fx = feval(fname,x);
k = 0;

while( norm(Fx) > tol && k < kmax)
    J = jacobiana(fname,x);
    s = -(J\Fx);
    x = x + s;
    Fx = feval(fname,x);
    k = k+1;
    fprintf('%2.0f % 2.12f \n', k, norm(Fx))
end
xf = x;
end

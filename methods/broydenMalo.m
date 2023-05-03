function [xf, k] = broydenMalo(fname,x)
tol = 1e-05; % tolerancia a la norma del gradiente
kmax = 50;
Fx = feval(fname,x);
k = 0;
n = length(x);
% A = eye(n);
A = jacobiana(fname,x);
while( norm(Fx) > tol && k < kmax)
    s = -(A\Fx);
    xp = x + s;
    Fxp = feval(fname,xp);
    y = Fxp - Fx;
    u = s-A*y;
    A = A + (u*y')\(y'*y);
    Fx = Fxp;
    x = xp;
    k = k+1;
    fprintf('%2.0f % 2.12f \n', k, norm(Fx))
end
xf = xp;

end
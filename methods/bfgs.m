function [ xf, j ] = bfgs(fname, x)
% 

tol = 1e-05;  % tolerancia a la norma del gradiente
jmax = 100;   % número máximo de iteraciones
c1 = 0.0001;     % parámetro para np dar pasos grandes
kmax = 10;     % número  máximo de pasos hacia atrás

g = gradiente(fname,x);  fx = feval(fname,x);
n = length(x);
A = eye(n);
j = 0;
while (norm(g) > tol && j < jmax )
    p = pcg(A, -g);    % dirección de descenso
    
    % búsqueda de línea
    alfa = 1.0;
    xp = x + alfa*p;
    fxp = feval(fname,xp);
    k = 0;
    while( fxp > fx + alfa*( c1*g'*p ) && k < kmax)
        alfa = alfa/2;
        xp = x + alfa*p;
        fxp = feval(fname,xp);  
        k = k+1;
    end
    %------------------------------------
    if (k ==kmax)
        alfa = 1.0;
    end
    xp = x + alfa*p;
    gxp = gradiente(fname,xp);
    s = xp -x;  y = gxp-g;
    
    u = A*s;
    A = A + ( (y*y')/(y'*s) ) - ((u*u')/(s'*A*s) ) ;
        
    x = xp;
    g = gxp;
    j = j+1;
    fprintf('%2.0f %2.8f \n ',j,norm(g)  )
end

xf = x;

end


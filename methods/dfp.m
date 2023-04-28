function [ xf, MG, j ] = dfp(fname, x)
% 

tol = 1e-05;  % tolerancia a la norma del gradiente
jmax = 50;   % número máximo de iteraciones
c1 = 0.0001;     % parámetro para np dar pasos grandes
kmax = 10;     % número  máximo de pasos hacia atrás

g = gradiente(fname,x);  fx = feval(fname,x);
MG = norm(g);
n = length(x);
A = eye(n);
j = 0;
while (norm(g) > tol && j < jmax )
    p = -A*g;    % dirección de descenso
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
    %if (k ==kmax)
    %    alfa = 1.0;
    %end
    xp = x + alfa*p;
    gxp = gradiente(fname,xp);
    s = xp -x;  y = gxp-g;
    trial = y'*s;
    if(trial > 1.e-05)
        gamma = 1/(trial);
        C = eye(n) - gamma*(s*y');
        A = C'*A*C+gamma*(s*s');
    else
        A = eye(n);
    end
    
    x = xp;
    g = gxp;
    j = j+1;
    MG = norm(g);
    fprintf('%2.0f %2.8f \n ',j,norm(g))
end

xf = x;

end

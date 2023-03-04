function [g] = gradiente(fname,a)
% Aproximación del gradiente de fname en a
%   
 
h = 0.00001;
n = length(a);
fa = feval(fname,a);
ca = a;
g = zeros(n,1);
for i =1:n
    %ca = a;
    ca(i) = ca(i)+h;
    fai = feval(fname,ca);
    g(i) = (fai-fa )/h;
    ca(i) = a(i);
end

end


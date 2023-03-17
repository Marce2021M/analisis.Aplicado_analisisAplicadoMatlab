function [fx] = ferweb(x)
load Puntos
[n,m] = size(A);

fx = 0;
for j = 1:m
    v = A(:,j);
    fx = fx + exp(j) * norm(v-x);
    
end

end


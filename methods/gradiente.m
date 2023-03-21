function [g] = gradiente(fname, a)
% Approximation of the gradient of the function fname at a 

%% PARAMS
h = 1E-5; % step size for finite difference approximation

%% Initial vars
n = length(a); % number of variables
fa = feval(fname,a); % evaluate function at a
ca = a;
g = zeros(n,1); % initialize gradient vector

%% Main loop
for i = 1:n    
    ca(i) = ca(i) + h; % increment ith variable by h
    fai = feval(fname, ca); % evaluate function at new point
    g(i) = (fai - fa) / h; % finite difference approximation of the ith partial derivative
    ca(i) = a(i); % reset ith variable
end
end



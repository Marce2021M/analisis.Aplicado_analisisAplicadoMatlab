function [H] = hessiana(fname,x)
% This is a function that computes an approximation to the Hessian matrix
% of a given function at a given point.

h = 1e-05; % step size for finite differences
h2 = h * h; % precompute h^2 for efficiency
n = length(x); % dimension of input vector
H = zeros(n); % initialize Hessian matrix to all zeros
fx = feval(fname,x); % evaluate function at given point

for j = 1:n % loop over columns of Hessian
    x1 = x; x1(j) = x1(j) + h; % perturb jth component of x
    fx1 = feval(fname,x1); % evaluate function at perturbed point

    for i = 1:j % loop over upper triangle of Hessian
        x2 = x; x2(i) = x2(i) + h; % perturb ith component of x
        x3 = x1; x3(i) = x3(i) + h; % perturb ith component of x1
        % note: x3(j) = x1(j) by construction
        fx2 = feval(fname,x2); % evaluate function at perturbed point
        fx3 = feval(fname,x3); % evaluate function at doubly-perturbed point
        H(i,j) = (fx3 - fx2 - fx1 + fx) / h2; % finite difference approximation of mixed partial derivative
        H(j,i) = H(i,j); % Hessian is symmetric
    end
end



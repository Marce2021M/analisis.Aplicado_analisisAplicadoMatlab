function [x,k] = migc(A,b)

% This is a function that implements the method of conjugate gradients
% to solve a linear system of the form Ax = b, where A is a positive
% definite symmetric matrix.

n = length(b); % dimension of system
x = zeros(n,1); % initialize solution to all zeros
r = A*x - b; % compute initial residual
p = -r; % set initial search direction to negative residual
kmax = n*n; % maximum number of iterations
k = 0; % initialize iteration counter

while (norm(r) > 1.e-08 && k < kmax) % loop until convergence or max iterations
   alpha = -(r'*p)/(p'*A*p); % compute step size
   x = x + alpha * p; % update solution
   r = A*x - b; % compute new residual
   betha = (r'*A*p)/(p'*A*p); % compute correction factor for search direction
   p = -r + betha*p; % update search direction
   k = k + 1; % increment iteration counter
end

% The function returns the solution x and the number of iterations k.
end
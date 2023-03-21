function [xf, j] = desmax(fname, x)
% desmax - Maximum descent method for finding a local maximum
%
% Syntax:
%   [xf, j] = desmax(fname, x)
%
% Inputs:
%   fname - Name of the function to maximize
%   x - Starting point
%
% Outputs:
%   xf - Local maximum
%   j - Number of iterations
%
% Description:
%   This function uses the maximum descent method to find a local maximum
%   of the function 'fname' starting from the point 'x'.
%
%   In this implementation, the stopping criterion is a small norm of the
%   gradient, and the step size is chosen using a line search algorithm
%   that satisfies the Armijo condition (also known as the backtracking
%   line search).
%% PARAMS

tol = 1e-05;   % Tolerance for the norm of the gradient
jmax = 100;    % Maximum number of iterations
c1 = 0.0001;   % Parameter to not take large steps
kmax = 100;    % Maximum number of backtracking steps

%% Initial vars
g = gradiente(fname,x);  % Compute the gradient at the starting point
fx = feval(fname,x);     % Compute the function value at the starting point
j = 0;                   % Initialize the iteration counter

%% Main loop of the maximum descent method
while (norm(g) > tol && j < jmax )
    
    p = -g;      % Direction of descent
    
    %% Backtracking line search
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
    
    %% Update the point and the gradient
    x = x +alfa*p;
    fx = feval(fname,x);
    g = gradiente(fname,x);
    j = j+1;     % Increment the iteration counter
    
end

xf = x;   % Set the output to the current point

end



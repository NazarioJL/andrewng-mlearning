function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

lr = (lambda / (2 * m)) .* sum(theta(2:end, 1) .^ 2);

% calculate prediction h_thetha(x) and error E
E = X * theta - y;

% calculate cost function
J = (1 / (2 * m)) .* sum(E .^ 2) + lr;

theta_tmp = theta;

% regularization is 0 for j = 0
theta_tmp(1) = 0; 

% vectorized implementation 
grad = (1 / m) .* (X' * (E) + lambda .* theta_tmp);

% unroll gradient parameters 
grad = grad(:);

end

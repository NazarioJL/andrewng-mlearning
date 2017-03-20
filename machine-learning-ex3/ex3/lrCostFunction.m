function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
p = sigmoid(X * theta);

theta(1) = 0; % set to 0 for regularization

r_param = (lambda / (2 * m)) * sum(theta(2:end) .^ 2);
J = (1 / m) * (-y' * log(p) - (1 - y') * log(1 - p)) + r_param;

grad = ((1 / m) * (X' * (p - y))) + (lambda  / m) * theta;

grad = grad(:);

end
function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly
n = length(theta);

% regularizarion parameter
r_param = (lambda / (2 * m)) * sum(theta(2:end) .^ 2); % do not include theta_0 (theta(1))
J = (1 / m) * sum(-y .* log(sigmoid(X*theta)) - (1 - y) .* (log(1-sigmoid(X*theta)))) + r_param;
grad = zeros(size(theta));

for j = 1:n
    if j == 1 % we do not want to regularize theta_0
        r_p = 0;
    else
        r_p = (lambda  / m) * theta(j);
    end;
    grad(j) = (1 / m) * sum((sigmoid(X*theta) - y) .* X(:,j)) + r_p;
end % for

end

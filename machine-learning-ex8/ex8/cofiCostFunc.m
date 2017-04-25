function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

% calculate regularization terms
reg_theta = lambda.*sum(sum(Theta.^2)) / 2;
reg_X = lambda.*sum(sum(X.^2)) / 2;

% cost function
J = (1/2) * sum(sum(((X*Theta').*R - Y.*R).^2)) + reg_theta + reg_X;	

% gradients
X_grad = (((X*Theta').*R*Theta - Y.*R*Theta)+lambda.*X);
Theta_grad = ((X'*((X*Theta').*R) - X'*(Y.*R)))' + lambda.*Theta;

grad = [X_grad(:); Theta_grad(:)];

end

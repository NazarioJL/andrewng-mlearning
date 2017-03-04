function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters
    % Save the cost J in every iteration    
    feature_count = size(X,2);
    tmp_theta = zeros(feature_count, 1);
    
    % use generalized form for multi-variate
    for j = 1:feature_count
        % calculate descent
        desc = sum((X * theta - y) .* X(:, j));
        tmp_theta(j) = theta(j) - alpha / m * desc;
    end
    
    % replace values of theta
    theta = tmp_theta;
    
    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);
end

end

function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);

% create cost variable J 
J = 0;

% create label vector
label_vector = linspace(1, num_labels, num_labels)';

D2 = zeros(size(Theta2));
D1 = zeros(size(Theta1));

% TODO: implement vectorized form of this function
% loop over each sample
for i = 1:m
    % Y is a column vector with a 1 set to the index of the value
    % i.e. if y(i) = 3 then Y = [0 0 1 0 0 0 0 0 0 0]'
    % for ease of computation, 0 is the tenth element
    % i.e. if y(i) = 0 then Y = [0 0 0 0 0 0 0 0 0 1]'
    Y = label_vector == y(i);
    
    % get ith training sample which will be 1 * N (N is no. of features)
    x = X(i, :);
    
    % add bias
    a1 = [1 x]';
    z2 = Theta1 * a1;
    a2 = sigmoid(z2);
    
    % add bias
    a2 = [1; a2];
    z3 = Theta2 * a2;
    a3 = sigmoid(z3);
    
    % calculate cost of individual sample 
    % j = sum( -Y .* log(a3) - (1 - Y) .* log(1 - a3)) / m;
    j = (-Y' * log(a3) - (1 - Y') * log(1 - a3)) / m; 
    
    J = j + J;
    
    % calculate the back propagation
    delta_L = a3 - Y;
    delta_2 = (Theta2' * delta_L) .* sigmoidGradient([1; z2]);
    
    D2 = D2 + delta_L * (a2)';
    D1 = D1 + delta_2(2:end) * (a1)';
end;
% 
% Theta1_grad = (1/m) .* D1 + lambda .* [zeros(hidden_layer_size, 1) Theta1(:, 2:end)];
% Theta2_grad = (1/m) .* D2 + lambda .* [zeros(num_labels, 1) Theta2(:, 2:end)];


Theta1_grad = (1/m) .* D1 + lambda/m*[zeros(size(Theta1, 1), 1) Theta1(:, 2:end)];
Theta2_grad = (1/m) .* D2 + lambda/m*[zeros(size(Theta2, 1), 1) Theta2(:, 2:end)];

grad = [Theta1_grad(:) ; Theta2_grad(:)];

% calculate regularization paramter and add to cost
r_param = (lambda / (2 * m)) .* (sum(sum(Theta1(:, 2:end).^2)) + sum(sum(Theta2(:, 2:end).^2)));

J = J + r_param;

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end

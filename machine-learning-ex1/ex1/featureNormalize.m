function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% get the column count
n = size(X, 2);

% allocate return variables
X_norm = X;
mu = zeros(1, n);
sigma = zeros(1, n);

mu = mean(X);
sigma = std(X);

for j = 1:n
    X_norm(:, j) = (X(:, j) - mu(j)) / sigma(j);
end

end

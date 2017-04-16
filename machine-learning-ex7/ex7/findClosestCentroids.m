function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
[m, ~] = size(X);

for i = 1:m
    min_distance = 0;
    
    % get current sample
    x = X(i, :);
    
    % iterate each centroid with sample and find closest
    for k = 1:K
        % get current centroid to compare with
        c = centroids(k, :);
        
        % calculate distance to current centroid
        v = x - c;
        d = sum(v .* v);
        
        % if sample is closer to current centroid we set the index of
        % sample to it
        if k == 1
            min_distance = d;
            idx(i) = k;
        else
            if d < min_distance
                min_distance = d;
                idx(i) = k;
            end
        end
    end
end

end


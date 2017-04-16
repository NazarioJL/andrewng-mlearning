function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%


C_candidates = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
sigma_candidates = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
min_error = -1; % set to -1 as sentinel value, 

for i = 1:length(C_candidates)
    for j = 1:length(sigma_candidates)
        % all combinations of c and sigma
        C_tmp = C_candidates(i);
        sigma_tmp = sigma_candidates(j);
        model= svmTrain(X, y, C_tmp, @(x1, x2) gaussianKernel(x1, x2, sigma_tmp)); 
        predictions = svmPredict(model,Xval);

        tmp_error = mean(double(predictions ~= yval)); 
        
        if(min_error == -1) 
            % only happens in first iteration
            min_error = tmp_error;
            C = C_tmp;
            sigma = sigma_tmp;
        else
            if tmp_error < min_error
                % a smaller error has been found set new values for C and
                % sigma
                min_error = tmp_error;
                C = C_tmp;
                sigma = sigma_tmp;
            end
        end
    end
end

end

% get the size of a matrix

sz = size(A); % returns [3 2]
size_of_size = size(sz); % returns [1 2] (one row, 2 columns)

size(A,1); % gives number of rows
size(A,2); % gives number of columns

v = [1 2 3 4];
length(v); % returns 4

v = [1;2;3;4];
length(v); % also returns 4

A = [1 2; 3 4; 5 6;]
B = [11 12; 13 14; 15 16;]
C = [1 1; 2 2];

% matrix multiplication

A * C; % matrix multiplication
A .* B; % element wise multiplication

A .^ 2; % element wise squaring

v = [1; 2; 3;];
1 ./ v; % element-wise division
log(v); % element-wise log
exp(v); % element-wise e^x
abs([-1; -2; -3;]); % absolute values
-v; % = -1 * v

v + ones(length(v), 1); % increments each value by 1

A'; % transpose
(A')'; % A

a = [1 15 2 0.5];
max(a); % max value (15)
min(a); % min value (0.5)

a < 3; % does element wise comparison, returns [1 0 1 1]
find(a < 3); % returns elements that are less than 3 [1 3 4]

A = magic(3); % all rows, columns, and diagonals sum to same number

[r, c] = find(A >= 7);

sum(a);
prod(a);
floor(a);
ceil(a);

max(rand(3), rand(3));

max(A, [], 1); % gets the column-wise max values
max(A, [], 2); % gets the row-wise max values

max(A(:)); % gets the maximum value in matrix
sum(A,1); % sums each column and returns as row
sum(A,2); % sums each row and returns as column

A = magic(A);
A .* eye(9); % zeros all values not on diagonal
sum(sum(A.*eye(9))) % sum of diagonal
sum(sum(A.*flipud(eye(9)))); % sum of other diagonal

pinv(A); % inverse of A

pinv(A) * A; % will be identity matrix




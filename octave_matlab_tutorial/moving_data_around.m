% Moving data around
A = [1 2; 3 4; 5 6];

% loading data from file named 'featuresX.dat'
load featuresX.dat;
load('featuresX.dat');
load('priceY.dat');

% inspecting variables
who
whos % variables in current scope with metadata information per variable

% clearing variables
clear % clears all
clear featuresX % clears specific variable

v = priceY(1:10); % assigns first 10 elements for priceY to v

save hello.mat v; % saves data in v to file as 'hello.mat'
save hello.txt v -ascii; %% save as text (ASCII)

% retrieving elements of a matrix

A = [1 2; 3 4; 5 6];
a = A(3,2); % retrieves element in 3rd row 2nd column
a = A(2,:); % retrieves every element in 2nd row
a = A(:,2); % retrieves every element in 2nd column
a = A([1 3], :); % get colum from 1st and 3rd row

A(:,2) = [10; 11; 12;]; % assigns column vector to A's 2nd column

A = [A, [100; 101; 102;]]; % appends new column vector to A

A(:) % put all elements of A into a single vector

A = [1 2; 3 4; 5 6;]
B = [11 12; 13 14; 15 16;];
C = [A,B]; % concatenates B to A on the right, can also use C = [A B]
D = [A;B]; % concatenates B to A on teh bottom

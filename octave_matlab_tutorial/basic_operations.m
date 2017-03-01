% Basic operations 

% arithmetic operations

5 + 6; % addition
3 - 2; % subtraction
5 * 8; % multiplication
1 / 2; % division
2 ^ 6; % exponentiation

% logic operations

1 == 2; % test for equality, evaluates to false
1 ~= 2; % not equals
1 && 0; % logical AND
1 || 0; % logical OR
xor(1,0) % logical XOR

% changing prompt in Octave (won't work in MATLAB)
PS1('>> ');

a = 3 % will output to console
a = 3; % semi colon suppresses output 

% constants
a = pi;

disp(a); % diplays a value

% sprintf is uses C style formatting
disp(sprintf('2 decimals: %0.2f', a));
disp(sprintf('6 decimals: %0.6f', a));

% change output formatting
format long
format short

% Matrices

A = [1 2; 3 4; 5 6]; % creates 3x2 a matrix  
V = [1 2 3]; % creates row vector (1x3 matrix)
V = [1;2;3]; % creates a column vector (3x1 matrix)

v = 1:0.1:2; % generates a row vector with elements as start:increment:end
v = 1:6; % default increment is 1 will generate [1 2 3 4 5 6]

C = ones(2, 3); % creates a 2x3 matrix initialized with ones
w = zeros(1, 3); % creates a 1x3 matrix initialized with zeros 
r = rand(3, 3); % creates a 3x3 matrix initialized with uniformtly 
                % distributed numbers between 0 and 1
e = eye(3,3) % creates a 3x3 identity matrix 
g = randn(2, 3); % sames as rand but numbers are normally distributed  

% miscellaneous

w = -6 + sqrt(10) * randn(1, 100000);
hist(w) % visualizing the histogram plot of w
hist(w,50) % change bucket size

% using help
% help documentation for any command can be done by typing help <command>

help
help eye










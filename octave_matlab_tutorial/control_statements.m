v = zeros(10,1);

% for loops

for i = 1:10,
    v(i) = 2^i;
end;

indices = 1:10;

for i=indices,
    disp(i);
end;

% while loops

i = 1;
while i <= 5,
    v(i) = 100;
    i = i + 1;
end;

% breaking out of while loops

while true,
    v(i) = 999;
    i = i+1;
    if i == 6,
        break;
    end;
end;

% if-else statements

if v(1) ==  1,
    disp('The value is one');
elseif v(1) == 2,
    disp('The value is two');
else,
     disp('The value not one or two');
end;

% creating functions

function y = squareThisNumber(x)
    y = x^2
end

function [y1, y2] = squareAndCubeThisNumber(x)
    y1 = x^2;
    y2 = x^3;
    % [a,b] = squareAndCubeThisNumber(3);
end



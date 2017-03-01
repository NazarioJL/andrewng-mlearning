t = [0:0.1:0.98];
y1 = sin(2 * pi * 4 * t);
plot(t, y1);
y2 = cos(2 * pi * 4 * t);
plot(t, y2);

% to plot multiple series data use 'hold on'command
plot(t, y1);
hold on;
plot(t, y2, 'r'); % plot in color red
xlabel('time');
ylabel('value');
legend('sin', 'cos');
title('my plot');

% save to file
print -dpng 'myPlot.png'

% close
close 

figure(1); plot(t, y1);
figure(2); plot(t, y2);

subplot(1,2,1); % divides plot a 1x2 grid, access first element
plot(t, y1); 
subplot(1,2,2); % accesses 2nd element
plot(t, y2); % plots on right sub-square
axis([0.5 1 -1 1]);
clf; % clears figure

% visualizing a matrix
A = magic(5);
imagesc(A); 

% visualize in gray-scale
imagesc(A), colorbar, colormap gray; % chaining commands

close

pointCount = 50;
standardDeviations = [0.09, 0.12, 0.15];

corners = [0 0 0; 1 0 0; 0 1 0;
           0 0 1; 1 1 0; 1 0 1;
           0 1 1; 1 1 1];

figure;  % i think we need this to erase anything left behind?
hold on; % and this is needed to keep adding stuff to the figure

for i = 1:length(standardDeviations) % there are 3
    currentStdDev = standardDeviations(i);
    if i == 1 % could use switch here, not sure about the syntax
        color = 'red';
    elseif i == 2
        color = 'blue';
    elseif i == 3
        color = 'green';
    end

    % 8 corners
    for j = 1:8
        currentCorner = corners(j, 1:3); % jth row, all the columns so 1x3
        value = currentStdDev * randn(pointCount, 3); % scalar multiplied by 50x3 matrix
        shiftedVal = currentCorner + value; % still a matrix just added the shift amount

        for k=1:pointCount
        scatter3(shiftedVal(k, 1), shiftedVal(k, 2), shiftedVal(k, 3), 10, color, 'filled'); % 10 is the size
        end
    end
end

% [startX, endX], [startY, endY], [startZ, endZ].

plot3([0, 1], [0, 0], [0, 0], '--m', 'LineWidth', 1.5);
plot3([0, 0], [0, 1], [0, 0], '--m', 'LineWidth', 1.5);
plot3([1, 1], [0, 1], [0, 0], '--m', 'LineWidth', 1.5);
plot3([0, 1], [1, 1], [0, 0], '--m', 'LineWidth', 1.5);
plot3([0, 1], [0, 0], [1, 1], '--m', 'LineWidth', 1.5);
plot3([0, 0], [0, 1], [1, 1], '--m', 'LineWidth', 1.5);
plot3([1, 1], [0, 1], [1, 1], '--m', 'LineWidth', 1.5);
plot3([0, 1], [1, 1], [1, 1], '--m', 'LineWidth', 1.5);
plot3([0, 0], [0, 0], [0, 1], '--m', 'LineWidth', 1.5);
plot3([1, 1], [0, 0], [0, 1], '--m', 'LineWidth', 1.5);
plot3([0, 0], [1, 1], [0, 1], '--m', 'LineWidth', 1.5);
plot3([1, 1], [1, 1], [0, 1], '--m', 'LineWidth', 1.5);

title('Normal Distributions Aroun Unit Cube');
xlabel('x');
ylabel('y');
zlabel('z');
grid on; % this puts a reference grid to make it easier to observe
hold off; % "good habit" think of it like closing the scanner in java
axis equal; % to make it look like a cube
view(135,30); % necessary because otherwise it looks 2D
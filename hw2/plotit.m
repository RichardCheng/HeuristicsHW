figure
[x, y] = meshgrid(0:127, 0:127);
costmap = zeros(128,128);
for i = 0:127
    for j = 0:127
        costmap(i+1, j+1) = cost([i j]);
    end
end
surf(x, y, costmap);
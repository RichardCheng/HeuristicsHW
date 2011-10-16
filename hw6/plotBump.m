figure
resolution = 300;
xvec = linspace(-1,11,resolution);
yvec = linspace(-1,11,resolution);
[x, y] = meshgrid(xvec, yvec);
costmap = zeros(resolution,resolution);
for i = 1:resolution
    for j = 1:resolution
        costmap(i, j) = bump2Q([xvec(i), yvec(j)]);
    end
end
surf(x, y, costmap);

figure
contour(x,y,costmap);

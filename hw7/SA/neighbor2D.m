function x = neighbor2D(x)
index = randi(length(x)); 

newval = x(index) + sqrt(5).*randn(1,1);

while (newval > 10 || newval < 0)
    newval = x(index) + sqrt(5).*randn(1,1);
end

x(index) = newval; 
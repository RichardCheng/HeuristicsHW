function result = cost(x)
result = 0; 

leng = length(x); 
prod = 1; 
for i = 1:leng
    if (x(i) < 0 || x(i) > 10)
        return;
    end
    prod = prod * x(i);
end 

if prod < 0.75
    return;
end

num1 = 0; 
num2 = 2;
denum = 0; 

for i = 1:leng
    num1 = num1 + (cos(x(i)))^4;
    num2 = num2 * (cos(x(i)))^2;
    denum = denum + i * (x(i))^2;
end

result = -1 * abs((num1-num2)/sqrt(denum)); 

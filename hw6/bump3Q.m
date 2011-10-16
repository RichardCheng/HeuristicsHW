function [result, violation] = bump3Q(x)

leng = length(x); 
prod = 1; 
for i = 1:leng
    if (x(i) < 0 || x(i) > 10)
        result = calcViolation(x); 
        violation = true; 
        return;
    end
    prod = prod * x(i);
end 

if prod < 0.75
    result = calcViolation(x);
    violation = true;
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

result = abs((num1-num2)/sqrt(denum)); 
violation = false; 

function violationMeasure = calcViolation(x)

leng = length(x); 
prod = 1; 
violationMeasure = 0;
%TODO: need to normalize...how?
for i = 1:leng
    
    ineq = 10-x(i); 
    if ineq < 0
        violationMeasure = violationMeasure - ineq;
    end
    
    ineq = x(i); 
    if ineq < 0
        violationMeasure = violationMeasure - ineq;
    end
    
    prod = prod * x(i);
end

ineq = prod - 0.75; 
if ineq < 0 
    violationMeasure = violationMeasure - ineq;
end


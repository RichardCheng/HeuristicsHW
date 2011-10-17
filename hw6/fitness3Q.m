function [result, violation] = fitness3Q(x, fmin)
[bumpres, violation] = bump3Q(x);
if violation
    result = fmin - bumpres;
else
    result = bumpres;
end
    
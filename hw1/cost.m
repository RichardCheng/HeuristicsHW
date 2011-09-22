%calculates cost function
function c = cost(s)
c = (400-(s-21) .* (s-21)) .* sin(s .* pi ./ 6);

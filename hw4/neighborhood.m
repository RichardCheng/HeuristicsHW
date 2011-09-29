function M = neighborhood(s0)

M = zeros(size(s0));

for i = 1 : length(s0)
    M(i, :) = perturb(s0, i);
end

function s0 = perturb(s0, index)
s0(index) = ~s0(index);
    
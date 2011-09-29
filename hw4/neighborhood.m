function M = neighborhood(s0)

M = zeros(length(s0));


for i = 1 : length(s0)
    M(i, :) = s0;
    M(i, i) = ~s0(i);
end

    
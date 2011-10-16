function children = mutation(children, pMutation)

numChildren = size(children,1);
numVar = size(children,2); 

% For each bit
for i = 1:numChildren;
    % If we satisfy the probability
    if rand() < pMutation
        varIndex = randi(numVar,1);
        children(i, varIndex) = children(i, varIndex) + randn * V;
    end
end

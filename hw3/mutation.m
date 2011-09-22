function children = mutation(currChildren, pMutation)

% For each bit
for i = 1:size(currChildren,1)
    for j = 1:size(currChildren,2)

        % If we satisfy the probability
        if (rand()<pMutation)

            % Flip the bit.
            if (currChildren(i,j) == '0')
                currChildren(i,j) = '1';
            else
                currChildren(i,j) = '0';
            end
        end
    end
end

children = currChildren;         

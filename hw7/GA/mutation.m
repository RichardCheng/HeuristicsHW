function children = mutation(children, pMutation, V)

numChildren = size(children,1);
numVar = size(children,2); 


% For each child
for i = 1:numChildren
    if rand() < pMutation

        found = false;

        while ~found
            varIndex = randi(numVar,1);
            tempsln = children(i, varIndex) + randn * sqrt(V);
            
            found = true; 

            %see if it's within bound
            leng = length(tempsln); 
            prod = 1; 
            for ii = 1:leng
                if (tempsln(ii) < 0 || tempsln(ii) > 10)
                    found = false;
                    break;
                end
                prod = prod * tempsln(ii);
            end 

            if prod < 0.75
                found = false;
            end
        end
        
        children(i, varIndex) = tempsln; 
    end
end
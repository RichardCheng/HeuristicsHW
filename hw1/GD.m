% Greed deterministic
function solution = GD(sinitial, maxiterations)
S = sinitial;
CostS = cost(S);
BestS = S;
BestCost = CostS;

solution = zeros(maxiterations, 5);
i = 0;

%repeat until max iterations is reached
while (i < maxiterations) 
    i = i + 1;

    %update cost
    tempCost = cost(S);
    tempSoln = S;
    %search through all neighborhood for best solution
    for j = max(S-10, 0) : min(S+10, 500)
        %get best cost in the neighborhood
        if cost(j) < tempCost
            tempCost = cost(j);
            tempSoln = j;
        end
    end

    S = tempSoln;

    % update best cost if a better solution is found
    CostS = cost(S);
    if CostS < BestCost 
        BestCost = CostS;
        BestS = S;
    end

    %store solution into matrix for display purposes
    solution(i, 1) = i;
    solution(i, 2) = S;
    solution(i, 3) = BestS;
    solution(i, 4) = CostS;
    solution(i, 5) = BestCost;
end

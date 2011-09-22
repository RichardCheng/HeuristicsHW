%Greed stochastic
function solution = GS(sinitial, maxiterations)
S = sinitial;
CostS = cost(S);
BestS = S;
BestCost = CostS;

solution = zeros(maxiterations, 5);
i = 0;

%repeat until max iteration is reached
while (i < maxiterations) 
    i = i + 1;

    oldS = S;
    oldCostS = cost(oldS);
    
    %find a random neighbor
    S = neighbor(S);

    %determine if the neighbor is better than the current solution
    CostS = cost(S);
    if CostS < BestCost 
        BestCost = CostS;
        BestS = S;
    end

    %store current iteration into matrix for plot purposes
    solution(i, 1) = i;
    solution(i, 2) = S;
    solution(i, 3) = BestS;
    solution(i, 4) = CostS;
    solution(i, 5) = BestCost;
    
    if (oldCostS < CostS)
        S = oldS;
    end
end

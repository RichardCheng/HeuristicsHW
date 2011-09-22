%random sampling
function solution = RS(sinitial, maxiterations)
S = sinitial;
CostS = cost(S);
BestS = S;
BestCost = CostS;

solution = zeros(maxiterations, 5);
i = 0;

%repeat while max iteration is not reached
while (i < maxiterations) 
    i = i + 1;
    %get a random number between 0 and 500
    NewS = floor(rand.*(501));
    %get another number if the new number is the same as the previous
    %number
    while (NewS == S)
        NewS = floor(rand.*(501));
    end

    NewCost = cost(NewS);
    
    %update solution is the new cost is lower than the best cost
    if NewCost < BestCost 
        BestCost = NewCost;
        BestS = NewS;
        S = NewS;
        CostS = NewCost;
    end

    %store solution in matrix for plotting purposes
    solution(i, 1) = i;
    solution(i, 2) = S;
    solution(i, 3) = BestS;
    solution(i, 4) = CostS;
    solution(i, 5) = BestCost;
end

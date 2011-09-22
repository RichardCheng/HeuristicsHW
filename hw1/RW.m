%random walk
function solution = RW(sinitial, maxiterations)
S = sinitial;
BestS = S;
BestCost = cost(S);

solution = zeros(maxiterations, 5);
i = 0;

%repeat while max iteration is not reached
while (i < maxiterations) 
    i = i + 1;
    %get a neighbor within (-25,25)
    S = neighbor(S);
    CostS = cost(S);
    %update cost if the new cost is better than the best cost
    if CostS < BestCost 
        BestCost = CostS;
        BestS = S;
    end

    %add solution to a matrix for plotting purposes
    solution(i, 1) = i;
    solution(i, 2) = S;
    solution(i, 3) = BestS;
    solution(i, 4) = CostS;
    solution(i, 5) = BestCost;
end

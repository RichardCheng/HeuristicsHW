% Simulated Annealing
function [solution, sbest] = SA(sinitial, Tinitial, alpha, beta, Minitial, maxiter)
M = Minitial;
T = Tinitial;
CurS = sinitial;
BestS = CurS;
CurCost = cost(CurS);
BestCost = CurCost; 

solution = zeros(maxiter, 3);
sbest = zeros(maxiter, 2);

Time = 1;
while (Time <= maxiter)
    [CurS_res, CurCost_res, BestS_res, BestCost_res] = Metropolis(CurS, CurCost, BestS, BestCost, T, M);

    solution(Time:Time+M-1,1) = Time:Time+M-1;
    solution(Time:Time+M-1,2) = CurCost_res;
    solution(Time:Time+M-1,3) = BestCost_res;
    
    CurS = CurS_res(M,:);
    CurCost = CurCost_res(M);
    BestS = BestS_res(M,:);
    BestCost = BestCost_res(M);

    sbest(Time:Time+M-1,:) = BestS_res;

    Time = Time + M;
    T = alpha * T; % Update T after M iterations
    M = beta * M;
end

% Metropolis
function [CurS_res, CurCost_res, BestS_res, BestCost_res] = Metropolis(CurS, CurCost, BestS, BestCost, T, M)

i = 1;
CurS_res = zeros(M,2);
CurCost_res = zeros(M);
BestS_res = zeros(M,2);
BestCost_res = zeros(M);
    
while (i <= M)
    NewS = neighbor2D(CurS); 
    
    NewCost = cost(NewS);
    DeltaCost = (NewCost - CurCost);

    if (DeltaCost < 0) 
        CurS = NewS;
        CurCost = NewCost; 
        if NewCost < BestCost 
            BestS = NewS;
            BestCost = NewCost;
        end
    else
        if (rand(1) < exp( -1. * DeltaCost / T))
            CurS = NewS;
            CurCost = NewCost;
        end
    end
    
    CurS_res(i,:) = CurS;
    CurCost_res(i) = CurCost;
    BestS_res(i,:) = BestS;
    BestCost_res(i) = BestCost;

    i = i + 1;
end

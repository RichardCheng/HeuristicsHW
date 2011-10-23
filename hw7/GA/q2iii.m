%%% Determine the parameters.
% Constants
K = 1;
POP_SIZE = 50;
ITERATION = 200;
% Arbitrarily define reference points to test other parameters
P_MUTATION_REF = 0.7;
P_CROSSOVER_REF = 0.2;
V_REF = 3;

pMutationRes = zeros(11,10);
pCrossoverRes = zeros(11,10);
pVarRes = zeros(11,10);
pRandRes = zeros(11,10);

for temp = 1:10

    % Generate initial population. n=?
    InitPop = generatePopulation(POP_SIZE, 20);
    
    % Determine the pMutation
    for r = 1:11
        ip = generatePopulation(POP_SIZE * ITERATION, 20);
        res = zeros(POP_SIZE * ITERATION, 1);
        for rr = 1: POP_SIZE * ITERATION
            res(rr) = fitness2Q(ip(rr, :));
        end
        pRandRes(r, temp) = max(res);
    end

    % Determine the pMutation
    for pM = 0:0.1:1
        result = GAReal2Q(InitPop, POP_SIZE, ITERATION, P_CROSSOVER_REF, pM, V_REF);
        pMutationRes(floor(pM*10)+1, temp) = result(ITERATION);
    end

    % Determine the pCrossover
    for pC = 0:0.1:1
        result = GAReal2Q(InitPop, POP_SIZE, ITERATION, pC, P_MUTATION_REF, V_REF);
        pCrossoverRes(floor(pC*10)+1, temp) = result(ITERATION);
    end

    % Determine the variance
    for pV = 0:1:10
        result = GAReal2Q(InitPop, POP_SIZE, ITERATION, P_CROSSOVER_REF, P_MUTATION_REF, pV);
        pVarRes(floor(pV)+1, temp) = result(ITERATION);
    end
end

figure;
hold on
plot(1:11, mean(pRandRes, 2));
plot(1:11, max(pRandRes, [], 2));
title('Random algorithm');
xlabel('Random Point');
ylabel('Elite Solution');

figure;
hold on
plot(0:0.1:1, mean(pMutationRes, 2));
plot(0:0.1:1, max(pMutationRes, [], 2));
title('Mutation Rate vs. performance');
xlabel('Mutation Rate');
ylabel('Elite Solution');

figure;
hold on
plot(0:0.1:1, mean(pCrossoverRes, 2));
plot(0:0.1:1, max(pCrossoverRes, [], 2));
title('Crossover Rate vs. performance');
xlabel('Crossover Rate');
ylabel('Elite Solution');

figure;
hold on
plot(0:1:10, mean(pVarRes, 2));
plot(0:1:10, max(pVarRes, [], 2));
title('Variance vs. performance');
xlabel('Variance');
ylabel('Elite Solution');
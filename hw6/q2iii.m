%%% Determine the parameters.
% Constants
K = 1;
POP_SIZE = 50;
ITERATION = 200;
% Arbitrarily define reference points to test other parameters
P_MUTATION_REF = 0.3;
P_CROSSOVER_REF = 1;
V_REF = 0.3;

% Generate initial population. n=?
InitPop = generatePopulation(POP_SIZE, 20);

% Determine the pMutation
pMutationRes = zeros(11,1);
for pM = 0:0.1:1
    result = GAReal2Q(InitPop, POP_SIZE, ITERATION, P_CROSSOVER_REF, pM, V_REF);
    pMutationRes(floor(pM*10)+1) = result(ITERATION);
end
figure;
plot(0:0.1:1, pMutationRes);

% Determine the pCrossover
pCrossoverRes = zeros(11,1);
for pC = 0:0.1:1
    result = GAReal2Q(InitPop, POP_SIZE, ITERATION, pC, P_MUTATION_REF, V_REF);
    pMutationRes(floor(pC*10)+1) = result(ITERATION);
end
figure;
plot(0:0.1:1, pCrossoverRes);

% Determine the variance
pVarRes = zeros(11,1);
for pV = 0:0.1:1
    result = GAReal2Q(InitPop, POP_SIZE, ITERATION, P_CROSSOVER_REF, P_MUTATION_REF, pV);
    pVarRes(floor(pV*10)+1) = result(ITERATION);
end
figure;
plot(0:0.1:1, pVarRes);

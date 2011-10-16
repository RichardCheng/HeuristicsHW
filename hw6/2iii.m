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
InitPop = generatePopulation(POP_SIZE, n);

% Determine the pMutation
pMutationRes = zeros(11,1);
for pM = 0:0.1:1
    result = GAReal2Q();
    pMutationRes(floor(pM*10)+1) = result;
end
figure;
plot(0:0.1:1, pMutationRes);

% Determine the pCrossover
pCrossoverRes = zeros(11,1);
for pC = 0:0.1:1
    result = GAReal2Q();
    pMutationRes(floor(pC*10)+1) = result;
end
figure;
plot(0:0.1:1, pCrossoverRes);

% Determine the variance
pVarRes = zeros(11,1);
for pV = 0:0.1:1
    result = GAReal2Q();
    pVarRes(floor(pV*10)+1) = result;
end
figure;
plot(0:0.1:1, pVarRes);
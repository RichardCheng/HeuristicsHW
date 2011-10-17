% Constants
K = 1;
POP_SIZE = 50;
ITERATION = 200;
P_MUTATION = 0.7;
P_CROSSOVER = 0.5;
V = 3;

resA = zeros(1, 20); 
resultA = zeros(ITERATION, 20); 

resB = zeros(1, 20); 
resultB = zeros(ITERATION, 20); 

for temp = 1:20
    % Generate initial population. n=?
    InitPop = generatePopulation(POP_SIZE, 20);

    resultA(:, temp) = GAReal2Q(InitPop, POP_SIZE, ITERATION, P_CROSSOVER, P_MUTATION, V);
    resA(temp) = resultA(ITERATION, temp);
    
    resultB(:, temp) = GAReal3Q(InitPop, POP_SIZE, ITERATION, P_CROSSOVER, P_MUTATION, V);
    resB(temp) = resultB(ITERATION, temp);
end

fprintf('2iv:\n');

fprintf('%f is the average and %f is the standard deviation ', mean(resA), std(resA));
fprintf('of the fitness of the fittest member of the population (elite solution) over the 20 trials.\n');

fprintf('%f is the best and %f is the worst elite solution ', max(resA), min(resA));
fprintf('from the 20 trials after 200 generations.\n\n'); 

fprintf('3b:\n');

fprintf('%f is the average and %f is the standard deviation ', mean(resB), std(resB));
fprintf('of the fitness of the fittest member of the population (elite solution) over the 20 trials.\n');

fprintf('%f is the best and %f is the worst elite solution ', max(resA), min(resA));
fprintf('from the 20 trials after 200 generations.\n'); 

figure;
hold on
plot(2*POP_SIZE : 2*POP_SIZE : 2*POP_SIZE*ITERATION, mean(resultA, 2), 'r');
plot(2*POP_SIZE : 2*POP_SIZE : 2*POP_SIZE*ITERATION, mean(resultB, 2), 'g:');
title('Average elite solution vs. function evaluations');
xlabel('Function Evaluations');
ylabel('Average Elite Solution');

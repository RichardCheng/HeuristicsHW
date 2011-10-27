% Constants
K = 1;
POP_SIZE = 50;
ITERATION = 200;
P_MUTATION = 0.7;
P_CROSSOVER = 0.5;
V = 5;

res = zeros(1, 20); 
result = zeros(ITERATION, 20); 

bestsolution = zeros(200,1);

fprintf('running GA:\n[');

for temp = 1:20
    % Generate initial population. n=?
    InitPop = generatePopulation(POP_SIZE, 20);

    result(:, temp) = GAReal2Q(InitPop, POP_SIZE, ITERATION, P_CROSSOVER, P_MUTATION, V);
    
    bestsolution = (bestsolution .* (temp - 1) + result(:, temp)) ./ temp;
    
    fprintf('%d ', result(ITERATION, temp));

end

fprintf(']\n'); 

plot(POP_SIZE:POP_SIZE:10000, bestsolution, 'r'); 
% Constants
K = 1;
POP_SIZE = 50;
ITERATION = 200;
P_MUTATION = 0.7;
P_CROSSOVER = 0.5;
V = 3;

res = zeros(1, 20); 
result = zeros(ITERATION, 20); 

bestsolution = zeros(200,1);

for temp = 1:20
    % Generate initial population. n=?
    InitPop = generatePopulation(POP_SIZE, 20);

    result(:, temp) = GAReal2Q(InitPop, POP_SIZE, ITERATION, P_CROSSOVER, P_MUTATION, V);
    
    bestsolution = (bestsolution .* (temp - 1) + result(:, temp)) ./ temp; 

end

plot(50:50:10000, bestsolution, 'r'); 
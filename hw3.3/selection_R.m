% selects numPairs pairs of parents from population using fitness
% proportional selection
% returns two parent matrix of size numPair x 14
function [parent1, parent2] = selection_R(population, numPairs) 

%size(population, 1)
sizePopulation = size(population, 1);

%cache fitness so we don't have to recalculate
fitnessCache = zeros(sizePopulation, 1); 
for i = 1: sizePopulation
    fitnessCache(i) = fitness(population(i, :));
end

sumFitness = sum(fitnessCache); 
parent1(1, 1:14) = ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'];
parent2(1, 1:14) = ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'];

% for each pair
i = 1;
while (i <= numPairs)
    
    % start at 0, at each individual, add fitness(individual)/sumFitness
    % and see if it's less than the rand number, if it is, choose it
    currentNum = 0;

    % r is sorted so that you can look for parent 1 first and then parent 2 
    % for computational efficiency (since order doesn't matter)
    r = sort(rand(2,1));

    % tells you first parent is picked
    firstParentPicked = false; 
    for j = 1 : sizePopulation
        currentNum = currentNum + fitnessCache(j)/sumFitness; 
        if ~firstParentPicked
            if r(1) <= currentNum
                parent1(i, 1:14) = population(j, :);
                firstParentPicked = true;
            end
        else
            if r(2) <= currentNum
                parent2(i, 1:14) = population(j, :);
                break;
            end
        end
    end
    
    % different individuals are used for parent 1 and parent 2
    if (size(parent1,1) == size(parent2,1))
       i = i + 1;
    end
    
end


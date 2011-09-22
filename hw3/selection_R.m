% selects numPairs pairs of parents from population using fitness
% proportional selection
% returns two parent matrix of size numPair x 14
function [parent1, parent2] = selection_R(population, numPairs) 

sizePopulation = size(population, 1);
parent1 = zeros(sizePopulation, 14); 
parent2 = zeros(sizePopulation, 14);

%cache fitness so we don't have to recalculate
fitnessCache = zeros(sizePopulation, 1); 
for i = 1: sizePopulation
    fitnessCache(i) = fitness(bin2dec(population(i, :)));
end

sumFitness = sum(fitnessCache); 

% for each pair
for i = 1 : numPairs
    
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
            if r(1) < currentNum
                parent1(i, :) = population(j, :);
            end
        else
            if r(2) < currentNum
                parent2(i, :) = population(j, :);
                break;
            end
        end
    end
end


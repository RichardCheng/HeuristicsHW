% selects numPairs pairs of parents from population using fitness
% proportional selection
% returns two parent matrix of size numPair x 14
function [parent1, parent2] = selection_T(population, numPairs)

sizePopulation = size(population, 1);

%cache fitness so we don't have to recalculate
fitnessCache = zeros(sizePopulation, 1); 
for i = 1: sizePopulation
    fitnessCache(i) = fitness(population(i, :));
end

% for each pair
for i = 1 : numPairs
   r = randperm(sizePopulation);
   
   if fitnessCache(r(1)) < fitnessCache(r(2))
       parent1(i,:) = population(r(2), :);
   else
       parent1(i,:) = population(r(1), :);
   end
   
   if fitnessCache(r(3)) < fitnessCache(r(4))
       parent2(i,:) = population(r(4), :);
   else 
       parent2(i,:) = population(r(3), :);
   end
   
end


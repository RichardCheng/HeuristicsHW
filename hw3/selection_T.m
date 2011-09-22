% selects numPairs pairs of parents from population using fitness
% proportional selection
% returns two parent matrix of size numPair x 14
function [parent1, parent2] = selection_T(population, numPairs) 

sizePopulation = size(population, 1);
parent1 = zeros(sizePopulation, 14); 
parent2 = zeros(sizePopulation, 14);

%cache fitness so we don't have to recalculate
fitnessCache = zeros(sizePopulation, 1); 
for i = 1: sizePopulation
    fitnessCache(i) = fitness(bin2dec(population(i, :)));
end

% for each pair
p = zeros(2, 2);
for i = 1 : numPairs
   r = randi(sizePopulation, 2, 2);
   p(1,1) = population(r(1, 1), :);
   p(1,2) = population(r(1, 2), :);
   p(2,1) = population(r(2, 1), :);
   p(2,2) = population(r(2, 2), :);  
   
   if fitnessCache(r(1,1)) < fitnessCache(r(1,2))
       parent1(i,:) = population(r(1,2));
   else 
       parent1(i,:) = population(r(1,1));
   end
   
   if fitnessCache(r(2,1)) < fitnessCache(r(2,2))
       parent2(i,:) = population(r(2,2));
   else 
       parent2(i,:) = population(r(2,1));
   end
end


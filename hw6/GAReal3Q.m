function eliteSln= GAReal3Q(Xinitial, popsize, maxGen, pCrossover, pMutation, V)
population = Xinitial;
fitness_pop = zeros(popsize, 1);
fitness_children = zeros(popsize,1);

eliteSln = zeros(1, maxGen);
fmin = 0.5; 

for iter=1:maxGen
    [parents1, parents2] = selection_T3Q(population, popsize/2, fmin);

    children = crossover(parents1, parents2, pCrossover);
    children = mutation(children, pMutation, V);

    % Calculate fitness for each children
    for i=1:popsize
        [fitness_children(i), violation] = fitness3Q(children(i,:), fmin);
        if ~violation && fitness_children(i) < fmin
            fmin = fitness_children(i);
        end
    end
    
    % Calculate fitness for every sample
    for i=1:popsize
        fitness_pop(i) = fitness3Q(population(i,:), fmin);
    end
    
    [maxpVal, maxpIndex] = max(fitness_pop);
    [~, mincIndex] = min(fitness_children);

    % Put the answer into eliteSln
    eliteSln(iter) = maxpVal; 
  
    % Pick the best ones to stay
    children(mincIndex,:) = population(maxpIndex,:);
    population = children;
end

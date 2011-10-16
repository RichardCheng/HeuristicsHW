function eliteSln= GAReal(Xinitial, popsize, maxGen, pCrossover, pMutation, V)
population = Xinitial;
fitness_pop = zeros(popsize, 1);
fitness_children = zeros(popsize,1);

eliteSln = zeros(1, maxGen);

for iter=1:maxGen
    [parents1, parents2] = selection_T(population, popsize/2);

    children = crossover(parents1, parents2, pCrossover);
    children = mutation(children, pMutation, V);

    % Calculate fitness for each children
    for i=1:popsize
        fitness_children(i) = fitness2Q(children(i,:));
    end
    
    % Calculate fitness for every sample
    for i=1:popsize
        fitness_pop(i) = fitness2Q(population(i,:));
    end
    
    [maxpVal, maxpIndex] = max(fitness_pop);
    [~, mincIndex] = min(fitness_children);

    % Put the answer into eliteSln
    eliteSln(iter) = maxpVal; 
  
    % Pick the best ones to stay
    children(mincIndex,:) = population(maxpIndex,:);
    population = children;
end

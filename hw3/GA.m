function [solution, sbest]= GA(Xinitial, popsize, maxGen, pCrossover, pMutation, selectionMethod)
population = Xinitial;
fitness_pop = zeros(popsize, 1);
fitness_children = zeros(popsize,1);

solution = zeros(maxGen,3);
sbest = zeros(maxGen,2);

for iter=1:maxGen
    % Calculate fitness for every sample
    for i=1:popsize
        fitness_pop(i) = fitness(population(i,:));
    end

    % Update the average fitness for last iteration
    if (iter > 1)
        solution(iter-1,2) = mean(fitness_pop);
    end

    if (strcmp(selectionMethod, 'selection_T'))
        [parents1, parents2] = selection_T(population, popsize/2);
    elseif (strcmp(selectionMethod, 'selection_R'))
        [parents1, parents2] = selection_R(population, popsize/2);
    else
        fprintf('check your inputs');
    end
    children = crossover(parents1, parents2, pCrossover);
    children = mutation(children, pMutation);

    % Calculate fitness for each children
    for i=1:popsize
        fitness_children(i) = fitness(children(i,:));
    end
    
    [maxpVal, maxpIndex] = max(fitness_pop);
    [mincVal, mincIndex] = min(fitness_children);
    [maxcVal, maxcIndex] = max(fitness_children);

    % Put the answer into solution and sbest
    solution(iter,1) = iter;
    if (maxcVal > maxpVal);
        sbestIter = bin2dec(children(maxcIndex,:));
        solution(iter,3) = maxcVal;
    else
        sbestIter = bin2dec(population(maxpIndex,:));
        solution(iter,3) = maxpVal;
    end
    sbest(iter, 1) = floor(sbestIter / 128);
    sbest(iter, 2) = mod(sbestIter, 128);
    
    % Pick the best ones to stay
    children(mincIndex,:) = population(maxpIndex,:);
    population = children;
end

for i=1:popsize
    fitness_pop(i) = fitness(population(i,:));
end
solution(maxGen,2) = mean(fitness_pop);


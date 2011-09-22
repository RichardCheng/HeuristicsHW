function children = crossover(parents1, parents2, pCrossover)

for i = 1:size(parents1,1)
    % If crossover is to be performed
    if (rand() < pCrossover) 
        crossoverPoint = floor(rand()*(size(parents1,2)))+1;
        for j = 1:size(parents1,2)
            if (j <= crossoverPoint)
                children(i*2-1,j) = parents1(i,j);
                children(i*2,j) = parents2(i,j);
            else
                children(i*2-1,j) = parents2(i,j);
                children(i*2,j) = parents1(i,j);
            end
        end
    else
        children(i*2-1,:) = parents1(i, :);
        children(i*2,:) = parents2(i, :);
    end
end

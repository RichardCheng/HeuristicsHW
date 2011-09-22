function population = generatePopulation(populationSize)
    populationIndex = randi(2, populationSize, 14);
    choice = ['0', '1'];
    for i = 1:populationSize
        for j = 1:14
            population(i,j) = choice(populationIndex(i,j));
        end
    end
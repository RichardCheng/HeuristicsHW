function population = generatePopulation(populationSize, n)
%Generate values from the uniform distribution on the interval [0, 10].
population = 10.*rand(populationSize,n);
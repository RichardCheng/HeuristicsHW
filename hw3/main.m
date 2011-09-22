noSimulations = 30;

popsize = 20;
Xinitial(1:popsize,1:14,1) = generatePopulation(popsize);
for i = 2 : noSimulations
    Xinitial(1:popsize, 1:14, i) = generatePopulation(popsize);
end
maxGen = 50;  
pCrossover = 0.9;
pMutation = 0.05; 

[solution, sbest]= GA(Xinitial(:, :, i), popsize, maxGen, pCrossover, pMutation, 'selection_R');
for i = 2:noSimulations
    [solution_, sbest_]= GA(Xinitial(:, :, i), popsize, maxGen, pCrossover, pMutation, 'selection_R');
    solution(:,:,i) = solution_;
    sbest(:,:,i) = sbest_;
end
x = 1: maxGen;
y = mean(solution(:, 3, :), 3);
figure;
plot(x,y, 'r');
xlabel('generation')
ylabel('mean of best fitness')
title('mean over 30 runs of best fitness vs. generation');

hold on
globalMax = 1088359375;
globalMaxCount = 0; 
for i = 1:noSimulations
    %plot(x,solution(:,3,i), ':');
    if solution(maxGen, 3, i) == globalMax;
        globalMaxCount = globalMaxCount + 1;
    end
end

fprintf('%d of %d runs found the global maximum\n', globalMaxCount, noSimulations);

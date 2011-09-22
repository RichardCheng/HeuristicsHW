noSimulations = 30;

popsize = 20;
Xinitial(1:popsize,1:14,1) = generatePopulation(popsize);
for i = 2 : noSimulations
    Xinitial(1:popsize, 1:14, i) = generatePopulation(popsize);
end
maxGen = 50;  
pCrossover = 0.9;
pMutation = 0.05; 

[solution1, sbest1]= GA(Xinitial(:, :, i), popsize, maxGen, pCrossover, pMutation, 'selection_T');
[solution2, sbest2]= GA(Xinitial(:, :, i), popsize, maxGen, pCrossover, pMutation, 'selection_R');
for i = 2:noSimulations
    [solution_, sbest_]= GA(Xinitial(:, :, i), popsize, maxGen, pCrossover, pMutation, 'selection_T');
    solution1(:,:,i) = solution_;
    sbest1(:,:,i) = sbest_;
    [solution_, sbest_]= GA(Xinitial(:, :, i), popsize, maxGen, pCrossover, pMutation, 'selection_R');
    solution2(:,:,i) = solution_;
    sbest2(:,:,i) = sbest_;
end
x = 1: maxGen;
y1 = mean(solution1(:, 3, :), 3);
y2 = mean(solution2(:, 3, :), 3);
figure;
hold on
plot(x,y1, 'r');
plot(x,y2, 'b');
xlabel('generation')
ylabel('mean of best fitness')
title('mean over 30 runs of best fitness vs. generation for both selection methods');
legend('selectionT', 'selectionR');

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
x = 1: popsize: popsize*maxGen;
y1 = 1./mean(solution1(:, 3, :), 3);
y2 = 1./mean(solution2(:, 3, :), 3);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


sinitial = floor(rand(noSimulations,2)*128);

solutionset1 = [];
solutionset2 = [];
sbestset1 = [];
sbestset2 = [];
T01 = 231267670; 
T02 = 68315651;
alpha1 = 0.9967;
alpha2 = 0.9979;
cputimeset = zeros(noSimulations,1);

for i = 1:noSimulations
    cputimeset(i) = cputime;
    [solution1_, sbest1_] = SA(sinitial(i, :), T01, alpha1, 1, 1, 1000);
    cputimeset(i) = cputime - cputimeset(i);
	
	[solution2_, sbest2_] = SA(sinitial(i, :), T02, alpha2, 1, 1, 1000);
	
    solutionset1(1:size(solution1_,1), 1:size(solution1_,2), i) = solution1_; 
    sbestset1(1:size(sbest1_,1), 1:size(sbest1_,2), i) = sbest1_; 
	
	solutionset2(1:size(solution2_,1), 1:size(solution2_,2), i) = solution2_; 
    sbestset2(1:size(sbest2_,1), 1:size(sbest2_,2), i) = sbest2_; 
end

avgsolution1 = mean(solutionset1,3); 
avgsolution2 = mean(solutionset2,3); 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure;
hold on
plot(x,y1, 'r');
plot(x,y2, 'b');
plot(avgsolution1(:,1), avgsolution1(:,3), 'c--'); 
plot(avgsolution2(:,1), avgsolution2(:,3), 'g--');
xlabel('evaluations')
ylabel('mean of best fitness')
title('mean over 30 runs of minimization vs. evaluations for hw2 and 3');
legend('GA: selectionT', 'GA: selectionR', 'SA: 4b', 'SA: 4c');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

globalMin = 891015625;
globalMinCount = zeros(4,1);

for i = 1:noSimulations
    if 1/solution1(maxGen, 3, i) <= globalMin;
        globalMinCount(1) = globalMinCount(1) + 1;
    end

    if 1/solution2(maxGen, 3, i) <= globalMin;
        globalMinCount(2) = globalMinCount(2) + 1;
    end
    
    if solutionset1(1000, 3, i) <= globalMin;
        globalMinCount(3) = globalMinCount(3) + 1;
    end

    if solutionset2(1000, 3, i) <= globalMin;
        globalMinCount(4) = globalMinCount(4) + 1;
    end
end

fprintf('%d of %d runs found the global maximum for GA: selectionT\n', globalMinCount(1), noSimulations);
fprintf('%d of %d runs found the global maximum for GA: selectionR\n', globalMinCount(2), noSimulations);
fprintf('%d of %d runs found the global maximum for SA: 4b\n', globalMinCount(3), noSimulations);
fprintf('%d of %d runs found the global maximum for SA: 4c\n', globalMinCount(4), noSimulations);

fprintf('mean over 30 runs results: \n');
fprintf('GA: selectionT is %f\n', y1(maxGen));
fprintf('GA: selectionR is %f\n', y2(maxGen));
fprintf('SA: 4b is %f\n', avgsolution1(1000,3));
fprintf('SA: 4c is %f\n', avgsolution2(1000,3));

fprintf('standard deviation over 30 runs results: \n');
fprintf('GA: selectionT is %f\n', std(1./solution1(maxGen, 3, :), 0, 3));
fprintf('GA: selectionR is %f\n', std(1./solution2(maxGen, 3, :), 0, 3));
fprintf('SA: 4b is %f\n', std(solutionset1(1000, 3, :), 0, 3));
fprintf('SA: 4c is %f\n', std(solutionset2(1000, 3, :), 0, 3));

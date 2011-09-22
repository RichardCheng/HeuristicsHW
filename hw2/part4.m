thirty = 30; 

sinitial = floor(rand(thirty,2)*128);

solutionset1 = [];
solutionset2 = [];
sbestset1 = [];
sbestset2 = [];
T01 = 231267670; 
T02 = 68315651;
alpha1 = 0.9967;
alpha2 = 0.9979;
cputimeset = zeros(thirty,1);

for i = 1:thirty
    cputimeset(i) = cputime;
    [solution1, sbest1] = SA(sinitial(i, :), T01, alpha1, 1, 1, 1100);
    cputimeset(i) = cputime - cputimeset(i);
	
	[solution2, sbest2] = SA(sinitial(i, :), T02, alpha2, 1, 1, 1100);
	
    solutionset1(1:size(solution1,1), 1:size(solution1,2), i) = solution1; 
    sbestset1(1:size(sbest1,1), 1:size(sbest1,2), i) = sbest1; 
	
	solutionset2(1:size(solution2,1), 1:size(solution2,2), i) = solution2; 
    sbestset2(1:size(sbest2,1), 1:size(sbest2,2), i) = sbest2; 
end

avgsolution1 = mean(solutionset1,3); 
avgsolution2 = mean(solutionset2,3); 

%plot average of BestCost and CurCost
figure
hold on
plot(avgsolution1(:,1), avgsolution1(:,2), 'b');
plot(avgsolution1(:,1), avgsolution1(:,3), 'g'); 
title ('CurCost and BestCost vs iteration for 4b'); 
legend ('CurCost', 'BestCost'); 
xlabel ('iteration'); 
ylabel ('Cost'); 

figure
hold on
plot(avgsolution2(:,1), avgsolution2(:,2), 'b');
plot(avgsolution2(:,1), avgsolution2(:,3), 'g');
title ('CurCost and BestCost vs iteration for 4c'); 
legend ('CurCost', 'BestCost'); 
xlabel ('iteration'); 
ylabel ('Cost'); 

%report std/avg of BestCost after 1000 iters
fprintf('average BestCost over all 30 runs after 1000 iterations is: %f\n', avgsolution1(1000, 3));
fprintf('std BestCost over all 30 runs after 1000 iterations is: %f\n\n', std(solutionset1(1000, 3, :), 0, 3));

fprintf('average BestCost over all 30 runs after 1000 iterations is: %f\n', avgsolution2(1000, 3));
fprintf('std BestCost over all 30 runs after 1000 iterations is: %f\n\n', std(solutionset2(1000, 3, :), 0, 3));



fprintf('average CPU time is: %f\n', mean(cputimeset)); 
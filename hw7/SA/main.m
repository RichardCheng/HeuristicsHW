
Tinitial = 1.008; 
alpha = 0.999657; 
repetition = 20; 
r = 10.*rand(repetition,20);
bestsolution = zeros(10000,1); 
for i = 1: repetition
    [solution, ~] = SA(r(i,:), Tinitial, alpha, 1, 1, 10000);
    bestsolution = (bestsolution .* (i-1) + solution(:, 3)) ./ i; 
end
    
plot(1:10000, -bestsolution, 'g:'); 
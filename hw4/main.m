load uf20_01.txt
global data;
global dataleng;
data = uf20_01;
dataleng = size(uf20_01, 1); 


%s0 = zeros(1, 20);
%[solution, scurrent] = Tabu(10, s0, 100, 20);

samples = 100;
%sRand = randi([0, 1], samples, 20);
result = zeros(1,20);
MAX_ITER = 100;


for k = 1: 20
    k
    for i = 1 : samples
        [solution, ~] = Tabu(k, sRand(i, :), 20, MAX_ITER);
        result(k) = result(k) + solution(MAX_ITER, 3);
    end
    result(k) = result(k) / samples;
end

plot(1:20,result);
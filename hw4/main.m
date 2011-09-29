load uf20_01.txt
global data;
global dataleng;
data = uf20_01;
dataleng = size(uf20_01, 1); 


s0 = zeros(1, 20);
[solution, scurrent] = Tabu(10, s0, 100, 10);

sRand = randi([0, 1], 100, 20);
result = zeros(20,1);

for k = 1: 20
    k
    for i = 1 : 100
        [solution, ~] = Tabu(k, sRand(i, :), 100, 30);
        result(k) = result(k) + solution(30, 3);
    end
end

plot(linspace(1,20),result);
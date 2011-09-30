load uf20_01.txt
global data;
global dataleng;
data = uf20_01;
dataleng = size(uf20_01, 1); 

samples = 100;
sRand = randi([0, 1], samples, 20);
MAX_ITER = 100;
k = 8;

counter_a = 0;
counter_b = 0.;
counter_c = 0.;

optsolution = zeros(20, 1); 
    
for i = 1 : samples
    [solution, scurrent] = Tabu(k, sRand(i,:), 20, MAX_ITER);
    
    for j = 1:MAX_ITER 
        if (solution(j, 2) == 0)
            if (norm(optsolution) > 0 && norm(optsolution - scurrent(j,:)) > 0)
                disp '4.a: MORE than one solution found for the problem'
            else
                if (norm(solution) == 0)
                    optsolution = scurrent(j,:);
                end
            end
        end
    end
    
    for j = 1:MAX_ITER
        if (solution(j,2)==0)
            counter_b = counter_b + j;
            break;
        end
    end
    
    if (solution(MAX_ITER, 3) == 0) 
        counter_a = counter_a + 1;
    end
    counter_c = counter_c + solution(MAX_ITER, 3);
end

fprintf('4.a: %d of %d trials found optimal.\n', counter_a, samples);

fprintf('4.b: On average, there are %f iterations till optimal is found\n', counter_b/counter_a);

fprintf('4.c: On average, the best cost found is %f\n', counter_c/samples);



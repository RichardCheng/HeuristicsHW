function percent_unSAT = costSAT(solution)

global dataleng;
global data;

unSAT = 0.;
for i = 1 : dataleng
    for j = 1 : 3
        unSAT = unSAT + 1.;

        d = data(i, j);
        if d > 0
            if (solution(d))
                unSAT = unSAT - 1.;
                break;
            end
        else
            if (~solution(-d)) 
                unSAT = unSAT - 1.;
                break;
            end
        end
    end
end

percent_unSAT = unSAT / dataleng;

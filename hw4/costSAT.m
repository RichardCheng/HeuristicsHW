function percent_unSAT = costSAT(solution)

global dataleng;

unSAT = 0.;
for i = 1 : dataleng
    for i = 1 : 3
        unSAT = unSAT + 1.;

        d = data(index, i);
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

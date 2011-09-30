function percent_unSAT = costSAT(solution)

global dataleng;
global data;

unSAT = 0.;
for i = 1 : dataleng
    
    unSAT = unSAT + 1.;
    for j = 1 : 3
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

if (percent_unSAT >= 1) 
    unSAT
    dataleng
    solution
end
function percent_unSAT = costSAT(solution)

global dataleng;

unSAT = 0.;
for i = 1 : dataleng
    if ~clauseSAT(solution, i)
        unSAT = unSAT + 1.;
    end
end

percent_unSAT = unSAT / dataleng;
    
function bool = clauseSAT(solution, index)
    global data;
    bool = 0;
    for i = 1 : 3
        d = data(index, i);
        if d > 0
            v = solution(abs(d));
        else
            v = ~solution(abs(d));
        end
        
        if (v)
            bool = 1;
            break;
        end
    end

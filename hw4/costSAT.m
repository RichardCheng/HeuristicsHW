function percent_unSAT = costSAT(solution)

global data;
leng = size(data, 1);

unSAT = 0.;
for i = 1 : leng
    if ~clauseSAT(solution, i)
        unSAT = unSAT + 1.;
    end
end

percent_unSAT = unSAT / leng;
    
function bool = clauseSAT(solution, index)
    global data;
    C = data(index, :); 
    bool = 0;
    for i = 1 : 3
        if sign(C(1)) == 1
            v = solution(abs(C(i)));
        else
            v = ~solution(abs(C(i)));
        end
        bool = bool | v; 
    end

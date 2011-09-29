function [solution, scurrent] = Tabu(tabuLen, sinitial, alInitial, iter)
tabu = zeros(tabuLen, 1);
al = alInitial;
s = sinitial;
tabuInd = 1;
BIGNUM = 100000;
solution = zeros(iter, 3);
scurrent = zeros(iter, length(sinitial));

for i=1:iter
    neighbors = neighbor(s);

    for j=1:size(neighbors,1)
        costs(j) = costSAT(neighborsi(j,:));    
    end

    [val, index] = min(costs);
    diff = calcDiff(s, neighbors(index));

    if (size(find(tabu==diff), 2) == 0) 
        % Not found
        s = neighbors(index);
        tabu(tabuInd) = diff;
        tabuInd = tabuInd + 1;
        if tabuInd > tabuLen
            tabuInd = 1;
        end

        % update al
        if (val < al)
            % TODO: FIX THIS>>>
            al = val
        end
    else
        if (val < al)
            s = neighbors(index);
            tabu(tabuInd) = diff;
            tabuInd = tabuInd + 1;
            if tabuInd > tabuLen
                tabuInd = 1;
            end

            % update al
            % TODO: FIX THIS>>>
            al = val
        else
            % Find the next untabued result
            costs(index) = BIGNUM;
            [val, index] = min(costs);
            while (size(find(tabu==calcDiff(s, neighbors(index))),2) == 1)
                costs(index) = BIGNUM;
                [val, index] = min(costs);
            end

            s = neighbors(index);
            tabu(tabuInd) = diff;
            tabuInd = tabuInd + 1;
            if tabuInd > tabuLen
                tabuInd = 1;
            end
        end 
    end

    solution(i, 1) = i;
    solution(i, 2) = val;
    solution(i, 3) = al;
    scurrent(i, :) = s;
end

function bit = calcDiff(s1, s2)
for i=1:length(s1)
    if (s1(i) ~= s2(i))
        bit = i;
        break;
    end
end
bit = 0;

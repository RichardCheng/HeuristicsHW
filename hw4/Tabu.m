function [solution, scurrent] = Tabu(tabuLen, sinitial, alInitial, iter)
tabu = zeros(tabuLen, 1);
al = alInitial;
s = sinitial;
tabuInd = 1;
BIGNUM = 100000;
solution = zeros(iter, 3);
scurrent = zeros(iter, length(sinitial));

costs = zeros(1, length(sinitial)); 

for i=1:iter
    tic
    neighbors = neighborhood(s);
    toc
    
    tic 
    for j=1:size(neighbors,1)
        costs(j) = costSAT(neighbors(j,:));
    end
    toc
    
    tic
    [val, index] = min(costs);
    diff = calcDiff(s, neighbors(index,:));

    if (isempty(tabu==diff)) 
        % Not found
        s = neighbors(index,:);
        tabu(tabuInd) = diff;
        tabuInd = tabuInd + 1;
        if tabuInd > tabuLen
            tabuInd = 1;
        end

        % update al
        if (val < al)
            % TODO: FIX THIS>>>
            al = val;
        end
    else
        if (val < al)
            s = neighbors(index,:);
            tabu(tabuInd) = diff;
            tabuInd = tabuInd + 1;
            if tabuInd > tabuLen
                tabuInd = 1;
            end

            % update al
            % TODO: FIX THIS>>>
            al = val;
        else
            % Find the next untabued result
            costs(index) = BIGNUM;
            [val, index] = min(costs);
            %fprintf('Begining cost... initCost = %f\n', val);
            while (isempty(tabu==calcDiff(s, neighbors(index,:))) && val ~= BIGNUM)
                costs(index) = BIGNUM;
                [val, index] = min(costs);
                %fprintf('new Cost = %f\n', val);
                %fprintf('curr diff = %d\n', calcDiff(s, neighbors(index,:)));
                %fprintf('result = %d\n', size(find(tabu==calcDiff(s, neighbors(index,:))),2));
            end

            if (val == BIGNUM) 
                fprintf('Something is messed up in iteration %d dude... fix it.\n', i);
            else
                s = neighbors(index,:);
                tabu(tabuInd) = diff;
                tabuInd = tabuInd + 1;
                if tabuInd > tabuLen
                    tabuInd = 1;
                end
            end
        end 
    end
    solution(i, 1) = i;
    solution(i, 2) = val;
    solution(i, 3) = al;
    scurrent(i, :) = s;
    toc
    display('---')
end

function bit = calcDiff(s1, s2)
bit = 0;
for i=1:length(s1)
    if (s1(i) ~= s2(i))
        bit = i;
        break;
    end
end


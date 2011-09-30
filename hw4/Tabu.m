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
    neighbors = neighborhood(s);
     
    for j=1:size(neighbors,1)
        costs(j) = costSAT(neighbors(j,:));
    end
    
    [val, index] = min(costs);
    s = neighbors(index,:);
    %diff
    %tabu
    
    if (sum(tabu==index) == 0) 
        %disp 'not tabued'
        % Not found
        %s = neighbors(index,:);
        tabu(tabuInd) = index;
        tabuInd = tabuInd + 1;
        if tabuInd > tabuLen
            tabuInd = 1;
        end

        % update al
        if (val < al)
            al = val;
        end
    else
        if (val < al)
            disp 'tabued, improved'
            %s = neighbors(index,:);
            tabu(tabuInd) = index;
            tabuInd = tabuInd + 1;
            if tabuInd > tabuLen
                tabuInd = 1;
            end

            % update al
            al = val;
        else
            %disp 'tabued, not improved'
            %fprintf('Begining cost... initCost = %f\n', val);
            while (sum(tabu==index) > 0)
                costs(index) = BIGNUM;
                [val, index] = min(costs);
                if (val == BIGNUM) 
                    break; 
                end
                %fprintf('new Cost = %f\n', val);
                %fprintf('curr diff = %d\n', calcDiff(s, neighbors(index,:)));
                %fprintf('result = %d\n', sum(tabu==calcDiff(s, neighbors(index,:))) == 0);
            end

            %if (val == BIGNUM && ~(i > tabuLen && tabuLen > length(sinitial))) 
            %    fprintf('Something is messed up in iteration %d dude... fix it.\n', i);
            %else
                s = neighbors(index,:);
                tabu(tabuInd) = index;
                tabuInd = tabuInd + 1;
                if tabuInd > tabuLen
                    tabuInd = 1;
                end
           % end
        end 
    end
    solution(i, 1) = i;
    solution(i, 2) = val;
    solution(i, 3) = al;
    scurrent(i, :) = s;

end

% function bit = calcDiff(s1, s2)
% bit = 0;
% for i=1:length(s1)
%     if (s1(i) ~= s2(i))
%         bit = i;
%         break;
%     end
% end


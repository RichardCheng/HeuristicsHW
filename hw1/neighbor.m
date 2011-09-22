%find new neighbor in (-25,25)
function snew = neighbor(s) 

%get lowerbound so that it doesn't go below 0
lowbound = s - 25;
if lowbound < 0 
    lowbound = 0;
end

%get higherbound so that it doesn't go above 500
highbound = s + 25;
if highbound > 500
    highbound = 500;
end

%keep generating random number if the number generated equals the current
%number
while (true)
    snew = floor(rand*(highbound - lowbound + 1)) + lowbound;    
    if snew ~= s
        break
    end
end

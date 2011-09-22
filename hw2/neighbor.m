%find new neighbor in (-25,25)
function snew = neighbor(s) 

%get lowerbound so that it doesn't go below 0
lowbound = s - 25;
if lowbound < 0 
    lowbound = 0;
end

%get higherbound so that it doesn't go above 500
highbound = s + 25;
if highbound > 127;
    highbound = 127;
end

snew = floor(rand*(highbound - lowbound + 1)) + lowbound;    

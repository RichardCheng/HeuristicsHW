Sp = floor(rand(1,2).*128);
AP = 20;
neighborCosts = zeros(AP+1, 1); 

for i = 1:AP
    neighborCosts(i) = cost(neighbor2D(Sp)); 
end
neighborCosts(AP+1) = cost(Sp); 

So = min(neighborCosts);

constant = ones(AP+1,1) * So; 

deltaCosts = neighborCosts - constant;
sumDeltaCosts = sum(deltaCosts);


fprintf('average delta costs is: %f\n', sumDeltaCosts/AP); 

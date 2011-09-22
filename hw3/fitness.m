function result = fitness(s)
    s1 = bin2dec(s(1:7));
    s2 = bin2dec(s(8:14));
    result = 10^9-(625-(s1-25)^2)*(1600-(s2-10)^2)*sin(s1*pi/10)*sin(s2*pi/10);

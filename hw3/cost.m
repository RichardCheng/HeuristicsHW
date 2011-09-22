function result = cost(S)
result = 10.^9-(625-(S(1)-25).^2).*(1600-(S(2)-10).^2).*sin((S(1)).*pi./10).*sin((S(2)).*pi./10);

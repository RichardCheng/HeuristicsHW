function t = getMatrix(T)
t = zeros(4, 4);
t(1, 2) = 1/2;
t(1, 3) = 1/2;
t(2, 1) = 0.5*exp(-1/T);
t(2, 4) = 0.5*exp(-2/T);
t(2, 2) = 1 - t(2, 1) - t(2, 4);
t(3, 1) = 0.5*exp(-2/T);
t(3, 4) = 0.5*exp(-3/T);
t(3, 3) = 1 - t(3, 1) - t(3, 4);
t(4, 2) = 1/2;
t(4, 3) = 1/2;

t
t^5
t^10
t^1000
sum(0.25*t^5,1)
sum(0.25*t^10,1)
sum(0.25*t^1000,1)

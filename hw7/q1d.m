%DDS:
DDS = [0.72513 0.70825 0.71831 0.74809 0.71433 0.76385 0.76094 0.69754 0.73678 0.74212 0.75094 0.71568 0.76212 0.75417 0.70109 0.70675 0.73881 0.70731 0.73868 0.75904];

% running GA:
GA = [5.643482e-001 5.416192e-001 6.255452e-001 5.148714e-001 5.056900e-001 5.659632e-001 5.284955e-001 5.590679e-001 5.954429e-001 6.380577e-001 6.534347e-001 6.217740e-001 5.352387e-001 5.884358e-001 6.016429e-001 5.683954e-001 6.445623e-001 5.435830e-001 5.106788e-001 4.972922e-001];

% running SA:
SA = [-1.970374e-001 -2.314389e-001 -2.440555e-001 -2.094340e-001 -1.854015e-001 -2.189365e-001 -2.209299e-001 -2.591634e-001 -1.798161e-001 -2.809287e-001 -2.164988e-001 -2.364682e-001 -2.054828e-001 -2.215384e-001 -2.442049e-001 -2.265624e-001 -1.958630e-001 -1.920085e-001 -2.234456e-001 -2.090195e-001 ];
SA = -SA;

% Combining:
res(1,:) = DDS;
res(2,:) = GA;
res(3,:) = SA;

% boxplot
figure
boxplot(res','labels', {'DDS' 'GA' 'SA'});

% ecdf
[fdds,xdds,flo,fup] = ecdf(DDS);
[fga,xga,flo,fup] = ecdf(GA);
[fsa,xsa,flo,fup] = ecdf(SA);

figure
hold on
plot(xdds,fdds, 'r');
plot(xga,fga, 'g');
plot(xsa,fsa, 'b');
xlabel('cumulative probability');
ylabel('objective function value');
title('Empirical CDF for DDS, GA, and SA');
legend('DDS', 'GA', 'SA');
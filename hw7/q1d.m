%DDS:
DDS = [0.72513 0.70825 0.71831 0.74809 0.71433 0.76385 0.76094 0.69754 0.73678 0.74212 0.75094 0.71568 0.76212 0.75417 0.70109 0.70675 0.73881 0.70731 0.73868 0.75904];

% running GA:
GA = [5.873824e-001 5.753190e-001 6.068312e-001 5.901685e-001 5.844889e-001 5.882655e-001 6.019899e-001 5.771182e-001 5.453153e-001 4.490493e-001 6.121610e-001 6.001846e-001 4.868738e-001 5.687299e-001 5.006061e-001 4.768492e-001 5.565101e-001 6.185262e-001 6.295882e-001 5.898114e-001 ]

% running SA:
SA = [-7.457496e-001 -7.410139e-001 -7.536141e-001 -7.551384e-001 -7.536895e-001 -7.712034e-001 -7.663489e-001 -7.726179e-001 -7.677715e-001 -7.508422e-001 -7.587998e-001 -7.728770e-001 -7.615266e-001 -7.285694e-001 -7.561617e-001 -7.521449e-001 -7.447165e-001 -7.678549e-001 -7.689770e-001 -6.887951e-001 ]
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

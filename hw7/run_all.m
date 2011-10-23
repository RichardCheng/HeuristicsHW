figure
hold on
%assume DDS is prerun and preprocessed
load DDS/bump/bump_AVG.out
plot(1:10000, bump_AVG(:,2), 'b--');

%run GA 
run GA/main.m

%run SA
run SA/main.m

title('average best bump function value vs. function evaluations')
xlabel('function evaluations')
ylabel('average best bump function value')
legend('DDS', 'GA', 'SA')
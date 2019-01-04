clear all
close all
clc

t = 0:0.01:2;

F1 = zeros(1000,length(t));
F2 = zeros(1000,length(t));
for i = 1:1000
    F1(i,:) = sin(2*pi*t) + rand(size(t)) - 0.5;
    F2(i,:) = diric(t,20) + 0.5*(rand(size(t))-0.5);
end

figure(1)
plotshaded(t,mean(F1),std(F1),'r',0.1,'LineWidth',1)
[curve,shaded] = plotshaded(t,mean(F2),std(F2),[0,0.5,0.9],0.25,'--','LineWidth',1.5);
legend('Sin','Dirichlet')
grid on
ylabel('Mean + Std. Dev.')
xlabel('Time')

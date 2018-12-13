%% PLOTFIXER EXAMPLE MATLAB Code
% Created by: Zane Zook
% Date: 12/13/2018
close all;
clear all; 
clc;

%% Data Creation
x = linspace(-2*pi,2*pi,50);
y1 = sin(x);
y2 = cos(x);

%% Plot Creation
figure; hold on;
plot(x,y1,'*');
plot(x,y2);
title('2-D Line Plot');
xlabel('x');
ylabel('y');
legend('sin(x)','cos(x)');
plotfixer;
clear all
close all
clc

% Example 1
X1 = -2+linspace(0,-20,400);
Y1 = 3+[linspace(0,0,100) linspace(5,5,100) linspace(10,10,100) linspace(15,15,100)];
[Asum1, Anet1, ~, ~, A1] = asumanet(X1,Y1)

% Example 2
X2 = linspace(0,2*pi,100)+1;
Y2 = -cos(2*X2).*sin(5*X2)+1;
[Asum2, Anet2, ~, ~, A2] = asumanet(X2,Y2,1)% pass one to show plots

% Example 3
X3 = X2*cos(pi) + Y2*sin(pi)+1;
Y3 = -X2*sin(pi) + Y2*cos(pi)+2;
[Asum3, Anet3, AR3, AL3, ~] = asumanet(X3,Y3,1) % pass one to show plots
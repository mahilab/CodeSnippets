clear all; close all; clc
% Evan Pezent
% plot2mp4.m demo

% Data should be a function of time measured in seconds. Interval size can
% be whatever you like and doesn't have to be the same for all plots.
t = 0:0.001:5;
s = sin(2*pi*t);
c = cos(2*pi*t);
[ps,i_ps] = findpeaks(s);
[vs,i_vs] = findpeaks(max(s)-s);

% Create your figure and plot your data just like normal, but make sure the
% figure has a handle. Feel free to format the plot area however you like!
fig1 = figure(1);
hold on
plot(t,s,'-','LineWidth',2,'Color','c');
plot(t,c,'-','LineWidth',2,'Color','b');
plot(t(i_ps),s(i_ps),'vb','MarkerFaceColor','b')
plot(t(i_vs),s(i_vs),'^b','MarkerFaceColor','b')
axis([0 5 -2 2])
xlabel('Time [s]')
ylabel('Amplitude')
legend('sin(2\pit)','cos(2\pit)','Peaks','Valleys');
grid on
box on
set(gca,'FontName','Times New Roman','FontSize',15,'LineWidth',1)

% Video resolution is determine by the figure's width and height.
fig1.Position = [0 0 1280 720];

% Creating your video is simple. Just pass in the figure handle along with
% the desired framerate, playback speed factor, and a video title.
plot2mp4(fig1,60,1,'example');







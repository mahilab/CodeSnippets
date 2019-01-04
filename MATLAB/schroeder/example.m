clear all
close all
clc

f_min = 0;    % Starting frequency
f_max = 5;    % Ending frequency
Fs    = 1000; % Sampling Rate
t_max = 60;   % Duration

[u,t] = schroeder(f_min,f_max,Fs,t_max);

figure(1)
plot([t t(end) + t],[u u])
xlabel('Time [s])')
ylabel('Amplitude')

figure(2)
N = length(u);
xdft = fft(u);
xdft = xdft(1:N/2+1);
psdx = (1/(Fs*N)) * abs(xdft).^2;
psdx(2:end-1) = 2*psdx(2:end-1);
freq = 0:Fs/length(u):Fs/2;
semilogx(freq,10*log10(psdx))
grid on
xlabel('Frequency [Hz]')
ylabel('Power/Frequency [dB/Hz]')
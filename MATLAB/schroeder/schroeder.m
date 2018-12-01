% Evan Pezent | www.evanpezent.com | epezent@rice.edu
% 11/30/2018

function [u,t] = schroeder(f_min,f_max,Fs,t_max)

eta = 1/t_max;
N   = (f_max - f_min) / eta + 1;
A   = 1;
t   = 0:1/Fs:(t_max);
u   = zeros(size(t));

for k = 1:N
    f_k   = f_min + (k-1)*eta;
    phi_k = -k*(k-1)*pi/N;
    u     = u + A*cos(2*pi*f_k*t + phi_k);
end

u = u - mean(u);   % demean
u = u/max(abs(u)); % normalize

end






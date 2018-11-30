% Evan Pezent (epezent@rice.edu)
% Asum/Anet Extraction
% 3/7/2017

function [Asum, Anet, AR, AL, A] = asumanet(X,Y,showPlot)

% Input: trajectory x and y values, optional bool to show debug plots
% Output:
%   AR:   total area to right of straight line
%   AL:   total area to left of stright line
%   Asum: AR + AL
%   Anet: AR - AL
%   A:    All area patches

% Adapted from:

% S. K. Charles and N. Hogan, “The curvature and variability of wrist
% and arm movements,” Experimental Brain Research, vol. 203, no. 1, pp.
% 63–73, 2010.

if ~exist('showPlot','var')
    showPlot = 0;
end

% Translate X,Y to origin
X0 = X - X(1);
Y0 = Y - Y(1);

% Get straight line length and angle from horizontal
L = sqrt(X0(end)^2 + Y0(end)^2);
theta = atan2(Y0(end), X0(end));

% Rotate X,Y clockwise by theta so that straight line is horizontal
Xr = X0*cos(theta) + Y0*sin(theta);
Yr = -X0*sin(theta) + Y0*cos(theta);

% Ensure that end Y value is 0 (may not be due to numerical precision)
Yr(end) = 0; 

% Find x-axis crossover points
[crossXr,~] = intersections(Xr,Yr,[0 L],[0 0],1);

% Insert crossover points if they don't explicitly exist
for ii = 1:length(crossXr)
    if isempty(find(Xr==crossXr(ii),1))
        indLess = find(Xr<crossXr(ii));
        indGrtr = find(Xr>crossXr(ii));
        Xr = [Xr(indLess) crossXr(ii) Xr(indGrtr)];
        Yr = [Yr(indLess) 0 Yr(indGrtr)];
    end    
end

% Get indicies of cross over points
ind = find(Yr==0);

% Plots for debugging; comment out in practice (as well as fill() call)
if (showPlot)
    figure
    hold on
    plot(X,Y,'k')
    plot(X0,Y0,'r')
    plot([0 X0(end)],[0 Y0(end)],'m')
    plot(Xr,Yr,'b');
    plot([0 L],[0 0],'b:')
    plot(Xr(ind),Yr(ind),'bo')
    axis equal
    grid on
end

% Find areas under/over curve between intersection points
A = zeros(1,length(ind)-1);

% Determine if first area is AR (below) or AL (above)
a = sign(Yr(2)); % -1 == AR, 1 == AL

for ii = 1:length(ind)-1
    ind1 = ind(ii);
    ind2 = ind(ii+1);
    % Old method of finding area; may not work if Yr(Xr_ii) is not unique
    % A(ii) = trapz(Xr(ind1:ind2),Yr(ind1:ind2)); 
    A(ii) = polyarea(Xr(ind1:ind2),Yr(ind1:ind2))*a;
    if (showPlot)
        fill(Xr(ind1:ind2),Yr(ind1:ind2),'c')
    end
    a = -a; % alternate sign
end

% Compute return values
AR = abs(sum(A(A<0)));
AL = abs(sum(A(A>0)));
Asum = AR + AL;
Anet = AR - AL;

end
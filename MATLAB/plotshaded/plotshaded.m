% Evan Pezent
% 1/3/2019

function varargout = plotshaded(x,y,o,c,a,varargin)
% x - array of x-axis values
% y - array of y-axis values
% o - array of of y-axis offsets for top and bottom of shaded region
% c - desired color of line and shaded region (e.g. 'r' or [1,0,0])
% a - alpha value for shaded region in range 0 to 1
% varargin - optional variable number of arguments to format center line 

px=[x, fliplr(x)];
py=[y+o, fliplr(y-o)];
shaded = patch(px,py,1,'FaceColor',c,'EdgeColor','none');
hold on
alpha(shaded,a);
curve = plot(x,y,varargin{:},'Color',c);
set(get(get(shaded,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

if (nargout > 0)
    varargout{1} = curve;
end
if (nargout > 1)
     varargout{2} = shaded;
end

end
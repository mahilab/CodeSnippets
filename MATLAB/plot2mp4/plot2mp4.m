function plot2mp4(h,fps,speed,filename)
% Evan Pezent (epezent@rice.edu) - 1/27/2017

%% FLAGS
lgnd_flg = 0;

%% PROCESS FIGURE HANDLE
% reassign h as a deepcopy of h
h = copy(h);
% get all children of h
children = h.Children;
% get legend (if present) and axes handles
for ii = 1:length(children)
    child = children(ii);
    if isa(child,'matlab.graphics.illustration.Legend')
        lgnd_h = child;
        lgnd_labels = child.String;
        lgnd_flg = 1;
    elseif isa(child,'matlab.graphics.axis.Axes')
        axes_h = child;
        axis_limits = [child.XLim child.YLim];
    end
end
% get plots/lines
P = allchild(axes_h);
% save figure position for future
pos = h.Position;
% infer video start, end, and duration from axis_limits
t0 = axis_limits(1);
tf = axis_limits(2);
dur = tf-t0;
% store import plot information and styles for when MATLAB memory management dumps P
for n = 1:length(P)
    m = length(P)-n+1;
    store(n).t = P(m).XData;
    store(n).y = P(m).YData;
    store(n).Color = P(m).Color;
    store(n).LineStyle = P(m).LineStyle;
    store(n).LineWidth = P(m).LineWidth;
    store(n).Marker = P(m).Marker;
    store(n).MarkerFaceColor = P(m).MarkerFaceColor;
    store(n).MarkerEdgeColor = P(m).MarkerEdgeColor;
    store(n).DisplayName = P(m).DisplayName;
end

%% RECONSTRUCT THE FIGURE INTO A VIDEO
% establish figure position and axis limits
set(h, 'Position', pos);
axis(axis_limits)
% calculate number of frames to draw
n_frames = round(dur*fps/speed);
% create and open an MPEG-4 video container
video = VideoWriter(filename,'MPEG-4');
video.FrameRate = fps;
open(video)
% calculalte vector of interpolated times
T = t0 + (tf-t0).*((1:n_frames)-1)./(n_frames-1);
% start the drawing loop
for f = 1:n_frames
    % clear the figure window of any plots/lines
    cla
    % for every plot/line
    for p = 1:n
        % find indices of data less than or equal to current time
        ind = sum(store(p).t<=T(f));       
        if ind
            t = store(p).t(1:ind);
            y = store(p).y(1:ind);
        elseif lgnd_flg && f == 1
            t = axis_limits(2)+10*abs(axis_limits(2));
            y = axis_limits(4)+10*abs(axis_limits(4));
        else
            t = [];
            y = [];
        end
        % plot it with the original style
        plot(t,y,...
            'Color',store(p).Color,...
            'LineStyle',store(p).LineStyle,...
            'LineWidth',store(p).LineWidth,...
            'Marker',store(p).Marker,...
            'MarkerFaceColor',store(p).MarkerFaceColor,...
            'MarkerEdgeColor',store(p).MarkerEdgeColor,...
            'DisplayName',store(p).DisplayName)
        hold on
    end
    if lgnd_flg && f == 1
        legend(lgnd_labels)
    end
    % reset the figure position in case the user moves it
    set(h, 'Position', pos);
    % write the frame to the video container
    writeVideo(video,getframe(gcf));
end
% close the video container
close(video)
close(h)
end
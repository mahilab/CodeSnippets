function b = initBoard()
b.matrix = [0 0 0 0 0 0 0 0 4 8 0 0 0 0 0 0;
            0 0 0 0 0 0 0 4 8 4 8 0 0 0 0 0;
            0 0 0 0 0 0 4 8 4 8 4 8 0 0 0 0;
            0 0 0 0 0 0 8 4 8 4 8 4 0 0 0 0;
            0 0 0 0 0 0 4 8 4 8 4 8 4 8 0 0;
            0 0 0 0 8 4 8 4 8 4 8 4 8 4 8 0;
            0 0 4 8 4 8 4 8 4 8 4 8 4 8 4 8;
            0 4 8 4 8 4 8 4 8 4 8 4 8 4 8 0;
            0 8 4 8 4 8 4 8 4 8 4 8 4 8 0 0;
            8 4 8 4 8 4 8 4 8 4 8 4 8 0 0 0;
            0 8 4 8 4 8 4 8 4 8 4 8 0 0 0 0;
            0 0 0 4 8 4 8 4 8 4 8 0 0 0 0 0;
            0 0 0 8 4 8 4 8 4 8 0 0 0 0 0 0;
            0 0 0 0 8 4 8 4 8 0 0 0 0 0 0 0;
            0 0 0 0 0 8 4 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0;]*-1;
        
b.matrix1 = b.matrix;

b.identity = zeros(16);

a = 0;
for ii = 1:16
    for jj = 1:16
        b.identity(ii,jj) = (mod(a,2)+1)*4;
        a = a+1;
    end
    a = a+1;
end

% Find Start and End Columns by Row
for ii = 1:size(b.matrix,1)
    a = 1;
    for jj = 1:size(b.matrix,2)
        if b.matrix(ii,jj) == 0
            a = a +1;
        else
            break
        end
    end
    b.startCol(ii) = a;
    c = 1;
    flip = fliplr(b.matrix);
    for jj = 1:size(b.matrix,2)
        if flip(ii,jj) == 0
            c = c +1;
        else
            break
        end
    end
    b.endCol(ii) = size(b.matrix,2)+1-c;
end

% Draw Puzzle Board
% set(0,'DefaultFigureWindowStyle','docked')
hold on
axis([-1 18 -1 18])
axis square
grid on
set(gca,'Ydir','reverse','XAxisLocation','top')
set(gca,'XTick',1:1:16,'XColor',[0.5 0.5 0.5])
set(gca,'YTick',1:1:16,'YColor',[0.5 0.5 0.5])
set(gca,'layer','top')
b.h = drawBoard(b);
% set(0,'DefaultFigureWindowStyle','normal')
end


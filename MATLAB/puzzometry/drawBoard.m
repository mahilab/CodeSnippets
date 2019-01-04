function h = drawBoard(B)

matrix = -B.matrix;

R = size(matrix,1);
C = size(matrix,2);

a = 2-sqrt(2);
b = a/2;
c = a/sqrt(2);
d = b+c;

% Outer Box
h(1) = fill([7 18 10 -1 7],[18 7 -1 10 18],'k','FaceColor',[0.75 0.75 0.75],'EdgeColor','none');

% Empty Interior Space
k = 2;
for ii = 1:R
    for jj = 1:C
        if matrix(ii,jj) == 4
            x = [b b -b -b b]+jj;
            y = [-b b b -b -b]+ii;
            h(k) = fill(x,y,'k','FaceColor',[1 1 1],'EdgeColor','none');
            k = k+1;
        elseif matrix(ii,jj) == 8
            x = [b d d b -b -d -d -b b]+jj;
            y = [-d -b b d d b -b -d -d]+ii;
            h(k) = fill(x,y,'k','FaceColor',[1 1 1],'EdgeColor','none');
            k = k+1;
        end               
    end
end
end
function [h,X,Y] = drawPiece(p)


a = 2-sqrt(2);
b = a/2;
c = a/sqrt(2);
d = b+c;

% n = nnz(P.matrix1);
% h = zeros(1,n);

X = [];
Y = [];

k = 1;
for ii = 1:p.size1(1)
    for jj = 1:p.size1(2)
        if p.matrix1(ii,jj) == 4
            x = [b b -b -b b]+jj+p.position(2)-1;
            y = [-b b b -b -b]+ii+p.position(1)-1;
            X(length(X)+1:length(X)+length(x)) = x;
            Y(length(Y)+1:length(Y)+length(y)) = y;            
            h(k) = fill(x,y,'k','FaceColor',p.color,'EdgeColor','none',...
                'FaceAlpha',0.75);
            k = k+1;
        elseif p.matrix1(ii,jj) == 8
            x = [b d d b -b -d -d -b b]+jj+p.position(2)-1;
            y = [-d -b b d d b -b -d -d]+ii+p.position(1)-1;
            X(length(X)+1:length(X)+length(x)) = x;
            Y(length(Y)+1:length(Y)+length(y)) = y;
            h(k) = fill(x,y,'k','FaceColor',p.color,'EdgeColor','none',...
                'FaceAlpha',0.75);
            k = k+1;
        end               
    end
end


end


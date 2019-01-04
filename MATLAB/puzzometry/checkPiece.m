function [valid,position] = checkPiece(p,B,animation)

% Find Top Left Non-Zero Position of current b.matrix1
[R,C] = find(B.matrix1);
r = min(R);
C = C(R==r);
c = min(C);
topLeft = [r c];

% Some pieces need to offset since the top left element of P.matrix1 is 0
offset = 0;
for ii = 1:p.size1(2)
    if p.matrix1(1,ii) == 0
        offset = offset +1;
    else
        break
    end
end

% Set checking position
position = [topLeft(1) topLeft(2)-offset];
if position(2) < 1
    position(2) = 1;
end
if position(2)+p.size1(2) > 17
    position(2) = 17-p.size1(2);
end


% Check Fit Type
Pfit = p.fit(p.perm1);
Bfit = B.identity(position(1),position(2))*0.25;

if Pfit == Bfit
    % Check Position
    p.position = position;
    p.matrix2 = zeros(16);
    p.matrix2(p.position(1):p.position(1)+p.size1(1)-1,p.position(2):p.position(2)+p.size1(2)-1) = p.matrix1;
    checkMat1 = p.matrix2 + logical(p.matrix2).*B.matrix1;
    if not(any(any(checkMat1))) % checkMat = 0 =>
        
        % Check for Single Holes
        checkMat2 = padarray(p.matrix2+B.matrix1,[1 1]);
        hole = 0;
        for ii = 2:17
            for jj = B.startCol(ii-1)+1:B.endCol(ii-1)+1
                % square
                if checkMat2(ii,jj) == -4 && checkMat2(ii,jj+1) == 0 && checkMat2(ii-1,jj) == 0 && checkMat2(ii,jj-1) == 0 && checkMat2(ii+1,jj) == 0
                    hole = 1;
                    break
                % octagon
                elseif checkMat2(ii,jj) == -8 && checkMat2(ii,jj+1) == 0 && checkMat2(ii-1,jj+1) == 0 && checkMat2(ii-1,jj) == 0 && checkMat2(ii-1,jj-1) == 0 && checkMat2(ii,jj-1) == 0 && checkMat2(ii+1,jj-1) == 0 && checkMat2(ii+1,jj) == 0 && checkMat2(ii+1,jj+1) == 0
                    hole = 1;
                    break
                end
            end
            if hole
                break
            end
        end
        
        % If no Single Holes, Check for Double Holes
        if not(hole)
            cc = padarray(checkMat2,[1 1]);
            for ii = 3:18
                for jj = B.startCol(ii-2)+2:B.endCol(ii-2)+2
                    % only need to check octagon positions
                    if cc(ii,jj) == -8
                        % octagon w/ square to right
                        if cc(ii,jj+1) == -4 && cc(ii,jj+2) == 0 && cc(ii-1,jj+1) == 0 && cc(ii-1,jj) == 0 && cc(ii-1,jj-1) == 0 && cc(ii,jj-1) == 0 && cc(ii+1,jj-1) == 0 && cc(ii+1,jj) == 0 && cc(ii+1,jj+1) == 0
                            hole = 1;
                            break
                        % octagon w/ square above
                        elseif cc(ii-1,jj) == -4 && cc(ii-2,jj) == 0 && cc(ii-1,jj-1) == 0 && cc(ii,jj-1) == 0 && cc(ii+1,jj-1) == 0 && cc(ii+1,jj) == 0 && cc(ii+1,jj+1) == 0 && cc(ii,jj+1) == 0 && cc(ii-1,jj+1) == 0
                            hole = 1;
                            break
                        % octagon w/ square to left
                        elseif cc(ii,jj-1) == -4 && cc(ii,jj-2) == 0 && cc(ii+1,jj-1) == 0 && cc(ii+1,jj) == 0 && cc(ii+1,jj+1) == 0 && cc(ii,jj+1) == 0 && cc(ii-1,jj+1) == 0 && cc(ii-1,jj) == 0 && cc(ii-1,jj-1) == 0
                            hole = 1;
                            break
                        % octagon w/ square below
                        elseif cc(ii+1,jj) == -4 && cc(ii+2,jj) == 0 && cc(ii+1,jj+1) == 0 && cc(ii,jj+1) == 0 && cc(ii-1,jj+1) == 0 && cc(ii-1,jj) == 0 && cc(ii-1,jj-1) == 0 && cc(ii,jj-1) == 0 && cc(ii+1,jj-1) == 0
                            hole = 1;
                            break
                        end
                    end
                end
            end
        end       
        
        % If no holes, valid!
        if not(hole)
            valid = 1;
            if animation == 2
                p.color = [0 255 0]/255;
                p.h = drawPiece(p);
                pause(0.5)
                delete(p.h)
            end
        else
            valid = 0;
            if animation == 2
                p.color = [255 0 0]/255;
                p.h = drawPiece(p);
                pause(0.0001)
                delete(p.h)
            end
        end
    else
        valid = 0;
        if animation == 2
            p.color = [255 0 0]/255;
            p.h = drawPiece(p);
            pause(0.0001)
            delete(p.h)
        end
    end
else
    valid = 0;
    if animation == 2
        p.position = position;
        p.color = [255 0 0]/255;
        p.h = drawPiece(p);
        pause(0.0001)
        delete(p.h)
    end
end

end
function [index,Face] = findMatrixEdges(matrix)

padMatix = padarray(matrix,[1 1]);

% Find Start Position
row1NonZeros = find(padMatix(2,:));
startRow = 2;
startCol = row1NonZeros(1);

% Find Edge
row = 0;
col = 0;
a = 1;
while row ~= startRow || col ~= startCol
    if a == 1;
        row = startRow;
        col = startCol;
        index = [startRow-1 startCol-1];        
        move = 'd';
    end    
    
    if move == 'd' % prev move DOWN
        
        if padMatix(row,col+1) ~= 0 % move RIGHT
            col = col+1;
            move = 'r';
            face = 't';
        elseif padMatix(row+1,col) ~= 0 % move DOWN
            row = row+1;
            move = 'd';
            face = 'r';
        elseif padMatix(row,col-1) ~= 0 % move LEFT
            col = col-1;
            move = 'l';
            face = 'rb';
        elseif padMatix(row-1,col) ~= 0 % move UP
            row = row-1;
            move = 'u';
            face = 'rbl';
        end
        
    elseif move == 'l' % prev move LEFT
        
        if padMatix(row+1,col) ~= 0 % move DOWN
            row = row+1;
            move = 'd';
            face = 'r';
        elseif padMatix(row,col-1) ~= 0 % move LEFT
            col = col-1;
            move = 'l';
            face = 'b';
        elseif padMatix(row-1,col) ~= 0 % move UP
            row = row-1;
            move = 'u';
            face = 'bl';
        elseif padMatix(row,col+1) ~= 0 % move RIGHT
            col = col+1;
            move = 'r';
            face = 'blt';
        end
        
    elseif move == 'u' % prev move UP
        
        if padMatix(row,col-1) ~= 0 % move LEFT
            col = col-1;
            move = 'l';
            face = 'b';
        elseif padMatix(row-1,col) ~= 0 % move UP
            row = row-1;
            move = 'u';
            face = 'l';
        elseif padMatix(row,col+1) ~= 0 % move RIGHT
            col = col+1;
            move = 'r';
            face = 'lt';
        elseif padMatix(row+1,col) ~= 0 % move DOWN
            row = row+1;
            move = 'd';
            face = 'ltr';
        end
        
    elseif move == 'r' % prev move RIGHT
        
        if padMatix(row-1,col) ~= 0 % move UP
            row = row-1;
            move = 'u';
            face = 'l';
        elseif padMatix(row,col+1) ~= 0 % move RIGHT
            col = col+1;
            move = 'r';
            face = 't';
        elseif padMatix(row+1,col) ~= 0 % move DOWN
            row = row+1;
            move = 'd';
            face = 'tr';
        elseif padMatix(row,col-1) ~= 0 % move LEFT
            col = col-1;
            move = 'l';
            face = 'trb';
        end
    end
    
    if not(ismember([row-1 col-1],index,'rows'))
    Face{a,1} = face;    
        a = a+1;    
        index(a,:) = [row-1 col-1];        
    end
    
end



function [move,row,col] = checkMove(prevMove,padMat,curRow,curCol)

row = curRow;
col = curCol;

if prevMove == 2 % prev move DOWN
    
    if padMat(row,col+1) ~= 0 % move RIGHT        
        col = col+1;
        move = 1;
    elseif padMat(row+1,col) ~= 0 % move DOWN
        row = row+1;        
        move = 2;
    elseif padMat(row,col-1) ~= 0 % move LEFT
        col = col-1;
        move = 3;
    elseif padMat(row-1,col) ~= 0 % move UP
        row = row-1;
        move = 4;
    end

elseif prevMove == 3 % prev move LEFT
    
    if padMat(row+1,col) ~= 0 % move DOWN
        row = row+1;        
        move = 2;
    elseif padMat(row,col-1) ~= 0 % move LEFT
        col = col-1;
        move = 3;
    elseif padMat(row-1,col) ~= 0 % move UP
        row = row-1;
        move = 4;
    elseif padMat(row,col+1) ~= 0 % move RIGHT        
        col = col+1;
        move = 1;
    end   
    
elseif prevMove == 4 % prev move UP
    
    if padMat(row,col-1) ~= 0 % move LEFT
        col = col-1;
        move = 3;
    elseif padMat(row-1,col) ~= 0 % move UP
        row = row-1;
        move = 4;
    elseif padMat(row,col+1) ~= 0 % move RIGHT        
        col = col+1;
        move = 1;
    elseif padMat(row+1,col) ~= 0 % move DOWN
        row = row+1;        
        move = 2;
    end 
    
elseif prevMove == 1 % prev move RIGHT
    
    if padMat(row-1,col) ~= 0 % move UP
        row = row-1;
        move = 4;
    elseif padMat(row,col+1) ~= 0 % move RIGHT        
        col = col+1;
        move = 1;
    elseif padMat(row+1,col) ~= 0 % move DOWN
        row = row+1;        
        move = 2;
    elseif padMat(row,col-1) ~= 0 % move LEFT
        col = col-1;
        move = 3;
    end         

end
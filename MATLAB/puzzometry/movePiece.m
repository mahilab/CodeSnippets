function p = movePiece(p,newPosition)
p.position = newPosition;
p.matrix2 = zeros(16);
if p.position ~= [0 0]
    p.matrix2(p.position(1):p.position(1)+p.size1(1)-1,p.position(2):p.position(2)+p.size1(2)-1) = p.matrix1;
end
end
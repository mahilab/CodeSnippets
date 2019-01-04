function p = permutePiece(p,permutation)

if permutation == 1
    p.matrix1 = p.matrix;
    p.size1 = p.size;
    p.perm1 = 1;
elseif permutation == 2
    p.matrix1 = rot90(p.matrix);
    p.size1 = fliplr(p.size);
    p.perm1 = 2;
elseif permutation == 3
    p.matrix1 = rot90(p.matrix,2);
    p.size1 = p.size;
    p.perm1 = 3;
elseif permutation == 4
    p.matrix1 = rot90(p.matrix,3);
    p.size1 = fliplr(p.size);
    p.perm1 = 4;
elseif permutation == 5
    p.matrix1 = fliplr(p.matrix);
    p.size1 = p.size;
    p.perm1 = 5;
elseif permutation == 6
    p.matrix1 = rot90(fliplr(p.matrix));
    p.size1 = fliplr(p.size);
    p.perm1 = 6;
elseif permutation == 7
    p.matrix1 = rot90(fliplr(p.matrix),2);
    p.size1 = p.size;
    p.perm1 = 7;
elseif permutation == 8
    p.matrix1 = rot90(fliplr(p.matrix),3);
    p.size1 = fliplr(p.size);
    p.perm1 = 8;
end

p.matrix2 = zeros(16);
if p.position(1) ~= 0 % [0 0]
p.matrix2(p.position(1):p.position(1)+p.size1(1)-1,...
    p.position(2):p.position(2)+p.size1(2)-1) = p.matrix1;
end
end

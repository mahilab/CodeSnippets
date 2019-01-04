function B = updateBoard(P,B)
B.matrix1 = B.matrix;
for ii = 1:14
    if P(ii).position(1) ~= 0 % [0 0]
    B.matrix1 = B.matrix1 + P(ii).matrix2;
    end
end
end

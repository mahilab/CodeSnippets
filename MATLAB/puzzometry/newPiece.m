function P = newPiece(matrix,RGB)

P.matrix = matrix;
P.matrix1 = matrix;
P.position = [0 0];
P.size = [size(P.matrix,1) size(P.matrix,2)];
P.size1 = P.size;
P.matrix2 = zeros(16);
if P.position(1) ~= 0 % [0 0]
P.matrix2(P.position(1):P.position(1)+P.size1(1)-1,...
    P.position(2):P.position(2)+P.size1(2)-1) = P.matrix1;
end

% Find Permutations
perms(1) = 1;
for ii = 2:8
    save = 1;
    P1 = permutePiece(P,ii);
    perm1 = P1.matrix1;
    size1 = P1.size1;
    for jj = 1:length(perms)
        P2 = permutePiece(P,perms(jj));
        perm2 = P2.matrix1;
        size2 = P2.size1;
        if size1 == size2            
            if perm1 == perm2
                save = 0;
                break
            end            
        end
    end
    if save == 1
        perms(length(perms)+1) = ii;
    end
end
P.perms = perms;

P.perm = 1;
P.perm1 = P.perm;

% Determine Fit Type of Each Permutation
for ii = P.perms
    P3 = permutePiece(P,ii);
    for jj = 1:length(P3.matrix1(1,:))        
        if P3.matrix1(1,jj) ~= 0
            if mod(jj,2) == 1 && P3.matrix1(1,jj) == 4
                fit(ii) = 1;
            elseif mod(jj,2) == 1 && P3.matrix1(1,jj) == 8
                fit(ii) = 2;
            elseif mod(jj,2) == 0 && P3.matrix1(1,jj) == 4
                fit(ii) = 2;
            elseif mod(jj,2) == 0 && P3.matrix1(1,jj) == 8
                fit(ii) = 1;
            end
            break
        end
    end
end
P.fit = fit;

P.color = RGB/255;

end

function [B,P,solved] = solver(B,P,queue,piece,animation)

solved = 0;

for ii = queue
    for jj = P(ii).perms
        B = updateBoard(P,B);
        P(ii) = permutePiece(P(ii),jj);
        [valid,position] = checkPiece(P(ii),B,animation);
        if valid
            P(ii) = movePiece(P(ii),position);
            if animation == 1 || animation == 2
                P(ii).h = drawPiece(P(ii));
                pause(eps); 
            end
            if piece == length(P) % if this is the final piece, the puzzle must be solved
                solved = 1;
                B = updateBoard(P,B);
                break                
            else % move on to the next piece      
                newQueue = queue; 
                newQueue(queue==ii)=[]; 
                [B,P,solved] = solver(B,P,newQueue,piece+1,animation); 
            end
            if solved
                break
            else            
                P(ii) = resetPiece(P(ii),animation); 
            end
        end              
    end    
    if solved
        break
    end    
end

end
            
                    
                      

function p = resetPiece(p,animation)

if animation == 1 || animation == 2 
    delete(p.h)    
end

p = movePiece(p,[0 0]);

end
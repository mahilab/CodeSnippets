% Puzzometry
% Evan Pezent
% 12/30/2015

clear all; close all; clc

%% Set Animation Option
animation = 1; % 0 = none, 1 = fast, 2 = detailed (slow)

%% Initialize Puzzle Board
B = initBoard;
        
%% Define Puzzle Pieces        
P = initPieces;

%% Solve
queue = randperm(14); % order to try pieces (fastest is [5 4 10 3 8 14 2 9 13 7 1 6 12 11])
tic
[B,P,solved] = solver(B,P,queue,1,animation);
t = toc;
disp(['Solved in ',num2str(t,3),' seconds! (',num2str(t/60,3),' minutes)'])

%% Draw Solution (if animation turned off)
if animation == 0    
    for ii = 1:14
        drawPiece(P(ii));
    end
end


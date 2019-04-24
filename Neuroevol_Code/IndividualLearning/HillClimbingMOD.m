function [solPostGlob] = HillClimbingMOD(solPostGlob,memParams,trainData)

%costSize = size(solPostGlob,1); %n of rows in Matrix
numPat = memParams.numPat; %train data index
weightIn = numPat+2; %weight index

for k = 1:3
    for i = 1:10
        currentSol = solPostGlob(i, weightIn:end);       
        for j = 1:10
            c = randi([1 119]); %choose random weights col between 1-119
            currentSol(c) = rand(); %randomize weights
            
            
            [newSol data fs errPattern] = feval(memParams.costFuncName, currentSol, trainData); %evaluate solution
            
            if(newSol < solPostGlob(i,1))
                solPostGlob(i,weightIn:end) = currentSol;
                solPostGlob(i,1) = newSol;
                solPostGlob(i, 2:numPat+1) = errPattern;
            else
                currentSol(c) = rand(); %randomize weights
                [newSol data fs errPattern] = feval(memParams.costFuncName, currentSol, trainData); %evaluate solution
                
                if(newSol < solPostGlob(i,1))
                    solPostGlob(i,weightIn:end) = currentSol;
                    solPostGlob(i,1) = newSol;
                    solPostGlob(i, 2:numPat+1) = errPattern;
                end
            end
        end
    end
end
end



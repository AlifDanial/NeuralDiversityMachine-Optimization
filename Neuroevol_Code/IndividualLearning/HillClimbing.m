function [solPostGlob] = HillClimbing(solPostGlob,memParams,trainData)

%costSize = size(solPostGlob,1); %n of rows in Matrix
numPat = memParams.numPat; %train data index
weightIn = numPat+2; %weight index

for i = 1:5
    currentSol = solPostGlob(i, weightIn:end);
    c = randi([1 119]);
    currentSol(c) = rand();
    [newSol data fs errPattern] = feval(memParams.costFuncName, currentSol, trainData);
    if(newSol < solPostGlob(i,1))
        solPostGlob(i,weightIn:end) = currentSol;
        solPostGlob(i,1) = newSol;
        solPostGlob(i, 2:numPat+1) = errPattern;
    end
end
end




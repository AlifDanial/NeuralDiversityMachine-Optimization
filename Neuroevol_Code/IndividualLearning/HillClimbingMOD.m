function [solPostGlob] = HillClimbingMOD(solPostGlob,memParams,trainData)

costSize = size(solPostGlob,1); %n of rows in Matrix
numPat = memParams.numPat; %train data index
weightIn = numPat+2; %weight index
x = 0;


    for i = 1:5
        currentSol = solPostGlob(i, weightIn:end);    
        for j = 1:5 
            c = randi([1 119]); %choose random weights between 1-119
            currentSol(c) = rand(); %randomize weights                   

         %evaluate solution
         [newSol data fs errPattern] = feval(memParams.costFuncName, currentSol, trainData);    

            if(newSol < solPostGlob(i,1))
                solPostGlob(i,weightIn:end) = currentSol;
                solPostGlob(i,costSize) = newSol;
                solPostGlob(i, 2:numPat+1) = errPattern;      
            else 
                x = x+1;
                currentSol(c) = rand(); %randomize weights
                [newSol1 data fs errPattern] = feval(memParams.costFuncName, currentSol, trainData); 
                
                if(x == 4)
                     if(newSol1 < solPostGlob(i,1))
                        solPostGlob(i,weightIn:end) = currentSol;
                        solPostGlob(i,costSize) = newSol;
                        solPostGlob(i, 2:numPat+1) = errPattern;
                        x = 0;
                     else
                        x = 0;
                        break;
                      end
               end
            end                
         end
      end        
end



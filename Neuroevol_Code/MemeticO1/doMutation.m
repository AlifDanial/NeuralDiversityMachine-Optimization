function mSols = doMutation(sols,memParams)

mSols = [];
numPat = memParams.numPat;

% Scan through solutions
for si=1:memParams.numMSol
    anMSol = mutateSol(sols(:,2+numPat:end),memParams);
    errPat = zeros(1,numPat);
    mSols = [mSols; -1 errPat anMSol];
end

end


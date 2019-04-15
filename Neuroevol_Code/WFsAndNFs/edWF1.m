% ------ Weight functions
% 1 - inner product -> 'ipWF1'
% 2 - Euclidean distance -> 'edWF1'
% 3 - Higher-order (HO) product 1 -> 'hoWF1'
% 4 - Higher-order (HO) product 2 (standard) -> 'hoWF2'
% 5 - Standard deviation -> 'sdWF1'
% 6 - MIN -> 'minWF1'
% 7 - MAX -> 'maxWF1'
% ------ Node functions
% 1 - identity -> 'idNF'
% 2 - sigmoid -> 'sigNF1'
% 3 - Gaussian -> gausNF1'
function val = edWF1(inVals,weights,bias)

% Compute
val = sqrt(sum((inVals-weights).^2));

end




% Function for streamlining a KPH2 network (i.e. eliminating nodes that
% do not significantly influence the target function)
function net = streamlineKPH2(net,data,thresh)

% Parameters
if nargin < 3
    thresh = 0.1;
end

% Extract basic information
numNodes = size(net.nodes,2);
numCon = size(net.con,2);
% Streamline nodes
% Scan nodes
for ni=1:numNodes
    % If the node is unused skip
    if net.nodes{ni}.status == 0
        continue
    end
    % Temporarily eliminate node
    elimNet = net;
    elimNet.nodes{ni}.status = 0;
    % Compute error before and after elimination
    error1 = compGlobErr(net,data);
    error2 = compGlobErr(elimNet,data);
    % If error difference is <= thresh then eliminate
    if abs(error1-error2) <= thresh
        net.nodes{ni}.status = 0;
    end
end

end


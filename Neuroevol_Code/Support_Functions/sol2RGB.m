function sol = sol2RGB(sol)

maxCost = max(sol(:,1));
maxParam = max(max(sol(:,2:end)));

sol(:,1) = uint8(round((sol(:,1)/maxCost)*255));
sol(:,2:end) = uint8(round((sol(:,2:end)/maxParam)*255));


end


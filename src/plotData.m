function plotData(X, y, plot_title, plot_color = 'r')
% Simple plot of the loaded trainingset.

plot3(X(:,1), X(:,2), y, 'rx', 'MarkerSize', 5, 'color', plot_color);

% ====
% Tried to make a meshgrid out of the data, but isn't representing the data properly.
% Will need to see what I did wrong here later.

%dim_z = y .* ones(rows(y),rows(y));

%length(X(:,1))
%length(X(:,2))
%size(dim_z)
%mesh(X(:,1), X(:,2), dim_z);
% ====

xlabel('Requests/sec');
ylabel('Traffic Size');
zlabel('Capacity Index');
title(plot_title);

end

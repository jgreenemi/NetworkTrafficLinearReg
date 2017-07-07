  function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
  % Conduct gradient descent. Basic, I know, but implementing stochastic gradient
  % is non-trivial. This should be perfectly acceptable for this particular algorithm.
  %
  % Note that the use of 'newtheta' below is required because for gradient descent
  % to work correctly, the update rules must use the original theta values even though
  % you're updating those values - so we update them into newtheta as a temp matrix, 
  % and commit them to theta when we've finished the last update rule for that iteration.

  m = length(y); 
  J_history = zeros(num_iters, 1);

  for iter = 1:num_iters

      for theta_i = 1:length(theta),
        hx = hypothesis(X, theta);
        term1 = theta(theta_i);
        term2 = alpha * (sum((hx - y) .* X(:, theta_i)) / m);
        
        newtheta(theta_i, 1) = term1 - term2;
      end;

      theta = newtheta;
      
      % ============================================================

      % Save the cost J in every iteration    
      J_history(iter) = computeCostMulti(X, y, theta);

  end

end

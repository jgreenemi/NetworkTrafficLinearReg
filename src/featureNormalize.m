function [X_norm, mu, sigma] = featureNormalize(X)
  % If the values of X are large, our gradient descent calculations
  % will be inefficient, with no benefit being gained. Normalize down
  % the values to be much smaller (-1 <= 0 <= 1 is about the goal) and
  % pass 'em back with the mean and stddev values as well.
  %
  % Note: When applying the algorithm to the live data set, MAKE SURE
  % you continue to use the mu and sigma values provided above, as 
  % calculating the mean of a potentially infinite dataset won't produce
  % a usable result.
  %
  % Also note that using stddev as the denominator in the below equation 
  % is one way of going about this - you can use (max - min), for example.
  % It's just to get a uniform size reduction applied to all the values.

  % First, we determine the mean, and subtract from each feature:
  mu = mean(X);
  sigma = std(X);

  X_norm = (X - mu) ./ sigma;

end

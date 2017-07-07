function J = computeCostMulti(X, y, theta)
  % Function to compute the cost value J(theta) where multiple variables
  % are in use. TL;DR: determine how well this linear regression with
  % the non-scalar value of theta fits our training set. Closer to 0, the better.

  % Initialize the number of training examples
  m = length(y);

  hx = hypothesis(X, theta);

  J = (1 / (2 * m)) * sum((hx - y) .^ 2);
end

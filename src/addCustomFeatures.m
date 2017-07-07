function X = addCustomFeatures(X)
  % Here is where we construct additional features for our hypothesis. Good for reuse when running predictions.

  % This creates a second-degree polynomial. J(theta) ~= 2.638e+06
  %X = [X, X(:,1).^2, X(:,2).^2, X(:,1) .* X(:,2) ];

  % Third-degree polynomial. J(theta) ~= 1.842e+06
  %X = [ X, X(:,1).^3, 2 * (X(:,1).^2 .* X(:,2)), 2 * (X(:,1) .* X(:,2).^2), X(:,2).^3 ];

  % d-degree polynomial.
  d = 26;
  m = rows(X);
  n = columns(X);
  new_features = ones(m, 0); % Create a matrix without columns, populate with the below function to generate new features, including the originals.

  for k = 1:d,
    for l = 0:k,
      new_features(:, end + 1) = (X(:,1).^(k-l)) .* (X(:,2).^l);
    end
  end
  printf('Creating %i total features from %i.\n\n', columns(new_features), n);

  X = new_features;

end
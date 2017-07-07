function hx = hypothesis(X, theta)
  % This is our hypothesis function. May be unnecessary as we're conducting
  % additional feature creation under addCustomFeatures, which is where all the customization occurs,
  % but keeping for the ease of making sweeping changes later.

  hx = X * theta;

end
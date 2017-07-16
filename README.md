# NetworkTrafficLinearReg
A practice implementation of a linear regression machine learning algorithm for predicting network traffic capacity utilization.

This will be a linear regression algorithm to predict a resulting capacity index value `y`, given features of `requests_per_second` and `request_response_pair_size`.

Goal: Accurately predict the y value (+/- 5) given just those two figures, based on training set.

---

`/resources/` contains the training set, and `/src/` holds the code. The results it is giving in its current state are inaccurate, so if you have insights into how this can be improved, I'd love to hear your thoughts as an Issue on the repo.

The training set is comprised of two features, and the resulting "capacity index" in the last column of each row.

* `main.m` is run to kick off the algorithm.
* `addCustomFeatures.m` generates new features based on the input features, with which we can get a more complex polynomial, and as a result, higher granularity and a better fit to the training set.
* `computeCostMulti.m` is our squared-error cost function.
* `featureNormalize.m` normalizes our features, since the difference in scale between our input features is significant.
* `gradientDescentMulti.m` runs our gradient descent.
* `hypothesis.m` is our actual hypothesis. This really needn't be broken out but was done in case of being able to try making sweeping changes later on in the work.
* `plotData.m` is used for making visual representations of the data, so I can use the same settings across multiple figures quickly.

This Github repository is related to a project described in this blog post: [Predicting Server Capacity with Linear Regression ML](https://jgreenemi.com/predicting-capacity-with-linear-regression-ml/).

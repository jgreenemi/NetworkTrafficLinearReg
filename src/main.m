%% Determine Capacity Index given network traffic information.
%
% The idea here is to determine a kind of "capacity index" value,
% given some details regarding network traffic being handled
% by a server to estimate necessary capacity for scaling.
%
% Features currently used:
% - TCP request/response transaction size (measured in bytes)
% - transactions per second

%% Initialization and feature normalization.

clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data
data = load('../resources/traffic-training-set-large.txt');
y = data(:, columns(data));
X = data(:, 1:(columns(data) - 1));
X_orig = X;
m = length(y);

% Add in additional features to the dataset for constructing our hypothesis.
X = addCustomFeatures(X);

% Plot the data for review. Note that plotData will do a three-dimensional plot, so only X(:,[1 2]) will be used from X.

figure; 
plotData(X, y, 'With Untouched Dataset');

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

% Add intercept term to X and X_norm.
X = [ones(m, 1) X];
X_orig = [ones(m, 1) X_orig];
%X_norm = [ones(m, 1) X_norm];

%% Now run a simple gradient descent.

fprintf('Running gradient descent ...\n');

% Choose some alpha value
alpha = 0.0012;
num_iters = 8000;

% Init Theta and Run Gradient Descent 
theta = zeros(columns(X), 1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

% ===== Trying to plot our regression against the current data plot.
hx = hypothesis(X, theta);

hold on;

% We use X_orig here because we want to compare the regression against the original
% training set values, not the normalized ones.
plotData(X_orig(:, [2 3]), hx, 'With Regression', 'b');

% ===== End regression plotting.

% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 1);
xlabel('Number of iterations');
ylabel('Cost J');

% Also printing the J_history for review.
printf('The final J value = %e.\n\n', J_history(end));


% ===== Here we can try alternate alpha values.

%hold on;
%fprintf('Running gradient descent ...\n');

% Choose some alpha value
%alpha = 0.3;
%num_iters = 200;

% Init Theta and Run Gradient Descent 
%theta = zeros(training_example_size, 1);
%[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

% Plot the convergence graph
%plot(1:numel(J_history), J_history, '-b', 'LineWidth', 1, 'color', 'r');

% ===== End alternate alpha value trials.

% Display gradient descent's result
%fprintf('Theta computed from gradient descent: \n');
%fprintf(' %f \n', theta);
fprintf('\n');

% ==== Begin Prediction Block ==== 
printf(' ==== Begin Prediction Block ==== \n\n')

% Take our found theta values and try predicting a value based on 
% [tps,size,expected_result].
% Examples:
% [40000, 60, 90]
% [10000, 30, 20]

predict = [
            10000,30;
            40000,60; 
            39000,1200; 
            10000,100000; 
            50000,100000; 
            12000,210000;
            ];
expected_result = [
            20; 
            90;
            130;
            320;
            1600;
            1020;
            ];

% For the predicted values above, add in our additional features.
predict_orig = predict;
predict = addCustomFeatures(predict);

predict_normed = (predict - mu) ./ sigma;

% Add the all-ones column to the front of the matrix of now-normalized features 
% in preparation for applying the theta multipliers.
predict_normed = [ones(rows(predict),1), predict_normed];

capacity_index = predict_normed * theta;

% ================ End: Print the result ================

fprintf('Results:\n')

predict_results = [predict_orig, expected_result, capacity_index];

% Print the results. Don't forget to transpose the above matrix for printing reasons.
printf(' ========================================== \n')
printf('TPS: %.1f, Size: %.1f, Expected: %i, Capacity Index: %i\n', predict_results');
printf(' ========================================== \n')

% Train the classifer. Return theta

function [optTheta] = trainClassifier(lambda)

  data =csvread('mycsvtrain.csv');
  X= data(:,[1:1000]);
  y= data( : ,1001);
  [m, n] = size(X);
  % Add intercept term to x and X_test
  X = [ones(m, 1) X];
  % Initialize fitting parameters
  initialTheta = zeros(n + 1, 1);
  
  % disp (size(initialTheta))

  options=optimset('GradObj','on','MaxIter',100);
  %[optTheta,functionVal] = fminunc(@(t)(costfunction_train(t,X,y)),initialTheta,options);
  [optTheta, J, Exit_flag ] = fminunc(@(t)(regularizedCostFunction(t, X, y, lambda)), initialTheta, options);
  % h = sigmoid ( X * theta)
end

% Train the classifer. Return theta

function [optTheta, J] = trainClassifier(X,y,lambda)
  [m,n]=size(X);
  % Initialize fitting parameters
  initialTheta = zeros(n, 1);
  % disp (size(initialTheta))
  options=optimset('GradObj','on','MaxIter',100);
  %[optTheta,functionVal] = fminunc(@(t)(costfunction_train(t,X,y)),initialTheta,options);
  [optTheta, J, Exit_flag ] = fminunc(@(t)(regularizedCostFunction(t, X, y, lambda)), initialTheta, options);
  % h = sigmoid ( X * theta)
end

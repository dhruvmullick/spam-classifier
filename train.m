
function [optTheta,J] = train(X,y)
  %[m, n] = size(X);
  % Initialize fitting parameters
  initialTheta = zeros(size(X,2),1);

  options=optimset('GradObj','on','MaxIter',100);
  [optTheta,J,exit_flag] = fminunc(@(t)(costprediciton_train(t,X,y)),initialTheta,options);
end
function [J,predacc , X ,y,m] = crossValidateClassifier(theta,lambda)

  data =csvread('mycsvcv.csv');
  X= data(:,[1:1000]);
  y= data( : ,1001);
  [m, n] = size(X);
  X = [ones(m, 1) X];
  [J,predY,grad]=costfunction_test(theta,X,y,lambda);
  predacc=0;
  for i = 1:m
    if y(i)==predY(i)
      predacc=predacc+1;
    end
  end
  predacc=predacc/m;

end

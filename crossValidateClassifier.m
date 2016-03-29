function [J,predacc] = crossValidateClassifier(theta)

  data =csvread('mycsvcv.csv');
  X= data(:,[1:1000]);
  y= data( : ,1001);
  [m, n] = size(X);
  X = [ones(m, 1) X];
  [J,predY]=costfunction_test(theta,X,y);
  predacc=0;
  for i = 1:m
    if y(i)==predY(i)
      predacc=predacc+1;
    end
  end
  predacc=predacc/m;

end

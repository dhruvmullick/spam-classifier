function [J,predacc] = cv_testPrediction(X,y,theta,lambda)

  [J,predY,grad]=costfunction_test(theta,X,y,lambda);
  predacc=0;
  m=size(y,1);
  for i = 1:m
    if y(i)==predY(i)
      predacc=predacc+1;
    end
  end
  predacc=predacc/m;

end

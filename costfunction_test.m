function [J,predY] = costfunction_test(theta , X, y,lambda)

  m= length(y);
  h=sigmoid(X*theta);
  temp1 = y .* log(h);
  temp2 = (1-y) .* log(1- h);
  thetaT = theta;
  thetaT(1) = 0;
  correction = sum(thetaT .^ 2) * (lambda / (2 * m));

  J = -sum (temp1 + temp2)/m + correction;
  predY=zeros(m,1);
  for i=1:m
    if h(i)>=0.5
      predY(i)=1;
    end
end

function [J,grad] = costfunction_test2(theta , X, y)

  m= length(y);
  h=sigmoid(X*theta);
  temp1 = y .* log(h);
  temp2 = (1-y) .* log(1- h);
  J = -sum (temp1 + temp2)/m ;
  grad = (X' * (h - y)) * (1/m) ;

end

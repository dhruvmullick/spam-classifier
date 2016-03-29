function [J,gradient] = costfunction(theta , X, y)

  m= length(y);
  h=sigmoid(X*theta);
  temp1 = y .* log(h);
  temp2 = (1-y) .* log(1- h);
  J = -sum (temp1 + temp2)/m;

  [m n] = size(X);
  gradient = zeros(n,1);
  t=h-y;
  gradient=X'*t;

end

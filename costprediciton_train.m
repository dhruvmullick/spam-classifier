function [J,grad] = costprediciton_train(theta , X, y)
  [m,n]=size(X);
  % disp(size(X));
  h=sigmoid(X * theta);
  temp1 = y .* log(h);
  temp2 = (1-y) .* log(1- h);
  J = -sum (temp1 + temp2)/m;
  t=h-y;
  grad=(X'*t)*(1/m);

end

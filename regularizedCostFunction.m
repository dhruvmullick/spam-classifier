%regularized cost 
function [J, grad] = regularizedCostFunction(theta, X, y,lambda)
[m,n]=size(X);
h=sigmoid( X * theta);
temp1 = -1 * (y .* log(h));
temp2 = (1 - y) .* log(1 - h);

thetaT = theta;
thetaT(1) = 0;
correction = sum(thetaT .^ 2) * (lambda / (2 * m));

J = sum(temp1 - temp2) / m + correction;

grad = (X' * (h - y)) * (1/m) + thetaT * (lambda / m);

end

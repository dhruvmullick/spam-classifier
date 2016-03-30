%regularized cost 
function [J, grad] = regularizedCostFunction(theta, X, y,lambda)
m = length(y);
temp1 = -1 * (y .* log(sigmoid(X * theta)));
temp2 = (1 - y) .* log(1 - sigmoid(X * theta));

thetaT = theta;
thetaT(1) = 0;
correction = sum(thetaT .^ 2) * (lambda / (2 * m));

J = sum(temp1 - temp2) / m + correction;

grad = (X' * (sigmoid(X * theta) - y)) * (1/m) + thetaT * (lambda / m);



% =============================================================

end

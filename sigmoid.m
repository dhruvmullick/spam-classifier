function g = sigmoid(z)
g= zeros(size(z));
den=1 + exp(-1*z);
g = 1 ./ den;

end
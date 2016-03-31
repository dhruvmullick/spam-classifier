function [error_train , error_cv , m] = learningCurves(X ,y ,Xcv,ycv,lambda)
[m, n] = size(X);
error_train = zeros(m, 1);
error_val   = zeros(m, 1);
%X = [ones(m, 1) X];
for i=1:m
[theta] = train(X(1:i, :), y(1:i),lambda);
[error_train(i), grad] = regularizedCostFunction(theta , X(1:i, :), y(1:i),lambda);
[error_val(i), grad] = costfunction_test(theta , Xcv(1:i,:),ycv(1:i) , lambda);
end

end


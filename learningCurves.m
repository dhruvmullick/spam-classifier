function [error_train , error_cv , m] = learningCurves(X ,y ,Xcv,ycv)
[m, n] = size(X);
%error_train = zeros(m, 1);
%error_cv   = zeros(m, 1);
error_train = zeros(2, 1);
verror_cv   = zeros(2, 1);

for i=1:2
[theta] = train(X(1:i,:),y(1:i));
[error_train(i), grad] = costfunction_train(theta , X(1:i,:), y(1:i));
[error_cv(i), grad] = costfunction_test2(theta , Xcv,ycv);
end

end


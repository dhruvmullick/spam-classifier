function [error_train , error_cv] = learningCurves(X ,y , Xcv,ycv,lambda)
[m, n] = size(X);
error_train = zeros(m, 1);
error_val   = zeros(m, 1);

val_size = size(Xcv,1);

X = [ones(m, 1) X];
for i=1:m
[theta] = trainClassifier(lambda);
[error_train(i), grad] = regularizedCostFunction(theta , X ,y,lambda);
[error_val(i), grad] = costfunction_test(theta ,Xcv ,ycv , lambda);
end
plot(1:m, error_train, 1:m, error_val);
title('Learning curve for linear regression')
legend('Train', 'Cross Validation')
xlabel('Number of training examples')
ylabel('Error')
axis([0 13 0 150])
end


lambda=1;
[theta ,X,y] = trainClassifier(lambda);
%disp(theta);
[Jcv,predacc ,Xcv ,ycv,m2] = crossValidateClassifier(theta,lambda);
predacc = predacc*100
%[precision , recall,F1Score]= precisionandrecall(theta , Xcv ,ycv,lambda)
[error_train , error_cv , m]=learningCurves(X,y,Xcv,y,lambda);
plot(1:m, error_train, 1:m, error_val);
title('Learning curve for linear regression')
legend('Train', 'Cross Validation')
xlabel('Number of training examples')
ylabel('Error')
axis([0 13 0 150])



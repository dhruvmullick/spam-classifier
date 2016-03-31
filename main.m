lambda=1;

[theta,X,y,] = trainClassifier(lambda);
[Jcv,predacc ,Xcv ,ycv,m2] = crossValidateClassifier(theta,lambda);
predacc = predacc*100
%[precision , recall,F1Score]= precisionandrecall(theta , Xcv ,ycv,lambda)
[error_train , error_cv , m]=learningCurves(X,y,Xcv,ycv);
plot(1:2, error_train, 1:2, error_cv);
%plot(1:m, error_train, 1:m, error_cv);
title('Learning curve for logistic regression')
legend('Train', 'Cross Validation')
xlabel('Number of training examples')
ylabel('Error')
axis([0 13 0 150])



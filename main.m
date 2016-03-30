lambda=1;
theta = trainClassifier(lambda);
%disp(theta);
[Jcv,predacc ,X ,y] = crossValidateClassifier(theta,lambda);
predacc = predacc*100
[precision , recall,F1Score]= precisionandrecall(theta , X ,y,lambda)



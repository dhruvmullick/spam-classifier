theta = trainClassifier();
disp(theta);
[Jcv,predacc ,X ,y] = crossValidateClassifier(theta);
predacc = predacc*100
[precision , recall,F1Score]= precisionandrecall(theta , X ,y)


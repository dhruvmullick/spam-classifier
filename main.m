theta = trainClassifier();
disp(theta);
[Jcv,predacc] = crossValidateClassifier(theta);
predacc = predacc*100
[Jcv,precision , recall,F1Score]= precisionandrecall(theta)

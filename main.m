theta = trainClassifier();
disp(theta);
[Jcv,predacc] = crossValidateClassifier(theta);
predacc = pred*100

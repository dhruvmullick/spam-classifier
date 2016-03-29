theta = trainClassifier();
disp(theta);
[Jcv,predacc] = crossValidateClassifier(theta);
predacc = predacc*100

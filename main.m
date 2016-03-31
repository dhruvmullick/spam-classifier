lambda=1;
[theta ,X,y] = trainClassifier(lambda);
%disp(theta);
[Jcv,predacc ,Xcv ,ycv,m2] = crossValidateClassifier(theta,lambda);
predacc = predacc*100

%[precision , recall,F1Score]= precisionandrecall(theta , Xcv ,ycv,lambda)
learningCurves(X,y,Xcv,y,lambda);


lambda=1;
%read the training set
data =csvread('mycsvtrain.csv');
X= data(:,[1:1000]);
y= data( : ,1001);
[m,n]=size(X);
X = [ones(m, 1) X];

%read the cv set
 %data =csvread('mycsvcv.csv');
  %Xcv= data(:,[1:1000]);
 %ycv= data( : ,1001);
 %[m1, n1] = size(Xcv);
 %Xcv = [ones(m1, 1) Xcv];

%read the test set

data =csvread('mycsvtest.csv');
Xt= data(:,[1:1000]);
yt= data( : ,1001);
[m1, n1] = size(Xt);
Xt = [ones(m1, 1) Xt];



%predict value of theta and find the cost of CV/test
[theta] = trainClassifier(X,y,lambda);
% [Jcv,predacc] = cv_testPrediction(Xcv,ycv,theta,lambda);
[Jt,predacc] = cv_testPrediction(Xt,yt,theta,lambda);

predacc = predacc*100
[precision , recall,F1Score]= precisionandrecall(theta , Xt ,yt,lambda)
%[error_train,error_cv ,m]=learningCurves(X,y,Xcv,ycv,lambda);
 %plot(1:9, error_train, 1:9, error_cv);
% %plot(1:m, error_train, 1:m, error_cv);
 %title('Learning curve for logistic regression')
 %legend('Train', 'Cross Validation')
 %xlabel('Number of training examples')
 %ylabel('Error')

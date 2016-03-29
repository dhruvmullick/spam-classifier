clear all;
close all;
clc
data =csvread('mycsvtrain.csv');
X= data(:,[1,999]);
y= data( : ,1000);
%plot(X,y);
[m, n] = size(X);
% Add intercept term to x and X_test
X = [ones(m, 1) X];
% Initialize fitting parameters
theta = zeros(n + 1, 1);

h = sigmoid (theta * X)



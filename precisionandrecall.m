% calculate precision and recall
function [precision , recall , F1Score] = precisionandrecall(theta,X ,y,lambda)

 % data =csvread('mycsvcv.csv');
  %X= data(:,[1:1000]);
  %y= data( : ,1001);
  [m, n] = size(X);
  %X = [ones(m, 1) X];
  [J,predY]=costfunction_test(theta,X,y,lambda);
  tp=0   %true positive
  tn=0   %true negative
  fp=0   %false positive
  fn=0   %false negative
  for i = 1:m
    if y(i)==predY(i)
        if y(i)==1
            tp=tp+1;
        else
            tn=tn+1;
        end
    else 
        if y(i)==1
            fn=fn+1;
        else 
            fp=fp+1;
        end
    end
  end
  precision = tp / (tp +fp);
  recall = tp / (tp +fn);
  F1Score = (2 * precision * recall) / (precision+recall);

end

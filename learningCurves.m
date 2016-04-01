function [error_train , error_cv , m] = learningCurves(X ,y ,Xcv,ycv,lambda)

  disp 'Now plotting learning curves.. '
  [m, n] = size(X);
  error_train = zeros(9, 1);
  error_cv   = zeros(9, 1);

  for j=1:9
    disp(j)
    [theta,J] = trainClassifier(X(1:(j*100),:),y(1:(j*100)),lambda);
    [error_train(j), grad] = costprediciton_train(theta , X(1:(j*100),:), y(1:(j*100)));
    [error_cv(j), grad] = costfunction_test2(theta , Xcv(1:(j*100),:),ycv(1:(j*100)));
  end

end

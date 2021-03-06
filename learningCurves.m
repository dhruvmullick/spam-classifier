function [error_train , error_cv , m] = learningCurves(X ,y ,Xcv,ycv,lambda)

  disp 'Now plotting learning curves.. '
  [m, n] = size(X);
  error_train = zeros(9, 1);
  error_cv   = zeros(9, 1);

  for j=1:9
    disp(j)
    [theta,J] = trainClassifier(X(1:(j*400),:),y(1:(j*400)),lambda);
    [error_train(j), grad] = costprediciton_train(theta , X(1:(j*400),:), y(1:(j*400)));
    [error_cv(j), grad] = costfunction_test2(theta ,Xcv,ycv);

    % error_train(j)=abs(log(abs(error_train(j))));
    % error_cv(j)=abs(log(abs(error_cv(j))));
  end

end

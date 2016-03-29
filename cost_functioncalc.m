function j = costfunction(theta , X, y)
m= length(y)

temp1 = -1 * (y .* log (sigmoid ( theta * X)))
temp2 = (1-y) * (log(1- sigmoid(theta * X)))

j = sum (temp1 - temp2)/m;

end
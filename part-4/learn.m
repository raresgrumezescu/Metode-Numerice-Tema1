function [w] = learn(X, y, lr, epochs)
  [n m] = size(X);
  w = randi([-0.1 0.1],1,n);
  v = (1:n);
  for i=1:n-1
    X(:,i)=(X(:,i)-mean(X(:,i)))/std(X(:,i));
  endfor
  for i=1:epochs
    v = v(randperm(length(v)));
    [X y] = random_lines(v,X,y);
    S = 0;
    for j=1:n
      S+=((X(j,:)*w)-y(j))*X(j,i);
    endfor
    w(i) = w(i)-double(lr*S)/n;
endfunction

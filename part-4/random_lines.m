function [Xm ym] = random_lines (vect,X,y)
  [n m] = size(X);
  for i=1:n
    for j=1:m
      Xm(i,j) = X(v(i),j);
    endfor
    ym(i) = y(v(i));
  endfor
endfunction

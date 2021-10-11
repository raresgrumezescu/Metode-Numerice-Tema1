function [k] = euclid (points, poz, centroids)
  [n m] = size(centroids);
  S = 0;
  nr = 0;
  for j = 1:m
     S+=(points(poz,j)-centroids(1,j))*(points(poz,j)-centroids(1,j));
  endfor
  S = sqrt(S);
  nr = S;
  k = 1;
  S = 0; 
  for i = 1:n
    for j = 1:m
      S+=(points(poz,j)-centroids(i,j))*(points(poz,j)-centroids(i,j));
    endfor
    S = sqrt(S);
    if S < nr
      nr = S;
      k = i;
    endif
    S = 0;
  endfor
endfunction

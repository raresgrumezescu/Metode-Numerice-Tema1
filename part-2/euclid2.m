function [nr] = euclid2 (points, poz, centroids)
  [n m] = size(centroids);
  S = 0;
  nr = 0;
  S = 9999;
  nr = S;
  S = 0; 
  for i = 1:n
    for j = 1:m
      S+=(points(poz,j)-centroids(i,j))*(points(poz,j)-centroids(i,j));
    endfor
    S = sqrt(S);
    if S < nr
      nr = S;
    endif
    S = 0;
  endfor
endfunction

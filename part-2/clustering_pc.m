function [centroids] = clustering_pc(points, NC)
  [n m] = size(points);
  centroids = zeros(NC,m);
  centroids0 = zeros(NC,m);
  lungime = zeros(NC,1); 
  for j = 1:m
    for i = 1:n
      k = mod(i,NC);
      if k ~= 0
        centroids(k,j)+=points(i,j);
      endif
      if k == 0
        centroids(NC,j)+=points(i,j);
      endif
    endfor
  endfor
  S = 0;
  for i = 1:n
      k = mod(i,NC);
      if k ~= 0
        lungime(k)++;
      endif
      if k == 0
        lungime(NC)++;
      endif
    endfor
  
  for j = 1:m
    for i = 1:NC
      centroids(i,j) = centroids(i,j)/lungime(i);
    endfor
  endfor
  
  while true
  centroids0 = centroids;
  centroids = zeros(NC,m);
  lungime = zeros(NC,1);
  
  for i= 1:n
     k = euclid(points,i,centroids0);
     for j = 1:m
       centroids(k,j)+=points(i,j);
     endfor
       lungime(k) ++;
  endfor
  for j = 1:m
   for i = 1:NC
       centroids(i,j) = centroids(i,j)/lungime(i);
   endfor
  endfor
  if centroids == centroids0
    break;
  endif
  endwhile
endfunction


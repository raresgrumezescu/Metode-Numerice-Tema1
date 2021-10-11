function [M, b] = generate_probabilities_system(rows)
n = rows  
A = zeros(n,n);
A(n,1) = 1;
for i=2:n
  A(n,i) = A(n,i-1)+i-1;
endfor
for k=n:-1:1
  for i=1:k-1
    A(k-1,i) = A(n,1) + A(k,i+1);
  endfor
endfor
m = ((n+1)*n)/2
M = zeros(m,m);
for i=2:n-1
  M(A(i,1),A(i,1)) = 5;
endfor
for j=2:n-1
  M(A(n,j),A(n,j)) = 5;
endfor
M(A(1,1),A(1,1)) = 4;
M(A(n,n),A(n,n)) = 4;
M(A(n,1),A(n,1)) = 4;
for i = 2:n-1
  for j = 2:n-1
    if A(i,j)~= 0
      if i~=j
        M(A(i,j),A(i,j)) = 6;
      endif
      if i == j
        M(A(i,j),A(i,j)) = 5;
      endif
    endif
  endfor
endfor
M(1,2) = -1;
M(1,3) = -1;
M(A(n,n),A(n,n-1)) = -1;
M(A(n,n),A(n-1,n-1)) = -1;
M(A(1,1),A(2,1)) = -1;
M(A(1,1),A(2,2)) = -1;
for i= 2:n-1
  M(A(i,1),A(i-1,1)) = -1;
  M(A(i,1),A(i+1,1)) = -1;
  M(A(i,1),A(i,2)) = -1;
  M(A(i,1),A(i+1,2)) = -1;
endfor
for j= 2:n-1
  M(A(n,j),A(n,j-1)) = -1;
  M(A(n,j),A(n,j+1)) = -1;
  M(A(n,j),A(n-1,j-1)) = -1;
  M(A(n,j),A(n-1,j)) = -1;
endfor
for i = 2:n-1
  for j = 2:n-1
    if A(i,j) ~= 0 && i ~=j
      M(A(i,j),A(i-1,j)) = -1;
      M(A(i,j),A(i+1,j)) = -1;
      M(A(i,j),A(i,j-1)) = -1;
      M(A(i,j),A(i,j+1)) = -1;
      M(A(i,j),A(i+1,j+1)) = -1;
      M(A(i,j),A(i-1,j-1)) = -1;
    endif
  endfor
endfor
for i=2:n-1
  M(A(i,i),A(i-1,i-1)) = -1;
  M(A(i,i),A(i,i-1)) = -1;
  M(A(i,i),A(i+1,i)) = -1;
  M(A(i,i),A(i+1,i+1)) = -1;
endfor
b = zeros(m,1);
p = ((n-1)*n)/2;
for i=p+1:m
  b(i) = 1;
endfor
endfunction
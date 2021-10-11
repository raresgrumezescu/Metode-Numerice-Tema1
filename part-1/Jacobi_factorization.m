function [G_J, c_J] = Jacobi_factorization(A, b)
  [n m] = size(A);
  M = zeros(n,m);
  for i = 1:n
    for j = 1:m
      if i ~= j
        M(i,j) = A(i,j);
      endif
      if i == j
        M(i,j) = 0;
      endif
    endfor
  endfor
  D = A - M;
  D = inv(D);
  G_J = -D*M;
  c_J = D*b;
endfunction

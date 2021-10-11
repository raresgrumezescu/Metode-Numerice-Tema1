function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  n = length(c);
  x0 = zeros(n,1);
  while true
    x = csr_multiplication(G_values,G_colind,G_rowptr,x0) + c;
    if norm(x-x0,inf) <= tol
      break;
    endif
    x0 = x;
  endwhile
endfunction
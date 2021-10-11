function [values, colind, rowptr] = matrix_to_csr(A)
  k = 1;
  nz = 1;
  [n m] = size(A);
  for i = 1:n
    for j = 1:m
      if A(i,j) ~= 0
        values(nz) = A(i,j);
        colind(nz) = j;
        nz++;
      endif
    endfor
  endfor
  ind = 0;
  nr = 1;
  for i = 1:n
    for j = 1:m
      if ind == 0 && A(i,j) ~= 0
        rowptr(k) = nr;
        k++;
        ind = 1;
      endif
      if A(i,j) != 0
        nr++;
      endif
    endfor
    ind = 0;
  endfor
  rowptr(k) = nz;
endfunction
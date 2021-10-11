function [H,S,V] = RGB2HSV(A)
  [n m p] = size(A);
  R = A(:,:,1);
  G = A(:,:,2);
  B = A(:,:,3);
  R = double(R)/255;
  G = double(G)/255;
  B = double(B)/255;
  
  H = zeros(n,m);
  S = zeros(n,m);
  V = zeros(n,m);
  
  Cmax = max(G,B);
  Cmax = max(R,Cmax);
  Cmin = min(G,B);
  Cmin = min(R,Cmin);
  D = Cmax-Cmin;
  for i = 1:n
    for j = 1:m
      if D(i,j) == 0
        H(i,j) == 0;
      endif
      if D(i,j) ~= 0
      if Cmax(i,j) == R(i,j)
        H(i,j) = 60*(mod(double(G(i,j) - B(i,j))/D(i,j),6));
      endif
      if Cmax(i,j) == G(i,j)
        H(i,j) = 60*(((double(B(i,j) - R(i,j))/D(i,j))+2));
      endif
      if Cmax(i,j) == B(i,j)
        H(i,j) = 60*(((double(R(i,j) - G(i,j))/D(i,j))+4));
      endif
    endif
    if Cmax(i,j) ~= 0
      S(i,j) = D(i,j) / Cmax(i,j);
    endif
    if Cmax(i,j) == 0
      S(i,j) = 0;
    endif
    endfor
  endfor
  H(find(~D))=[0];
  H = H/360;
  V = Cmax;
  
endfunction
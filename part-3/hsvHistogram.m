function [sol] = hsvHistogram (path_to_image,count_bins)
 img = imread(path_to_image);
 [n m p] = size(img);
  [H,S,V] = RGB2HSV(img);
  
  range = 0:1.01/count_bins:1.01;
  range(1) = 0;
  
  xh = sum(histc(H, range),2);
  xh = xh';
  xh(length(xh)) = [];
  
  xs = sum(histc(S, range),2);
  xs = xs';
  xs(length(xs)) = [];
  
  xv = sum(histc(V, range),2);
  xv = xv';
  xv(length(xv)) = [];
  
  sol = [xh,xs,xv];
endfunction

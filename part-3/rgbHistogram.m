function [sol] = rgbHistogram (path_to_image, count_bins)
  range = 0:256/count_bins:256;
  img = imread(path_to_image);
  A = img(:,:,1);
  xr = sum(histc(A, range),2);
  xr = xr';
  xr(length(xr)) = [];
  A = img(:,:,2);
  xg = sum(histc(A, range),2);
  xg = xg';
  xg(length(xg)) = [];
  A = img(:,:,3);
  xb = sum(histc(A, range),2);
  xb = xb';
  xb(length(xb)) = [];
  sol = [xr,xg,xb];
endfunction
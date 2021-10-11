function [cost] = compute_cost_pc(points, centroids)
  cost = 0
  [n m] = size(points);
  for i = 1:n
    cost+=euclid2(points,i,centroids);
  endfor
endfunction


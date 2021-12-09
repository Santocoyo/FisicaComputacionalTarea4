
function fr = cos(g)
  g0 = g.f0;
  g1 = g.f1;
  
  fr0 = cos(g0);
  fr1 = -sin(g0) .* g1;
  fr = dual1(fr0,fr1);  
end
% 


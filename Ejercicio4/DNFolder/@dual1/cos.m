%cos dual

function fr = cos(g)
  fr = dual1(cos(g.f0), -sin(g.f0) .* g.f1);
endfunction
%tan dual

function fr = tan(x)
  fr = dual1(tan(x.f0), x.f1 ./ ((cos(x.f0))^2));
endfunction

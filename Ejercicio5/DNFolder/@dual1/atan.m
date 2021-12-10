%atan dual

function fr = atan(x)
  fr = dual1(atan(x.f0), x.f1 ./ (1+(x.f0)^2));
endfunction

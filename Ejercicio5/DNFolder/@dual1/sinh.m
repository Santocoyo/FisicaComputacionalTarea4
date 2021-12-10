%sinh dual

function fr = sinh(x)
  fr = dual1(sinh(x.f0), x.f1.*cosh(x.f0));
endfunction

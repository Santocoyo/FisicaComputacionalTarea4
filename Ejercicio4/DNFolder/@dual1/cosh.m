%cosh dual

function fr = cosh(x)
  fr = dual1(cosh(x.f0), x.f1.*sinh(x.f0));
endfunction

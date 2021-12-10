%erf dual

function fr = erf(x)
  fr = dual1(erf(x.f0), (2/sqrt(pi))*exp(-(x.f0)^2).*x.f1);
endfunction

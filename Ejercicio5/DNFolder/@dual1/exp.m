%exp dual

function fr = exp(x)
  fr = dual1(exp(x.f0), x.f1.*exp(x.f0));
endfunction
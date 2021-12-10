%acosh dual

function fr = acosh(x)
  fr = dual1(acosh(x.f0), x.f1 ./ (sqrt((x.f0)^2-1)));
endfunction
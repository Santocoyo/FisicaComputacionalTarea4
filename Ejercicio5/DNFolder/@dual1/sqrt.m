%sqrt dual

function fr = sqrt(x)
  fr = dual1(sqrt(x.f0), x.f1 ./ (2*sqrt(x.f0)));
endfunction

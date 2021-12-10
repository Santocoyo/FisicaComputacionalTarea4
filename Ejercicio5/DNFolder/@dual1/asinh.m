%asinh dual

function fr = asinh(x)
  fr = dual1(asinh(x.f0), x.f1 ./ (sqrt((x.f0)^2+1)));
endfunction

%atanh dual

function fr = atanh(x)
  fr = dual1(atanh(x.f0), x.f1 ./ (1-(x.f0)^2));
endfunction

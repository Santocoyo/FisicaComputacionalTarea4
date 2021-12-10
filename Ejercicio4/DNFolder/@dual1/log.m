%log dual

function fr = log(x)
  fr = dual1(log(x.f0), x.f1 ./ x.f0);
endfunction

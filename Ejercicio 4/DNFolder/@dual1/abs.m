%abs dual

function fr = abs(x)
  fr = dual1(abs(x.f0), (x.f0./abs(x.f0)).*x.f1);
endfunction

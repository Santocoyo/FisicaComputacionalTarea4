%tanh dual

function fr = tanh(x)
  fr = dual1(tanh(x.f0), x.f1 ./ ((cosh(x.f0))^2));
endfunction

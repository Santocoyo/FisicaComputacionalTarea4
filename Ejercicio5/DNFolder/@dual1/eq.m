%eq dual

function fr = eq(x,y)
  fr = dual1(x.f0 == y.f0, x.f1 == y.f1);
endfunction

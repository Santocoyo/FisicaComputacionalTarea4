%atan2 dual

function fr = atan2(x,y)
  fr = dual1(atan2(x.f0, y.f0), (y.f0.*x.f1 - x.f0.*y.f1) ./ ((x.f0).^2 + (y.f0).^2));
endfunction

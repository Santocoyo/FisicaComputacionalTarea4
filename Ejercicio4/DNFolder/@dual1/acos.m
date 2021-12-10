%acos dual

function fr = acos(x)
  fr = dual1(acos(x.f0), -x.f1 ./ (sqrt(1-(x.f0)^2)));
endfunction

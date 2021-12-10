%asin dual

function fr = asin(x)
  fr = dual1(asin(x.f0), x.f1 ./ (sqrt(1-(x.f0)^2)));
endfunction

%mpower dual

function fr = mpower(x,y)
  fr = dual1(x.f0 .^ y.f0, (x.f0 .^ (y.f0-1)) .* (y.f1.*log(x.f0).*x.f0 + y.f0.*x.f1) );
endfunction
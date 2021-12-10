%sin dual

function fr = sin(g)
    fr = dual1(sin(g.f0), g.f1.*cos(g.f0));
endfunction

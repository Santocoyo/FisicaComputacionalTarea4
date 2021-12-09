1;
clc;
clear all;
clear -all;
clear -a;
close all;
clear functions;

addpath('DNFolder');
pkg load optim;

xd = dual1(1.1,1);

%{
ft = @(x) sin(cos(x)) + cos(x);
deriv(ft, 1.1);

yd = sin(cos(xd)) + cos(xd);
val = yd.f1;
%}

xd+xd
xd-xd
xd*xd
xd/xd
xd^xd
xd==xd
xd!=xd
sin(xd)
cos(xd)
tan(xd)
sinh(xd)
cosh(xd)
tanh(xd)
asin(xd)
acos(xd)
atan(xd)
asinh(xd)
acosh(xd)
atanh(xd)
atan2(xd,xd)
sqrt(xd)
exp(xd)
log(xd)
erf(xd)
abs(xd)

ft = @(x,y,z) sin(x)+cos(y)+tan(z)
%{
function vector = gradient(ft, point)
  dim = size(point)(2)
  for i=1:dim
    
    vector(i) = ft(
  endfor
endfunction
%}








clear all;
clear functions;

addpath('DNFolder')

x0 = 1.1;
mu = ones(size(x0));

xd = dual1(x0, mu);

pkg load optim;
ft = @(x) sin(cos(x)) + cos(x);

val = sin(cos(xd)) + cos(xd);

deriv = deriv(ft,x0(1,1))
dualder = val.f1

vec = cat(1,xd,val)

vec = [xd;val]








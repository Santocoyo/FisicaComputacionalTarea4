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

gt = [4,5,6]

a = cell(3,1);

a(1,1) = ft(dual1(gt(1), 1), dual1(gt(2), 0), dual1(gt(3), 0)).f1;
a(2,1) = ft(dual1(gt(1), 0), dual1(gt(2), 1), dual1(gt(3), 0)).f1;
a(3,1) = ft(dual1(gt(1), 0), dual1(gt(2), 0), dual1(gt(3), 1)).f1;

a

fj1 = @(x,y,z) sin(x)+cos(y)+tan(z)
fj2 = @(x,y,z) sin(y)+cos(z)+tan(x)
fj3 = @(x,y,z) sin(z)+cos(x)+tan(y)

gj1 = [1,2,3]
gj2 = [4,5,6]
gj3 = [7,8,9]

b = cell(3,3)

b(1,1) = fj1(dual1(gj1(1), 1), dual1(gj1(2), 0), dual1(gj1(3), 0)).f1;
b(2,1) = fj1(dual1(gj1(1), 0), dual1(gj1(2), 1), dual1(gj1(3), 0)).f1;
b(3,1) = fj1(dual1(gj1(1), 0), dual1(gj1(2), 0), dual1(gj1(3), 1)).f1;

b(1,2) = fj2(dual1(gj2(1), 1), dual1(gj2(2), 0), dual1(gj2(3), 0)).f1;
b(2,2) = fj2(dual1(gj2(1), 0), dual1(gj2(2), 1), dual1(gj2(3), 0)).f1;
b(3,2) = fj2(dual1(gj2(1), 0), dual1(gj2(2), 0), dual1(gj2(3), 1)).f1;

b(1,3) = fj3(dual1(gj3(1), 1), dual1(gj3(2), 0), dual1(gj3(3), 0)).f1;
b(2,3) = fj3(dual1(gj3(1), 0), dual1(gj3(2), 1), dual1(gj3(3), 0)).f1;
b(3,3) = fj3(dual1(gj3(1), 0), dual1(gj3(2), 0), dual1(gj3(3), 1)).f1;

b










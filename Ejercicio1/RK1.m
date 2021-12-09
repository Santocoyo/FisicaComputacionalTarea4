close all
clear all
clc

fex = @(x) 4/1.3*exp(-0.5*x).*(exp(1.3*x)-1);
fr = @(x,y) 4*exp(0.8*x) - 0.5*y;

function local = RK1(fun_rhs,x0,xf,y0,npts)
  local = zeros(npts+1,2);
  
  h = (xf - x0)/npts;
  xvec = zeros(npts+1,1);
  yvec = zeros(npts+1,1);
  xvec(1) = x0;
  yvec(1) = y0;
  
  for ii=1:npts
    K1 = h*fun_rhs(xvec(ii),yvec(ii));
    xvec(ii+1) = xvec(ii) + h;
    yvec(ii+1) = yvec(ii) + K1;
  end
  
  local = cat(2, xvec, yvec);
end

x0=0;
xf=2;
y0=0;
npts = 100;
sol = RK1(fr,x0,xf,y0,npts);



xv = linspace(0,2,200);
yv = fex(xv);

plot(xv,yv, 'linewidth',2);
hold on;
scatter(sol(:,1),sol(:,2),3,'filled');

A = [1,4;2,5;3,6];
[m,n] = size(A);

for i=1:3
  for j=1:2
    disp(A(i+(j-1)*3))
  endfor
endfor

disp('-----')

for i=1:3
  for j=1:2
    disp(A(j+(i-1)*2))
  endfor
endfor

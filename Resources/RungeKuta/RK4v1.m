close all
clear all
clc

%fex = @(x) 4/1.3*exp(-0.5*x).*(exp(1.3*x)-1);
fr = @(x,y) 4*exp(0.8*x) - 0.5*y;

function local = RK4(fun_rhs,a,b,init_cond,n_ints)
  local = zeros(n_ints+1,2);
  
  h = (b - a)/n_ints;
  x = zeros(n_ints+1,1);
  y = zeros(n_ints+1,1);
  x(1) = a;
  y(1) = init_cond;
  
  for ii=1:n_ints
    K1 = h*fun_rhs(x(ii),y(ii));
    K2 = h*fun_rhs(x(ii)+0.5*h, y(ii)+0.5*K1);
    K3 = h*fun_rhs(x(ii)+0.5*h, y(ii)+0.5*K2);
    K4 = h*fun_rhs(x(ii)+h, y(ii)+K3);
    
    x(ii+1) = x(ii) + h;
    y(ii+1) = y(ii) + (1/6)*(K1 + 2*K2 + 2*K3 + K4);
  end
  
  local = cat(2, x, y);
end

a=0;
b=2;
y0=0;
npts = 10;
sol = RK4(fr,a,b,y0,npts);



xv = linspace(0,2,201);
yv = fex(xv);

plot(xv,yv, 'linewidth',2);
hold on;
scatter(sol(:,1),sol(:,2),15,'filled');

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

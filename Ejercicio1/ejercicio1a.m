close all;
clear all;
clc;

function local = RK4(fun_rhs,a,b,init_cond,n_ints)
  
  nrow = n_ints+1;
  ncol = size(init_cond)(2);
  
  local = zeros(nrow,ncol);
  
  h = (b - a)/n_ints;
  
  x = zeros(nrow,1);
  y = zeros(nrow,ncol);
  x(1) = a;
  y(1,:) = init_cond;
  for ii=1:n_ints
    K1 = h*fun_rhs(x(ii),y(ii,:));
    K2 = h*fun_rhs(x(ii)+0.5*h, y(ii,:)+0.5*K1);
    K3 = h*fun_rhs(x(ii)+0.5*h, y(ii,:)+0.5*K2);
    K4 = h*fun_rhs(x(ii)+h, y(ii,:)+K3);
    
    x(ii+1) = x(ii) + h;
    y(ii+1,:) = y(ii,:) + (1/6)*(K1 + 2*K2 + 2*K3 + K4);
  end
  
  local = cat(2, x, y);
end



fr = @(x,y) [y(2), 5-2*x-sin(x*y(1)*y(2))]

a=0;
b=2;
y0=[1,2];
npts = 500;
sol = RK4(fr,a,b,y0,npts);


hold on;
scatter(sol(:,1),sol(:,2),3,'filled');

clear all

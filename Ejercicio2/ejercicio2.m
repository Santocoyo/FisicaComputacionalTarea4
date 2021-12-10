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

c = 0.5;
g = 9.8;
l = 1;
m = 1;

fr = @(x,y) [y(2), -(c/m)*y(2)- (g/l)*sin(y(1))];

a=0;
b=10;
y0=[pi/2,2];
npts = 1000;
sol = RK4(fr,a,b,y0,npts);


hold on;
scatter(sol(:,1),m*g*cos(sol(:,2)),3,'filled');

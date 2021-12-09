1;
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

disp('Hello');

beta = 0.2;
epsilon_e = 0.3;
epsilon_q = 0;
epsilon_j = 0.1;
mu = 0.000034;
lambda = 408.09;
p = 0;
k1 = 0.1;
k2 = 0.125;
d1 = 0.0079;
d2 = 0.0068;
sigma1 = 0.0337;
sigma2 = 0.0386;
tf = 360;
B1 = 1;
B2 = 1;
B3 = 1;
B4 = 1;
C1 = 300;
C2 = 600;

fr = @(x,y) [(lambda - (y(1)*(beta*y(4) + epsilon_e*beta*y(2) + epsilon_q*beta*y(3) + epsilon_j*beta*y(5))/(y(1)+y(2)+y(3)+y(4)+y(5)+y(6))) - mu*y(1)), (p + (y(1)*(beta*y(4) + epsilon_e*beta*y(2) + epsilon_q*beta*y(3) + epsilon_j*beta*y(5))/(y(1)+y(2)+y(3)+y(4)+y(5)+y(6))) - (k1+mu)*y(2)), ((k2+mu)*y(3)), (k1*y(2) - (d1 + sigma1 + mu)*y(4)), (k2*y(3) - (d2 + sigma2 + mu)*y(5)), (sigma1*y(4) + sigma2*y(5) - mu*y(6))];
%fr = @(x,y) [(p + (y(1)*(beta*y(4) + epsilon_e*beta*y(2) + epsilon_q*beta*y(3) + epsilon_j*beta*y(5))/(y(1)+y(2)+y(3)+y(4))) - (k1+mu)*y(2)), ((k2+mu)*y(3)), (k1*y(2) - (d1 + sigma1 + mu)*y(4)), (k2*y(3) - (d2 + sigma2 + mu)*y(5))];

%{
fr{1} = @(x,y) (lambda - (y(1)*(beta*y(4) + epsilon_e*beta*y(2) + epsilon_q*beta*y(3) + epsilon_j*beta*y(5))/N) - mu*y(1));
fr{2} = @(x,y) (p + (y(1)*(beta*y(4) + epsilon_e*beta*y(2) + epsilon_q*beta*y(3) + epsilon_j*beta*y(5))/N) - (k1+mu)*y(2));
fr{3} = @(x,y) (k2+mu)*y(3);
fr{4} = @(x,y) (k1*y(2) - (d1 + sigma1 + mu)*y(4));
fr{5} = @(x,y) (k2*y(3) - (d2 + sigma2 + mu)*y(5));
fr{6} = @(x,y) (sigma1*y(4) + sigma2*y(5) - mu*y(6));
%}
%fa = @(x,y) [1,1];

a=-0;
b=360;
y0=[12000000,1565,292,695,326,20];
npts = 1000;
sol = RK4(fr,a,b,y0,npts);

graph = zeros(size(sol)(1),1);

for i=1:size(sol)(1)
  graph(i,1) = sol(i,3)+sol(i,4)+sol(i,5)+sol(i,6);
endfor

hold on;
scatter(sol(:,1),sol(:,3)+sol(:,5),5,'filled');
%scatter(sol(:,1),graph(:,1),5,'filled');

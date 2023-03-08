%fun = @(x)x(1)*exp(-norm(x)^2);
%fsurf(@(x,y)x.*exp(-(x.^2+y.^2)))

clc;
clear all;


power_threshold = 10;
height_threshold = 5;
alpha = 0.5; %    % Tradeoff between height and power.


fun = @(x)alpha*x(1) + (1-alpha)*x(2);

%fsurf(@(x,y)x.*exp(x + 2*y))
fsurf(@(x,y)x.*exp(0.5*x + (1-0.5)*y))

lb = -50;
ub = 50;


options = optimoptions('particleswarm','SwarmSize',1000);

rng default  % For reproducibility
nvars = 2;
x = particleswarm(fun,nvars,lb,ub,options)

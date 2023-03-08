clc;
clear all;

prob = optimproblem('ObjectiveSense','min');

power_threshold = 10;
height_threshold = 0.3;
alpha = 0.9; %    % Tradeoff between height and power.
%x(1) = pontencia
%x(2) = altura
    
x = optimvar('x',2,1,'LowerBound',0);
prob.Objective = alpha*x(1) + (1-alpha)*x(2);
%prob.Objective = x(1) * (alpha*x(2));

cons1 = x(1) <= power_threshold; %potencia maxima que o uav pode usar para comunicacao
cons2 = x(2) >= height_threshold; %altura mais baixa que o uav pode descer
cons3 = x(1) >= 0;
fsurf(@(x,y)x.*exp(0.5*x + (1-0.5)*y));

prob.Constraints.cons1 = cons1;
prob.Constraints.cons2 = cons2;
prob.Constraints.cons3 = cons3;

sol = solve(prob);
pow=0;
pow = sol.x(2,1);
fprintf('heigth: %f \n', pow);
h = sol.x(1,1);
fprintf('heigth: %f \n', h);



clc;
clear all;
%particleswarm

power_threshold = 2;
height_threshold = 0.5;
alpha = 0.5; %    % Tradeoff between height and power.
fsurf(@(x,y)x.*exp(0.5*x + (1-0.5)*y))

nvars =2;
options = optimoptions('particleswarm','Display','iter','SwarmSize',1000,'MaxIter',100);
[xotm,fval,exitflag,OutputMCback] = particleswarm(@Fobj,nvars, -50, -50, options);


function fun = Fobj(x)

fun = @(x)0.5*x(1) + (1-0.5)*x(2);

    %restricoes

    if ( x(1)<=2 )
       fun=1e10;
    end
    if (x(2) >= 0.5)
        fun=1e10;
    end
    if (x(1) >= 0)
        fun=1e10;
    end

end
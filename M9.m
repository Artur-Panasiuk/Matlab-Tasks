MN_Lab10()

function MN_Lab10()
clc
close all
clear 

wybor = 1;
switch wybor
    case 1
        f = @(x) exp(x-1) - 2;
        a = -1;
        b = 2;
    case 2
        f = @(x) log(x+(2/3));
        a = -(1/2);
        b = 2;
    case 3
        f = @(x) (x + 2)^5;
        a = -3;
        b = 0;
    otherwise
        f = @(x) sin(x);
        a = -1;
        b = 2;
end

tol = 10^(-5);
ftol = 10^(-4);

[x_sieczne, n_sieczne] = sieczne(f, a, b, tol, ftol)

[x_styczne, n_styczne] = styczne(f, a, b, tol, ftol)

%wykres
t = a:0.01:b;

figure
hold on
plot(t,f(t));
plot(x_sieczne, f(x_sieczne), 'r*', Marker='square');
plot(x_styczne, f(x_styczne), 'b*', Marker='square');


end

function [x, n] = sieczne(f, a, b, tol, ftol)
    if(f(a)*f(b) < 0)
        f1 = (f(a+10^-5)-f(a-10^-5))/2*10^-5;
        f2 = (f(a+10^-5)-2*f(a)+f(a-10^-5))/10^(-5*2);
        if(f1*f2 < 0)
            xprev = a;
            x = b;
        else
            xprev = b;
            x = a;
        end

        n = 0;
        
        while(abs(f(x)) > ftol && abs(x-xprev) > tol)
            n = n + 1;
            if(n > 1)
                %xprev = x;
            end
            x = x-f(x)*((x-xprev)/(f(x)-f(xprev)));
        end
    end
end

function [x, n] = styczne(f, a, b, tol, ftol)
    if(f(a)*f(b) < 0)
        f1 = (f(a+10^-5)-2*f(a)+f(a-10^-5))/10^(-5*2);
        f2 = @(x)(f(x+10^-5)-f(x-10^-5))/2*10^-5;
        if(f(a)*f1>0)
            xprev = a;
        else
            xprev = b;
        end
        n = 0;
        x = 0;
        while(abs(f(x)) > ftol && abs(x-xprev) > tol)
            n = n + 1;
            if(n > 1)
                xprev = x;
            end
            x = xprev-(f(xprev)/f2(xprev));
        end
    end
end
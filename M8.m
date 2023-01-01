clc
close all

tol = 10^-5;
ftol = 10^-4;

a = 0;
b = 2;
x = (a+b)/2;
f = @(x)cos(x);

a2 = 1;
b2 = 3;
f2 = @(x)2^-x+exp(x)+2*cos(x)-6;

a3 = -3;
b3 = 0;
f3 = @(x)(x+2)^5;



[x1, n1] = lab(f, a, b, tol, ftol)
[x2, n2] = lab(f2, a2, b2, tol, ftol)
[x3, n3] = lab(f3, a3, b3, tol, ftol)


function [x,n] = lab(f, a, b, tol, ftol)
    if(f(a)*f(b) < 0)
        n = 0;
        x = a;
        xprev = b;
        while(abs(f(x)) > ftol && abs(x-xprev) > tol)
            xprev = x;
            x=(a+b)/2;
            n = n + 1;
            if(f(a)*f(x) < 0)
                b = x;
            else
                a = x;
            end
        end
    else
        disp("Brak rozwiazan");
    end
end

function [x,n] = la(f,a,b,tol,ftol)
    f1 = (f(a+tol)-f(a-tol))/2*tol;
    f2 = (f(a+tol)-2*f(a)+f(a-tol))/tol^2;
    if(f1*f2>0)
        xs = a;
        x = b;
    else
        xs = 1;
        x = a;
    end
    x = xs - f(xs)*((x-xs)/(f(x)-f(xs)));
    n=0;
end
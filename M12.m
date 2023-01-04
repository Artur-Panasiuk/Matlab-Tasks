clc
close all

wybor = 1;

switch wybor
    case 1 
        f = @(x) x.^2-x;
        a = 0.25;
        b = 0.75;
    case 2 
        f = @(x) (1/3)*x^2-(13/7)*x+11; 
        a = -10;
        b = 10;
    case 3 
        f = @(x) (x.^4)-12*(x.^3)+x+4;
        a = -2;
        b = 2;
    otherwise 
        f = @(x) -x.^3+3*x.^2-3*x;
        a = -2;
        b = -1;
end

eps = 10^(-4);


[x1, n1] = szescienna(f, a, b, eps)

[x2, n2] = polowienia(f, a, b, eps)

t = a:0.01:b;
figure
plot(t, f(t));
hold on;
plot(x1, f(x1), 'ro');
plot(x2, f(x2), "rx");


function [ x, n ] = szescienna( f, a, b, dokl )
ff = @(x) (f(x+dokl)-f(x-dokl))/(2*dokl);
n = 0;
x = a;
if(ff(a) < 0 && ff(b) > 0)
    while(abs(b-a) >= dokl && abs(ff(x)) >= dokl)
        Z = (3*(f(a)-f(b)))/(b-a) + ff(a) + ff(b);
        Q = sqrt(Z^2-ff(a)*ff(b));
        x = b - ((ff(b)+Q-Z)/(ff(b)-ff(a)+2*Q)) * (b-a);
    
        if(ff(x) > 0)
            a = x;
        else
            b = x;
        end
        n = n + 1;
    end
else
    if(f(a) < f(b))
        x = a;
    else
        x = b;
    end
end
end

function [ x, n ] = polowienia( f, a, b, dokl )
ff = @(x) (f(x+dokl)-f(x-dokl))/(2*dokl);
x = a;
n = 0;
if(ff(a) < 0&& ff(b) > 0)
    x = (a+b)/2;
    while(abs(b-a) >= dokl && abs(ff(x)) >= dokl)
        L = b-a;
        x1 = a + 0.25 * L;
        x2 = b - 0.25 * L;

        if(f(a) > f(b))
            a = x1;
            if(f(x1) > f(b))
                a = x;
                x = x2;
            elseif(f(x2) > f(b))
                b = x;
                x  =x1;
            else
                a = x1;
                b = x2;
            end
        end
        n = n + 1;
    end
else
    if(f(a) < f(b))
        x = a;
    else
        x = b;
    end
end
end
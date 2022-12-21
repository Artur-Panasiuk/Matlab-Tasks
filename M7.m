clc
close all

%przygotowanie macierzy vandermonda n * n
%obliczenie współczynników wielomianu A = V^-1 * y (wektor kolumnowy n * 1)
%obliczenie wielomianu (z=x(1):0.01:x(end))

[a,b,c,d] = interpol(5);
[e,f,g,h] = interpol(10);
[i,j,k,l] = interpol(15);

figure
hold on
subplot(3,3,1)
plot(a, b, "r", LineWidth=2)
plot(c,d,"b",'linestyle','none','marker','*')
subplot(3,3,2)
plot(e, f, "r", LineWidth=2)
plot(g,h,"b",'linestyle','none','marker','*')
subplot(3,3,3)
plot(i, j, "r", LineWidth=2)
plot(k,l,"b",'linestyle','none','marker','*')


function [x,y,z,w] = interpol(n)

    x = linspace(-15, 15, n);
    y = 1./(25+x.^2);
    
    V = zeros(n);
    
    for i = 1:n
        V(:,i) = x'.^(i-1);
    end
    
    A = V^-1*y';
    
    z = x(1):0.01:x(end);
    
    w = 0;
    
    for j = 1:n
        w = w + A(j)*z.^(j-1);
    end

end

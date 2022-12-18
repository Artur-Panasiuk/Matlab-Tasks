clc
clear all
close all

%zad 1

format short

a = 0.2 + 0.2 + 0.2;

a == 0.6;

format long e

a = 0.2 + 0.2 + 0.2;

a == 0.6;

%rożnica w zaaokrąglaniu bitów + to nie są liczby maszynowe

%zad 2

x = [exp(1), -pi, sqrt(2), -psi(1), log10(2)];
y = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049];

n = x * y';
dot(x, y) %oba robią to samo

m = sum(x.*y);

v = 0;

for i = 1 : 5
    v = v + (x(i) * y(i));
end

b = 0;

for j = 5 : -1 : 1
    b = b + (x(j) * y(j));
end

e1 = abs(n - m);
e2 = abs(n - v);
e3 = abs(n - b);

bar(2:4, [e1,e2,e3]);

close all

%zad 3

format long e

x = 29/13
y = 29 - 13*x
x1 = 29/1300
y1 = 29 - 1300*x1
%komputer przekształcając liczby na bity zaokrągla wyniki

%zad 4 
k = 4:1:10;
x = 10.^k;

f = single(sqrt(1+x.^2));

w1 = single(x - f)
w2 = single(-1./(x+f))

format short

k = 4:1:10;
x = 10.^k;

f = double(sqrt(1+x.^2));

w1 = double(x - f)
w2 = double(-1./(x+f))

%różnią się

%zad 5

d = 10^-3;
x = 2-d:0.000002:2+d;

fa = wielomian1(x);

fb = wielomian2(x);

y = 2;

figure
hold on
plot(x, fa, "r", LineWidth=2);
plot(x, fb, "b", LineWidth=1);

h = max(abs(fa-fb))

close all

figure
hold on
plot(x, blad(fa,fb), "g")


function [a] = wielomian1(x)
    b = (x-2);
    a = b.^4;
end

function [a] = wielomian2(x)
    a = x.*x.*x.*x - 8*x.*x.*x + 24*x.*x - 32*x + 16;
end

function [a] = blad(f1, f2)
    a = abs(f1-f2);
end







clc
clear all
close all

x = linspace(-10, 10, 100);
%y = x.^2+cos(x);
y = @(a)cos(a).^2;

y(7);
y([1,3,5,7]);

figure %otwiera puste okno
hold on %wyświetla wszystkie wykresy (w innym wypadku plot się nadpisuje)
plot(x, y(x), "r", LineWidth=2)
title("sus")
xlabel("[REDACTED]")
ylabel("yee")
x1 = -5:1:5;
plot(x1, y(x1), "bp", MarkerSize=12, LineWidth=3)
legend("me when", "bottom text")

close all

x1 = 0:0.1:10;
x2 = 0:0.5:10;

y1 = @(x)8*sin(x)-2*x;
y2 = @(x)abs(8*sin(x)-2*x); %abs funkcja bezwzględności

% ZADANIE 1

figure
hold on
title("zad 1")
xlabel("x")
ylabel("y")
plot(x1, y1(x1), "r")
plot(x2, y2(x2), "bp", Color=[0 1 0])
legend("x1", "x2")


close all

% TUTORIAL

figure
hold on
subplot(2,2,[1,2]) %(licza wykresów, liczba kolumn, n-aktualny wykres od 1...n lub zakres wykresów których pola zajmie)
plot(x1, y1(x1), "r")
xlabel("x1")
ylabel("y1")
legend("a")
title("x")
subplot(2,2,3)
plot(x2, y2(x2), "bp", Color=[0 1 0])
xlabel("x2")
ylabel("y2")
legend("b")
title("b")
subplot(2,2,4)
plot(x2, y2(x2), "bp", Color=[0 1 0])
xlabel("x2")
ylabel("y2")
legend("b")
title("b")

close all

% ZADANIE 3

figure
hold on

subplot(5,4, [1,2])
q = -5:0.1:5;
plot(q, sin(q), "b")
title("f(x) = sin(x)")

subplot(5,4, [3,4])
w = -5:0.1:5;
plot(w, cos(w), "g")
title("f(x) = cos(x)")

subplot(5,4,5)
e = -5:0.1:5;
plot(e, tan(e), Color=[0 0 0])
title("f(x) = tan(x)")

subplot(5,4,[6,7])
f = -5:0.1:5;
plot(f, abs(f), "r")
title("f(x) = abs(x)")

subplot(5,4,8)
h = -5:0.1:5;
plot(h, h, Color=[0.6 0 1])
title("f(x) = x")

close all

% 3D + KONTUR

figure
x = -10:0.2:10;
y = -8:0.2:8;
[X, Y] = meshgrid(x, y);
f = @(a,b)a.^2+b.^2;
%mesh(X,Y,f(X,Y)) %mesh lub surf
%hold on
%plot3(0,0,f(0,0),"r*")
contour(X,Y,f(X,Y), "ShowText","on")

% ŚCIEŻKA PO KONTURZE

x1 = [-10, -6, 0, 0];
y1 = [-8,-5,-2,0];
hold on
plot(x1,y1)
plot(x1(1), y1(1), "rd")
plot(x1(end), y1(end), "gv")















clc
close all

x1 = [0, 15, 52, 70, 104, 130, 150];
y1 = [0, 28, 4, 19, 8, 30, 0];

x2 = [0, 28, 60, 95, 113, 135, 150];
y2 = [0, -40, -4, -21, -17, -24, 0];

g = griddedInterpolant(x1, y1, 'spline');
d = griddedInterpolant(x2, y2, 'spline');

figure
hold on
x = 0:0.1:150;
plot(x, g(x), 'r', LineWidth=1.5)
plot(x, d(x), 'b', LineWidth=1.5)
plot(x1, y1, 'b*')
plot(x2, y2, 'r*')
set(gca, 'DataAspectRatio', [1 1 1]);

krok = 10;

C_up = trapezy(g, 0, 150, krok);
C_down = trapezy(d, 0, 150, krok);

C = C_down + C_up

function [C] = trapezy(fun, a, b, h)
    C = 0;
    p1 = a;
    p2 = a+h;

    while p1 < b
        if p2>b
            p2 = p2-h;
            h = b-p1;
            p2 = p2+h;
        end
        P = ((fun(p1)+fun(p2))/2)*h;
        C = C+P;
        patch('Vertices', [p1, 0; p2, 0; p2, fun(p2); p1, fun(p1)],'Faces', [1,2,3,4],'FaceColor', [0, 0.4470, 0.7410], 'FaceAlpha', 0.4)
        p1 = p2;
        p2 = p2 + h;
    end
    C = abs(C);
end
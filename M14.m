clc
close
clear

wybor = 5;

% DO UZUPEŁNIENIA
switch wybor
    case 1
        f = @(x,y) x.^2 + y.^2; 
        xp = -10;
        xk = 10;
        yp = -10;
        yk = 10;
        xpocz = 8;
        ypocz = -10;
        krok = 1;
    case 2 
        f = @(x,y) -cos(x).*cos(y).*exp(-((x-pi).^2+(y-pi).^2));
        xp = 2;
        xk = 4;
        yp = 2;
        yk = 4;
        xpocz = 2;
        ypocz = 2;
        krok = 0.1;
    case 3
        f = @(x,y) (1-8.*x+7.*x.^2-(7/3).*x.^3+(1/4).*x.^4).*(y.^2.*exp(-y));
        xp = 0;
        xk = 5;
        yp = 0;
        yk = 5;
        xpocz = 5;
        ypocz = 5;
        krok = 0.2;
    case 4
        f = @(x,y) -cos(x).*cos(y).*exp(-1*((x-pi).^2+(y-pi).^2));
        xp = -10;
        xk = 10;
        yp = -10;
        yk = 10;
        xpocz = 1.5;
        ypocz = 5;
        krok = 0.5;
    otherwise
        f = @(x,y) -cos(x).*cos(y).*exp(-1*((x-pi).^2+(y-pi).^2));
        xp = 1;
        xk = 5;
        yp = 1;
        yk = 5;
        xpocz = 1.5;
        ypocz = 5;
        krok = 0.5;
end


[ x0, y0, dx, dy, iteracje ]=sww(f,xpocz,ypocz,krok,0.01,xp,xk,yp,yk);
[x0, y0, f(x0, y0), iteracje]


subplot(2,1,1)
% wykres funkcji 3d na zadanym przedziale - meshgrid + mesh
[x,y]=meshgrid(xp:krok:xk,yp:krok:yk); % DO UZUPEŁNIENIA
mesh(x,y,f(x,y)); % DO UZUPEŁNIENIA
hold on
% narysowanie punktu ze znalezionym minimum
plot3(x0,y0,f(x0,y0),'r*'); % DO UZUPEŁNIENIA

% wykres konturowy
subplot(2,1,2);
z=f(x,y);
[c,h]=contour(x,y,z);
clabel(c,h);
hold on

% narysowanie i podpisanie punktu poczatkowego
plot(xpocz,ypocz,'r*'); % DO UZUPEŁNIENIA
text(xpocz,ypocz,'START'); % DO UZUPEŁNIENIA

% narysowanie i podpisanie punktu koncowego - znalezionego minimum
plot(x0,y0,'r*'); % DO UZUPEŁNIENIA
text(x0,y0,'STOP'); % DO UZUPEŁNIENIA

% narysowanie sciezki - linie pomiędzy kolejnymi punktami
for i=1:length(dx)-1
    line(dx,dy,'Color', 'k', 'Linewidth',1); %sciezka % DO UZUPEŁNIENIA
    contour(x,y,z,[f(dx(i),dy(i)),f(dx(i),dy(i))]);
end

function [ x0, y0, tablx, tably, iteracje ] = sww( f, xpocz, ypocz, krok, eps, xmin, xmax, ymin, ymax )
    tablx = [];
    tably = [];
    x0 = xpocz;
    y0 = ypocz;
    h = eps;
    dx = @(x,y) (f(x+h,y)-f(x-h,y))/(2*h);
    dy = @(x,y) (f(x,y+h)-f(x,y-h))/(2*h);
    iteracje=0;
    d = krok/sqrt(2);
    while(iteracje < 200 && (abs(dx(x0,y0)) > eps || abs(dy(x0,y0)) > eps))
        
        Px = [x0, x0+krok, x0, x0-krok, x0+d, x0+d, x0-d, x0-d];
        Py = [y0+krok, y0, y0-krok, y0, y0+d, y0-d, y0-d, y0+d];

        W = [f(Px(1),Py(1)),f(Px(2),Py(2)),f(Px(3),Py(3)),f(Px(4),Py(4)),f(Px(5),Py(5)),f(Px(6),Py(6)),f(Px(7),Py(7)),f(Px(8),Py(8))];
        
        [wart,ind] = min(W);

        tablx(end+1) = x0;
        tably(end+1) = y0;

        x0 = Px(ind);
        y0 = Py(ind);

        iteracje = iteracje + 1;
        if(iteracje > 2 && (tablx(end) == tablx(end-2) && tably(end) == tably(end-2)))
            krok = krok/2;
        end
    end
end
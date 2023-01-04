clc
close all


zadanie1()
zadanie2()
zadanie3()

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function zadanie1()
figure;

% funkcja
f =@(x) cos(2*x);
% pierwsza pochodna funkcji f
df = @(x) -2*sin(2.*x);
% przedzial
a = 0;
b = 6;
% wartości h do zbadania
H = [1, 1/2, 1/4];

% petla po roznych krokach
for i = 1:length(H)
    % aktualny krok
    h = H(i);
    % wektor x ktory nalezy zbadac / pbliczyc wartosci pochodnych
    xx = a:h:b;

    %%% pochodna - wzor 2 punktowy
    subplot(3,3,i)
    hold on
    % wykres funkcji 
    plot(xx, f(xx),'k')
    % wykres pierwszej pochodnej funkcji 
    plot(xx,df(xx), 'r')
    % obliczanie pochodnej dla kolejnych wartosci x
    p2 = [];
    for x = a:h:b
        p2(end+1) = (f(x+h)-f(x))/(h);
    end
    % wykres pochodnej wyznaczonej numerycznie
    plot(xx,p2, 'b--')
    % obliczenie bledu sredniokwadratowego
    mse2 = 1/length(xx)*sum((p2-df(xx)).^2);
    % nadanie tytulu wykresowu
    title(['2pkt: h = ', num2str(h) ,' blad: ', num2str(mse2)])

    %%% pochodna - wzor 3 punktowy
    subplot(3,3,i+3)
    hold on
    plot(xx, f(xx),'k')
    plot(xx,df(xx), 'r')
    p3 = [];
    for x = a:h:b
        p3(end+1) = (f(x+h)-f(x-h))/(2*h);
    end
    plot(xx,p3, 'b--')
    mse2 = 1/length(xx)*sum((p3-df(xx)).^2);
    title(['2pkt: h = ', num2str(h) ,' blad: ', num2str(mse2)])

    %%% pochodna - wzor 5 punktowy
    subplot(3,3,i+6)
    hold on
    plot(xx, f(xx),'k')
    plot(xx,df(xx), 'r')
    p5 = [];
    for x = a:h:b
        p5(end+1) = (-f(x+2*h)+8*f(x+h)-8*f(x-h)+f(x-2*h))/(12*h);
    end
    plot(xx,p5, 'b--')
    mse2 = 1/length(xx)*sum((p5-df(xx)).^2);
    title(['2pkt: h = ', num2str(h) ,' blad: ', num2str(mse2)])
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function zadanie2()
figure

f =@(x) sin(x) + cos(2*x);
df = @(x) cos(x)-2*sin(2.*x);
a = 0;
b = 4;
H = [1/2, 1/4, 1/8];

for i = 1:length(H)
    h = H(i);

    xx = a:h:b;

    %%% pochodna w przod
    subplot(3,3,i)
    hold on
    plot(xx, f(xx),'k')
    plot(xx,df(xx), 'r')
    p1 = [];
    for x = a:h:b
        p1(end+1) = (-3*f(x)+4*f(x+h)-f(x+2*h))/(2*h);
    end
    plot(xx,p1, 'b--')
    mse2 = 1/length(xx)*sum((p1-df(xx)).^2);
    title(['2pkt: h = ', num2str(h) ,' blad: ', num2str(mse2)])
    

    %%% pochodna centralny
    subplot(3,3,i+3)
    hold on
    plot(xx, f(xx),'k')
    plot(xx,df(xx), 'r')
    p2 = [];
    for x = a:h:b
        p2(end+1) = (f(x+h)-f(x-h))/(2*h);
    end
    plot(xx,p2, 'b--')
    mse2 = 1/length(xx)*sum((p2-df(xx)).^2);
    title(['2pkt: h = ', num2str(h) ,' blad: ', num2str(mse2)])
    

    %%% pochodna wstecz
    subplot(3,3,i+6)
    hold on
    plot(xx, f(xx),'k')
    plot(xx,df(xx), 'r')
    p3 = [];
    for x = a:h:b
        p3(end+1) = (f(x-2*h)-4*f(x-h)+3*f(x))/(2*h);
    end
    plot(xx,p3, 'b--')
    mse2 = 1/length(xx)*sum((p3-df(xx)).^2);
    title(['2pkt: h = ', num2str(h) ,' blad: ', num2str(mse2)])
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function zadanie3()
figure
f =@(x) cos(4*x) - (1/2)*x;
df = @(x) -4*sin(4*x)-(1/2);
ddf = @(x) -16*cos(4*x);
a = 0;
b = 5;
H = [1, 1/2, 1/4];

for i = 1:length(H)
    h = H(i);

    xx = a:h:b;

    %%% 2 pochodna - 3 punktowy
    subplot(2,3,i)
    hold on
    plot(xx, f(xx),'k')
    plot(xx,ddf(xx), 'r')
    p3 = [];
    for x = a:h:b
        p3(end+1) = (f(x+h)-2*f(x)+f(x-h))/(h^2);
    end
    plot(xx,p3, 'b--')
    mse2 = 1/length(xx)*sum((p3-ddf(xx)).^2);
    title(['2pkt: h = ', num2str(h) ,' blad: ', num2str(mse2)])
    

    %%% 2 pochodna - 5 punktowy
    subplot(2,3,i+3)
    hold on
    plot(xx, f(xx),'k')
    plot(xx,ddf(xx), 'r')
    p4 = [];
    for x = a:h:b
        p4(end+1) = (-f(x+2*h)+16*f(x+h)-30*f(x)+16*f(x-h)-f(x-2*h))/(12*h^2);
    end
    plot(xx,p4, 'b--')
    mse2 = 1/length(xx)*sum((p4-ddf(xx)).^2);
    title(['2pkt: h = ', num2str(h) ,' blad: ', num2str(mse2)])
    
end
end
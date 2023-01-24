clc
close all
clear

A = [2,1;3,3;2,0;1,0;0,1];
B = [10;24;8;0;0];
Z = [-1;-1;-1;1;1];
F = [300, 200];

[w,k] = size(A);
A = A(1:w-k,:);
B = B(1:w-k);
Z = Z(1:w-k);
w = w-k;

A = [A, eye(w)];
F = [F, zeros(1,w)];

tab = [A,B];
cb = zeros(1,w);
wd = w:w+k;

Fc = cb*tab(:,end);
WW = zeros(1,size(F,2));

flag = 0;

for i = 1:length(WW)
    x = F(i)-cb*tab(:,i);
    WW(i) = x;
    if(x > 0)
        flag = 1;
    end
end

if (flag == 1 )
    a = [];
    [mx, ind] = max(WW);
    for i = 1:size(tab(:,end))
        a  = [a ,tab(i, end)/tab(i, ind)];
    end
end

cb(1, end) = mx;

v3 = [];
v3 = [v3, tab(3, :)/2];

v1 = [];
v2 = [];

v1 = [v1, tab(1, :)-2*v3(1,:)];
v2 = [v2, tab(2, :)-3*v3(1,:)];

tab2 = [v1;v2;v3];

WW2 = zeros(1, size(tab2, 2));

WW2(1, end) = cb(1, :) * tab2(:, 6);

flag = 0;

for i = 1:length(WW2) - 1
    x = F(i)-cb*tab2(:,i);
    WW2(i) = x;
    if(x > 0)
        flag = 1;
    end
end

if (flag == 1 )
    b = [];
    [mx, ind] = maxk(WW2, 2);
    for i = 1:size(tab2(:,end))
        b  = [b ,tab2(i, end)/tab2(i, ind(2))]
    end
end



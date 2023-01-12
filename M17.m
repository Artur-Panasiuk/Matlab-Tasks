clc
close all
clear

X = [90 55];

A = [0.1, 0.2; 0.3, 0.1; 0.5, 0; 1, 0; 0, 1];

B = [300; 300; 400; 0; 0];

Z = [-1;-1;-1;1;1];

[W, K] = size(A);

P = [];

for i = 1: W
    for j = i+1:W
        at = [A(i,:);A(j,:)];
        bt = [B(i); B(j)];

        if(det(at)~=0)
            PT = (at^-1)*bt;
            P(end+1, :) = PT;
        end
    end
end

D = [];

for i = 1:size(P,1)
    licznik = 0;
    for j = 1:W
        PT = P(i,:);
        T = sum(PT.*A(j,:));
        switch Z(j)
            case 1
                if(T >= B(j))
                    licznik =  licznik + 1;
                end
            case -1
                if(T <= B(j))
                    licznik =  licznik + 1;
                end
            case 0
                if(T == B(j))
                    licznik =  licznik + 1;
                end     
        end
    end
    if(licznik == W)
        D(end+1,:) = PT;
    end
end

G = [];

for i = 1:size(D, 1)
    G(end+1)=sum(X.*D(i,:));
end

[wart, idx]=max(G);

figure
hold on
plot(A, "red");
plot(P, "black");
plot(D, ".");
plot(G, "v");


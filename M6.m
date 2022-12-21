clc
close all

p = 1;

switch p
    case 1
        A = [2,2,1;1,4,1;0,1,2];
    case 2
        A = [4,1,4;2,-1,1;1,1,2];
    case 3
        A = [2,2,1,-1;0,3,1,2;1,2,2,1;1,1,1,0];
    case 4
        A = [2,1,-1;3,0,1;-2,1,4];
end

[X,Y] = doolittle(A)
[Z,V] = lu(A)

function [L, U] = doolittle(A)
    n = size(A,1);
    L = eye(n);
    U = zeros(n);

    for i = 1 : n
        for j = i : n
            for k = 1 : (i - 1)
                temp = 0;
                for p = 1 : (k - 1)
                    temp = temp + L(i,p) * U(p,k);
                end
                L(i,k) = (A(i,k) - temp) / U(k,k);
            end

            for k = i : n
                temp = 0;
                for p = 1 : (i - 1)
                    temp = temp + L(i,p) * U(p,k);
                end
                U(i,k) = A(i,k) - temp;
            end
        end
    end    
end
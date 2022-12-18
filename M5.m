clc
close all

p = 1;

switch p
    case 1
        A = [2, 2, 1; 1, 4, 1; 1, 0, 1];
        B = [3,-1,1];
    case 2
        A = [1, 1, 2; 2, -1, 2; 4, 1, 4];
        B = [-1, -4, 2];
    case 3
        A = [1, 1, 1, 0; 2, 2, 1, -1; 0, 3, 1, 2; 1, 2, 2, 1];
        B = [4, 6, -1, 4];
    otherwise
        A = [0, 3, 1; 2, 1, -1; -2, 1, 4];
        B = [-2, 4, -4];
end

X = eliminacjaGaussa(A, B)

function X = eliminacjaGaussa(A, B)
    N = length(A);
    for j = 1 : (N-1)
        for i = N : -1 : j + 1
            m = A(i,j) / A(j,j);
            A(i,:) = A(i,:) - m * A(j,:);
            B(i) = B(i) - m * B(j);
        end
    end 
    X = A;
end
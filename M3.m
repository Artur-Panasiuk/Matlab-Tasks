clc
clear all
close all

lucas(4)
flipn(5693)
palindrom('2022')
bs([2 3 4 1])
fzerowe(2,2,3)

%ZAD 1

function [m] = lucas(n)
    if(n < 0) m = 0;
    end
    if(n == 0) m = 2;
    end
    if(n == 1) m = 1;
    end
    if(n > 1)
        m = [2,1];
        for i = 2:1:n
            m(end + 1) = m(i) + m(i-1);
        end
    end
    
end

%ZAD 2

function [m] = flipn(n)
    temp = num2str(n);
    m = [];
    for i = length(temp):-1:1
        %m(end + 1) = temp(i)
        m = [m, temp(i)];
    end
    m = str2num(m);
end

%ZAD 3

function [m] = palindrom(n)
    n2 = n(end:-1:1);
    if(n == n2)
        m = true;
    else
        m = false;
    end
end

% ZAD 4

function [n] = bs(n)
    num = length(n);
    for j = 0 : num-1
        for i = 1: num-j-1
            if n(i)>n(i+1)
                temp = n(i);
                n(i) = n(i+1);
                n(i+1) = temp;
            end
        end
    end
end

% ZAD 5 NIE SKONCZONE

function [n] = fzerowe(a,b,c)
    x = [-10;1;10];
    y = @(z) a*z.^2 + b*z + c;

    figure
    plot(x, y(x), "r")

end




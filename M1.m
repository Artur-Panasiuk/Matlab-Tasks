a = 5
b = 'info1'
c = "info2"

d = [1,-2,-3]
e = [3;2;1]

f = [1,2,3;
    4,5,6;
    7,8,9;
    10,11,12]

f(1,3) % f(wiersz,kolumna)
f(end) % ostatni element macierzy

f(4,:) % : oznacza wszystkie elementy

f(3,1:2:end) % start : skok : koniec lub start : stop

length(f) % liczba wierszy
numel(f) % liczba elementow
size(f) % liczba wierszy i kolumn

sum(f, 2) % suma elementow w kolumnie/wierszu (macierz, 1 dla kolumn / 2 dla wierszy)
max(f) % maksymalna wartosc w kolumnie
max(f, [], 2) % maksymalna wartosc w wierszu

%doc % otwiera dokumentacje

g = [f;[13,14,15]] % nowa macierz ze starych i nowych danych w nowym wierszu
f(end+1,:) = [13,14,15] % nadpisywanie macierzy z nowym wierszem (zła praktyka)

h = [f,[-1;-2;-3;-4;-5]] % nowa macierz ze starymi i nowymi danymi w nowej kolumnie

i = [2,3;4,6]
j = [3,7;1,5]

i*j % mnozenie macierzy
i.*j % mnozymy pierwszy element przez pierwszy, drugi przez drugi itd.

m = randi(12, 5,3) % losowa macierz (zakres od 1 do x, kolumny, wiersze)

for i=1:size(m,1)
    m(i,:)
end

while i<=size(m,1)
    m(i,:)
    i=i+1; % na koncu wyrazenia nie pokaze go w terminalu
end

for i = 1:size(m,1)
    for j = 1:size(m,2)
        m(i,j)
    end
end

for i = 1:size(m,1)
    for j = 1:size(m,2)
        if mod(m(i,j),2) == 0
            m(i,j) = 0
        else
            m(i,j) = -1
        end
    end
end

zamien(20, 5, 6)

xa = 0;

for i = 1:size(m,1)
    for j = 1:size(m,2)
        if m(i,j) == -1
            xa = xa  + 1;
        end
    end
end


    



















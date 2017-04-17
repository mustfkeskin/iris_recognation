%INPUTS:
%1.I: ��lenecek Resim
%2.C: x0,y0 �izilecek �emberin merkezini i�eren noktalar
%3.n: �izilecek nokta say�s�
%4.r: yar��ap
%OUTPUT:
%1.O: �ember ��kt�l� resim
function [O]=drawCircleWrite(I,C,r,n)
rows=size(I,1);
cols=size(I,2);

% intensity de�eri 0 olan de�er varsa de�i�ssin diye
I = I - 1;

% theta 2 nokta aras�nda ka� derece a�� fark� oldu�unu tutuyor.
theta = (2 * pi) / n;
angle = theta : theta : 2 * pi;
   
x = C(1) + r * sin(angle);
y = C(2) + r * cos(angle);

if any(x >= rows)|any(y >= cols)|any(x <= 1)|any(y <= 1)
    O=I;
    return
end

% �ember kenarlar� �iziliyor
for i=1:n
    I(round(x(i)),round(y(i))) = 255;
end
O=I;
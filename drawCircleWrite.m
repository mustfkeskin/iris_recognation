%INPUTS:
%1.I: İşlenecek Resim
%2.C: x0,y0 çizilecek çemberin merkezini içeren noktalar
%3.n: çizilecek nokta sayısı
%4.r: yarıçap
%OUTPUT:
%1.O: çember çıktılı resim
function [O]=drawCircleWrite(I,C,r,n)
rows=size(I,1);
cols=size(I,2);

% intensity değeri 0 olan değer varsa değişssin diye
I = I - 1;

% theta 2 nokta arasında kaç derece açı farkı olduğunu tutuyor.
theta = (2 * pi) / n;
angle = theta : theta : 2 * pi;
   
x = C(1) + r * sin(angle);
y = C(2) + r * cos(angle);

if any(x >= rows)|any(y >= cols)|any(x <= 1)|any(y <= 1)
    O=I;
    return
end

% çember kenarları çiziliyor
for i=1:n
    I(round(x(i)),round(y(i))) = 255;
end
O=I;
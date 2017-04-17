%INPUTS:
%1.I: Ýþlenecek Resim
%2.C: x0,y0 çizilecek çemberin merkezini içeren noktalar
%3.n: çizilecek nokta sayýsý
%4.r: yarýçap
%OUTPUT:
%1.O: çember çýktýlý resim
function [O]=drawcircle(I,C,r,n)
rows=size(I,1);
cols=size(I,2);

% intensity deðeri 0 olan deðer varsa deðiþssin diye
I = I - 1;

% theta 2 nokta arasýnda kaç derece açý farký olduðunu tutuyor.
theta = (2 * pi) / n;
angle = theta : theta : 2 * pi;


% angle = angle( ...
%         (angle <= pi/4 & angle >= 0) | ...
%         (angle <= 5*pi/4 & angle >= 3*pi/4) | ...
%         (angle <= 2* pi & angle >= 7*pi/4));
%     
% n = length(angle);
   

x = C(1) + r * sin(angle);
y = C(2) + r * cos(angle);



if any(x >= rows)|any(y >= cols)|any(x <= 1)|any(y <= 1)
    O=I;
    return
end

% çember kenarlarý çiziliyor
for i=1:n
    I(round(x(i)),round(y(i))) = 255;
end
O=I;
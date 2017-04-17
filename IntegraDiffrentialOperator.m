function [b_,r_] = IntegraDiffrentialOperator(I,x,y,r)

%C = center
C(1) = x;
C(2) = y;

% mean vektörü çemberdeki instensiti deðerlerin çevreye bölümünü tutar
mean = zeros(1,length(r),'double');

%gradientler hesaplanýyor
for i = 1:r
    n = 2 * pi * i;
    circle = drawcircle(I,C,i,n);
    %imshow(circle);
    mean(i) = sum(I(circle == 255));
    mean(i) = mean(i) / n;
end


%fark hesaplanýyor
fark = zeros(1,r - 1,'double');
for i = 1:r-1
    fark(i) = mean(i + 1) - mean(i);
end

sigma = 1;
%gauss fonksiyonu
 x = -2 : 2;
 G = zeros(1,length(x),'double');
 for i=1:length(G)
    G(i) = (1 / (sqrt(2 * pi) * sigma)) * exp(-(x(i)^2) / (2 * sigma ^ 2));
 end
 
 fark = [0 0 0 fark 0 0 0];
 sonuc = zeros(1,length(fark),'double');
 for i=4:length(fark) - 4
     sonuc(1,i) = sum(fark(1,i:i+4) .* G);
 end

[b,r] = max(sonuc);

r_= r;
b_= b;

% circle = drawcircle(I, C, r_, 2 * pi * r_);
% figure;
% imshow(circle);
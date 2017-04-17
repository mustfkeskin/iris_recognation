clear;
fullDir = 'F:/Ders/Ders - Yüksek Lisans/Computer Vision/Ödev2/ubiris3/UBIRIS_200_150_R/';

fid = fopen('files.txt','rt');
tmp = textscan(fid,'%s','Delimiter','\n');
files = tmp{1};

for i=1:length(files)
    i
    fullFileName = strcat(fullDir,files{i});
    
    %resim okunuyor
    I = imread(fullFileName);

    rows=size(I,1);
    cols=size(I,2);

    r = 60;
    results = [;];

    for x = round(rows / 2) - 10  : round(rows / 2) + 10
        for y = round(cols / 2) - 10 : round(cols / 2) + 10
            [value, radius] = IntegraDiffrentialOperator(I, x, y, r);
            results = [results ;[value radius x y]];
        end
    end



    results = results(results(:,2) > 5,:);
    best    = results(results(:,1) == max(results(:,1)),:);

    radius = best(2);
    C(1)   = best(3);
    C(2)   = best(4);
    circle = drawCircleWrite(I, C, radius, 2 * pi * radius);

    B = results(results(:,2) > radius * 1.25,:);
    B = sortrows(B,[-1]);

    if(size(B,1) > 0)
        radius = B(1,2);
        C(1)   = B(1,3);
        C(2)   = B(1,4);
        circle = drawCircleWrite(circle, C, radius, 2 * pi * radius);
    end;

    fileDir = 'F:/Ders/Ders - Yüksek Lisans/Computer Vision/Ödev2/ubiris3/Sonuclar/';
    fileName = strsplit(fullFileName,'/');
    fileName = fileName(length(fileName));
    path = strcat(fileDir,fileName);
    imwrite(circle,path{1});

end




% 
% C(1)=;
% C(2)=;
% r=;
% imshow(drawcircle(I,C,r,2 * pi * r));
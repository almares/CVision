img=imread('image.jpg');

energyImg = energy_img(img);

initial=img;
nend=energyImg;
numOfPixels = 100;

for i=1:numOfPixels
    [initial,nend] = reduceWidth(initial,nend);
end

figure;
imshow(initial);
title('Decreased Width of 100 pixels - image');
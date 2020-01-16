img=imread('image.jpg');

energyImg = energy_img(img);

initial=img;
nend=energyImg;
numOfPixels = 100;

for i=1:numOfPixels
    [initial,nend] = reduceHeight(initial,nend);
end

figure;
imshow(initial);
title('Decreased Height of 100 pixels - image');
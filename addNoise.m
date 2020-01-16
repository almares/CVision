function [noise] = addNoise(img)

image = im2double(img);
x = var(image(:));
noise = imnoise(image, 'gaussian', 0, x);

end
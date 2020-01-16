img = rgb2gray(imread('centurytower.jpg'));
imshow(img),title('Original - Century Tower');

fourier = fft2(double(img));
fourierMag = abs(fourier);
fourierPhase = exp(1i*angle(fourier));
invMag = log(abs(ifft2(fourierMag*exp(i*0)))+1);
invPhase = ifft2(fourierPhase);

invMagMin = min(min(abs(invMag)));
invMagMax = max(max(abs(invMag)));

invPhaseMin = min(min(abs(invPhase)));
invPhaseMax = max(max(abs(invPhase)));

magMinNoise = min(min(abs(addNoise(invMag))));
magMaxNoise = max(max(abs(addNoise(invMag))));

phaseMinNoise = min(min(abs(addNoise(invPhase))));
phaseMaxNoise = max(max(abs(addNoise(invPhase))));

figure;
imshow(abs(invMag),[invMagMin invMagMax]), colormap gray
title('Image reconstructed by magnitude only');
figure;
imshow(abs(invPhase), [invPhaseMin invPhaseMax]), colormap gray
title('Image reconstructed by phase only');
 
figure;
imshow(abs(addNoise(invMag)), [magMinNoise magMaxNoise]), colormap gray
title('Random noise on Magnitude');
figure;
imshow(abs(addNoise(invPhase)), [phaseMinNoise phaseMaxNoise]), colormap gray
title('Random noise on Phase');
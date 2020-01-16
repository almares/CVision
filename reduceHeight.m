function [redColorImg,redEnergyImg] = reduceHeight(im,numPixels)

mat=zeros(size(numPixels));
mat(:,1)=numPixels(:,1);
mat(1,2:end)=inf;
mat(end,2:end)=inf;
for i=2:size(mat,2)
    for j=2:size(mat,1)-1
        mat(j,i)=numPixels(j,i)+min(mat(j-1:j+1,i-1));
    end
end
cumulativeEnergyMapHoriz = mat;

%%imagesc(cumulativeEnergyMapHoriz);
%%title('Image Horizontal Cumulative Minimum Energy Map')

hSeam = findHSeam(cumulativeEnergyMapHoriz);

for i=1:length(hSeam)
    im(hSeam(i):end-1,i,:)=im(hSeam(i)+1:end,i,:);
end

redColorImg=im(1:end-1,:,:);
redEnergyImg=energy_img(redColorImg);
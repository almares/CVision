function [redColorImg,redEnergyImg] = reduceWidth(im,numPixels)

mat=zeros(size(numPixels));
mat(1,:)=numPixels(1,:);
mat(2:end,1)=inf;
mat(2:end,end)=inf;
for i=2:size(mat,1)
    for j=2:size(mat,2)-1
        mat(i,j)=numPixels(i,j)+min(mat(i-1,j-1:j+1));
    end
end
cumulativeEnergyMapVert = mat;

%%imagesc(cumulativeEnergyMapVert);
%%title('Image Vertical Cumulative Minimum Energy Map')

verticalSeam = findVSeam(cumulativeEnergyMapVert);

for i=1:length(verticalSeam)
    im(i,verticalSeam(i):end-1,:)=im(i,verticalSeam(i)+1:end,:);
end

redColorImg=im(:,1:end-1,:);
redEnergyImg=energy_img(redColorImg);
function vSeam = findVSeam(energyMap)

vSeam=zeros(size(energyMap,1),1);

[a b]=min(energyMap(end,:));
vSeam(end)=b;
for i=size(energyMap,1)-1:-1:1
    [a bb]=min(energyMap(i,b-1:b+1));
    b=b+bb-2;
    vSeam(i)=b;
end
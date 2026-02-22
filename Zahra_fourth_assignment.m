close all
clear
%load Yale_32x32.mat
load Yale_64x64.mat
faceW = 64;
%face_width
faceH = 64;
%face_height
%to extract, for example, 7 faces for 5 individuals:
X=fea; 
numPerLine = 6; %number of different faces to visualise
ShowLine = 5; %number of rows
Y = zeros(faceH*ShowLine,faceW*numPerLine);
for i=0:ShowLine-1
 for j=0:numPerLine-1
Y(i*faceH+1:(i+1)*faceH,j*faceW+1:(j+1)*faceW) = reshape(X(i*11+(j+1),:),[faceH,faceW]); 
 end
end
figure()
imagesc(Y);colormap(gray);
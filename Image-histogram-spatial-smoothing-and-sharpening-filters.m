clear all
close all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Question 1

A = imread('Unequalized_Hawkes_Bay_NZ.bmp');
I = rgb2gray(A);

figure(1)
imhist(I);
title('Histrogram of unequalized image.')

figure(2)
imshow(I);

J = histeq(I);
figure(3)
imhist(J);
title('Histrogram of equalized image.')

figure(4)
imshow(J);

threshold = mean(mean(I,2));

for i=1:size(I,1)
    for j=1:size(I,2)
        if I(i,j)<threshold
            Inew(i,j)=0;
        else
            Inew(i,j)=255;
        end
    end
end

figure(5);
imshow(Inew);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Question 2

k1 = 3;
k2 = k1+2;

B = imread('brain.gif');
K1 = medfilt2(B, [k1 k1]);
K2 = medfilt2(B, [k2 k2]);

h1 = fspecial('gaussian', [k1 k1]);
h2 = fspecial('gaussian', [k2 k2]);

F1 =imfilter(B,h1);
F2 =imfilter(B,h2);

figure(6)
subplot(2,2,1)
imshow(K1)
title('Median Filter of size [k1 k1].')

subplot(2,2,2)
imshow(K2)
title('Median Filter of size [k2 k2].')

subplot(2,2,3)
imshow(F1)
title('Gaussian Filter of size [k1 k1].')

subplot(2,2,4)
imshow(F2)
title('Gaussian Filter of size [k2 k2].')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Question 3

B = imread('brain.gif');
J = imnoise(B,'salt & pepper',0.02);

 figure(8)
 imshow(J)
% figure(8)
% imshow(K)

K3 = medfilt2(J, [k1 k1]);
K4 = medfilt2(J, [k2 k2]);
h3 = fspecial('average', [k1 k1]);
h4 = fspecial('average', [k2 k2]);
F3 =imfilter(J,h3);
F4 =imfilter(J,h4);

figure(7)
subplot(2,2,1)
imshow(K3)
title('Median Filter of size [k1 k1].')

subplot(2,2,2)
imshow(K4)
title('Median Filter of size [k2 k2].')

subplot(2,2,3)
imshow(F3)
title('Average Filter of size [k1 k1].')

subplot(2,2,4)
imshow(F4)
title('Average Filter of size [k2 k2].')

[x,y] = size(J);

mse1 = sqrt(sum(sum((double(B) - double(K3)) .^ 2))) / (x * y)
mse2 = sqrt(sum(sum((double(B) - double(K4)) .^ 2))) / (x * y)
mse3 = sqrt(sum(sum((double(B) - double(F3)) .^ 2))) / (x * y)
mse4 = sqrt(sum(sum((double(B) - double(F4)) .^ 2))) / (x * y)
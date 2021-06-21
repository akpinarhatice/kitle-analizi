
im = imread('C:\Users\akpin\Desktop\im.png');
figure(1), imshow(im);
%%
%Thresholding 
[R C]   = size(im);
for i = 1: R
    for j= 1: C
        if im(i,j) <=15 
            im(i,j)=0;
        end
    end
end
%%
figure(2), imshow(im);
%%
%CLAHE
I = adapthisteq(im, 'NumTiles',[8 8], 'ClipLimit',0.01);
figure(3), imshowpair(im, I, 'montage');
figure(4), imhist(im);
figure(5), imhist(I);

%%
%
[L,N] = superpixels(I,30);
BW = boundarymask(L);
figure(6), imshow(imoverlay(I,BW,'cyan'),'InitialMagnification',67);

%%
%Kenar Çıkarma
kenar = edge(BW, 'prewitt');
kenar2 = edge(BW, 'canny');
kenar3 = edge(BW, 'sobel');
figure(7),
%% 
subplot(2,2,1), imshow(kenar), title('prewitt');
subplot(2,2,2), imshow(kenar2);title('canny');
subplot(2,2,3), imshow(kenar3);title('sobel');




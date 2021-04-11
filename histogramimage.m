image = imread('cameraman.png');
subplot(2, 3, 1), imshow(image);
subplot(2, 3, 2), imhist(image);
equalizationimage = histeq(image);
subplot(2, 3, 3), imshow(equalizationimage);
subplot(2, 3, 4), imhist(equalizationimage);
[J, T] = histeq(image);
subplot(2, 3, 5), plot((0:255)/255,T);
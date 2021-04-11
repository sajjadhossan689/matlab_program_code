im1=imread('peppers_color.jpg');
figure;imshow(im1);title('color Image');
im2=rgb2gray(im1);
figure;imshow(im2);title('Gray Image');
imwrite(im2,'peppers_color1.jpg');
im3=im2bw(im2,0.5);
figure;imshow(im3);title('Binary Image');
imwrite(im3,'peppers_color2.jpg');
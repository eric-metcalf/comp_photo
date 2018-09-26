I = imread('data/rara.jpg');
I = (I + 255);
I(:,:,1) = 0;
imshow( I );
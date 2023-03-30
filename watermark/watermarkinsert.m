
img = imread('lena.jpg');

rand('seed',1999);

rn = randi([0,1],256);

a = 0.1; %°¡ÁßÄ¡ 

wmimg = (1-a)*img + a*rn;

figure(1)
imshow(wmimg);

imwrite(wmimg, 'wmlena.jpg');







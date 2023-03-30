img = imread('lena.jpg');

rn = randi([0,1],256);

for i = 1:8
  bimg(:,:,i) = bitand(img,2^(i-1)); 
  figure(i) 
  imshow(bimg(:,:,i).*(2^(9-i))-1);
end

img = bitand(img, 254);
rnimg = bitor(img, rn);

imwrite(rnimg, 'wmlena.bmp');




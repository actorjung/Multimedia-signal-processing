Imeage = imread("lena2.bmp"); 

filter = medfilt2(Imeage,[3 3]); % medianfilter적용하는 함수 사용 
 
imshow(filter);

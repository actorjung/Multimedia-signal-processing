Imeage = imread("lena2.bmp"); 

filter = medfilt2(Imeage,[3 3]); % medianfilter�����ϴ� �Լ� ��� 
 
imshow(filter);

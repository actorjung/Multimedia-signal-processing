I = imread("lena2.bmp");

I=uint16(I);

G_filter = [1,4,7,4,1;4,16,26,16,4;7,26,41,26,7;4,16,26,16,4;1,4,7,4,1]; %가우시안 필터 생성


filterImeage = uint16((conv2(G_filter,I,'full'))/273); %가우시안 필터와 이미지 컨벌루션 후 273으로 나누기

filterImeage = uint8(filterImeage);

imshow(filterImeage);
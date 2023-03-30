i = imread("lena2.bmp"); %이미지 불러들임

i =uint16(i); %255이상의 값을 계산하기 위해 자료형 변환 

filter =uint16(ones(3,3)); %3X3필터 생성

[m,n] = size(filter); 

filterImeage = conv2(filter,i,'full')/(m*n); %필터와 이미지를 컨벌루션 진행한후 크기로 나눈다

filterImeage = uint8(filterImeage); %다시 이미지의 픽셀값 범위를 255이하로 낮춰줌

imshow(filterImeage);





















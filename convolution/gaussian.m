I = imread("lena2.bmp");

I=uint16(I);

G_filter = [1,4,7,4,1;4,16,26,16,4;7,26,41,26,7;4,16,26,16,4;1,4,7,4,1]; %����þ� ���� ����


filterImeage = uint16((conv2(G_filter,I,'full'))/273); %����þ� ���Ϳ� �̹��� ������� �� 273���� ������

filterImeage = uint8(filterImeage);

imshow(filterImeage);
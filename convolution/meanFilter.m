i = imread("lena2.bmp"); %�̹��� �ҷ�����

i =uint16(i); %255�̻��� ���� ����ϱ� ���� �ڷ��� ��ȯ 

filter =uint16(ones(3,3)); %3X3���� ����

[m,n] = size(filter); 

filterImeage = conv2(filter,i,'full')/(m*n); %���Ϳ� �̹����� ������� �������� ũ��� ������

filterImeage = uint8(filterImeage); %�ٽ� �̹����� �ȼ��� ������ 255���Ϸ� ������

imshow(filterImeage);





















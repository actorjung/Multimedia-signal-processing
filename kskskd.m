img = imread("lena2.bmp");

[m,n] = size(img); 

T = 80; %�Ӱ谪

sigma = 1.0; %�ñ׸��� 

M = int8((6.0*sigma)+1) %����þ� ������ ũ�� 

gaussian_filter = fspecial("gaussian",[M,M],sigma); %����þ� ���� ����

sobel_filter_x = [-1,0,1;-2,0,2;-1,0,1]; %�Һ������� x����

sobel_filter_y = [-1,-2,-1;0,0,0;1,2,1]; %�Һ������� y����

filter_gaussian_x = conv2(sobel_filter_x,gaussian_filter,'full'); %����þ� ���͸� �Һ� ���Ϳ� x���� ������� ���� (�̺�)

filter_gaussian_y = conv2(sobel_filter_y,gaussian_filter,'full'); %����þ� ���͸� �Һ� ���Ϳ� y���� ������� ���� (�̺�)

filter_imeage_x = conv2(filter_gaussian_x,img,'full'); %�̺е� ����þ� ���Ϳ� �̹��� x���� ������� ����

filter_imeage_y = conv2(filter_gaussian_y,img,'full'); %�̺е� ����þ� ���Ϳ� �̹��� y���� ������� ����

filter_imeage = abs(filter_imeage_x) + abs(filter_imeage_y); %��������

for i = 1:m*n                   %����ȭ ����
  if filter_imeage(i) <= T,
     filter_imeage(i) = 0;
  else 
     filter_imeage(i) = 255;
  end
end

filter_imeage = uint8(filter_imeage);

imshow(filter_imeage);


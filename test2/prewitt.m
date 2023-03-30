img = imread("lena2.bmp");

[m,n] = size(img); 

T = 80; %�Ӱ谪

prewitt_filter_x = [-1,0,1;-1,0,1;-1,0,1]; %������ x����

prewitt_filter_y = [-1,-1,-1;0,0,0;1,1,1];  %������ y����

filter_imeage_x = conv2(prewitt_filter_x,img,"full"); %���Ϳ� �̹��� x���� �������

filter_imeage_y = conv2(prewitt_filter_y,img,"full"); %���Ϳ� �̹��� y���� �������

filter_imeage = sqrt((filter_imeage_x).^2 + (filter_imeage_y).^2); %���� ����

for i = 1:m*n                 %����ȭ ����
  if filter_imeage(i) <= T,
     filter_imeage(i) = 0;
  else 
     filter_imeage(i) = 255;
  end
end

filter_imeage = uint8(filter_imeage); 

imshow(filter_imeage);






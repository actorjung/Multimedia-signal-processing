
i = imread("len.jpg"); %����i�� �̹��� ����%
T = 150;% ��谪
i_image = zeros(256,256); %����ȭ�� �̹��� ���� ��� ����

for k = 1:255*255
  if i(k) <= T,
     i_image(k) = 0;
  else 
     i_image(k) = 255;
  end
end

imshow(i);





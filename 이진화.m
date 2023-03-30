
i = imread("len.jpg"); %변수i에 이미지 저장%
T = 150;% 경계값
i_image = zeros(256,256); %이진화된 이미지 저장 행렬 만듬

for k = 1:255*255
  if i(k) <= T,
     i_image(k) = 0;
  else 
     i_image(k) = 255;
  end
end

imshow(i);





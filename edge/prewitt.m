img = imread("lena2.bmp");

[m,n] = size(img); 

T = 80; %임계값

prewitt_filter_x = [-1,0,1;-1,0,1;-1,0,1]; %필터의 x성분

prewitt_filter_y = [-1,-1,-1;0,0,0;1,1,1];  %필터의 y성분

filter_imeage_x = conv2(prewitt_filter_x,img,"full"); %필터와 이미지 x방향 컨벌루션

filter_imeage_y = conv2(prewitt_filter_y,img,"full"); %필터와 이미지 y방향 컨벌루션

filter_imeage = sqrt((filter_imeage_x).^2 + (filter_imeage_y).^2); %엣지 검출

for i = 1:m*n                 %이진화 진행
  if filter_imeage(i) <= T,
     filter_imeage(i) = 0;
  else 
     filter_imeage(i) = 255;
  end
end

filter_imeage = uint8(filter_imeage); 

imshow(filter_imeage);






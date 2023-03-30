img = imread("lena2.bmp");

[m,n] = size(img); 

T = 80; %임계값

sigma = 1.0; %시그마값 

M = int8((6.0*sigma)+1) %가우시안 필터의 크기 

gaussian_filter = fspecial("gaussian",[M,M],sigma); %가우시안 필터 생성

sobel_filter_x = [-1,0,1;-2,0,2;-1,0,1]; %소벨필터의 x성분

sobel_filter_y = [-1,-2,-1;0,0,0;1,2,1]; %소벨필터의 y성분

filter_gaussian_x = conv2(sobel_filter_x,gaussian_filter,'full'); %가우시안 필터를 소벨 필터와 x방향 컨벌루션 진행 (미분)

filter_gaussian_y = conv2(sobel_filter_y,gaussian_filter,'full'); %가우시안 필터를 소벨 필터와 y방향 컨벌루션 진행 (미분)

filter_imeage_x = conv2(filter_gaussian_x,img,'full'); %미분된 가우시안 필터와 이미지 x방향 컨벌루션 진행

filter_imeage_y = conv2(filter_gaussian_y,img,'full'); %미분된 가우시안 필터와 이미지 y방향 컨벌루션 진행

filter_imeage = abs(filter_imeage_x) + abs(filter_imeage_y); %에지검출

for i = 1:m*n                   %이진화 진행
  if filter_imeage(i) <= T,
     filter_imeage(i) = 0;
  else 
     filter_imeage(i) = 255;
  end
end

filter_imeage = uint8(filter_imeage);

imshow(filter_imeage);


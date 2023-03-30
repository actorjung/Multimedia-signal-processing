img = imread("lena2.bmp"); 

[m,n] = size(img); 

T = 1; %임계값

sigma = 0.5; %시그마값 

gaussian_filter = fspecial("gaussian",[3,3],sigma); %가우시안 필터 생성

laplacian_filter = [0,1,0;1,-4,1;0,1,0]; %라플라시안 필터 생성

gaussian_img = conv2(gaussian_filter,img,'full'); %이미지에 가우시안 필터링
 
laplacian_img = conv2(gaussian_img,laplacian_filter,'full'); %가우시안 필터링 적용한 이미지에 라플라시안 필터링 wjrdyd

zero_cros = zeros(518,518); %제로 크로싱 적용할 필터 생성

for i = 1:516                  %제로패딩 
  for j = 1:516
    zero_cros(i+1,j+1) = laplacian_img(i,j);
  end
end

for i = 2:517           %제로크로싱
  for j = 2:517
    
    l=0;         %카운트 초기화
    
    if zero_cros(i-1,j-1)*zero_cros(i+1,j+1) < 0,         %서로다른 부호 대각선 비교 
       ans1 = abs(zero_cros(i-1,j-1)) + abs(zero_cros(i+1,j+1)); %절댓값 취한후 더한값 저장
        if ans1 > T,  %저장값이 임계값보다 크다면 
           l = l+1;   %카운트
        end
     end 
    if zero_cros(i,j-1)*zero_cros(i,j+1) < 0,      %서로다른 부호 양 옆 비교 
            ans2 = abs(zero_cros(i,j-1)) + abs(zero_cros(i,j+1));
             if ans2 > T,
               l = l+1; 
             end
    end      
    if zero_cros(i+1,j-1)*zero_cros(i-1,j+1) < 0,   %서로다른 부호 대각선 비교 
            ans3 = abs(zero_cros(i+1,j-1)) + abs(zero_cros(i-1,j+1));
            if ans3 > T,
               l = l+1; 
             end
    end       
    if zero_cros(i-1,j)*zero_cros(i+1,j) < 0,   %서로다른 부호 위아래 비교 
         ans4 = abs(zero_cros(i-1,j))+abs(zero_cros(i+1,j));
         if ans4 > T,
               l = l+1; 
             end
         
    end
    
    
    if l >= 2,    %카운트가 2가 넘으면 
       zero_cros(i,j) = 255;   %엣지판단

    end
  
  
  end
end

for i = 1:516         %제로패딩
  for j = 1:516
    zero_cros_img(i,j) = zero_cros(i+1,j+1);
  end
end

zero_cros_img = uint8(zero_cros_img); 

imshow(zero_cros_img);


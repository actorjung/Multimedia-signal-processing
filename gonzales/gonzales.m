i = imread("lena.jpg"); %행렬 i에 이미지 저장

i = uint32(i); %255값이 넘는 수를 계산하기 위해 자료형의 크기를 늘려줌

[m,n] = size(i); %이미지의 크기

A = 0.01; %정의된 오차값 

imax = max(max(i)); %i의 최대값
imin = min(min(i)); %i의 최소값

T = (imax+imin)/2; % 초기 경계값 

while 1
  
M = T; 
i_right = uint32(0); %계산을 하기위한 자료형 맞춰주기
i_left = uint32(0); %계산을 하기위한 자료형 맞춰주기

right_n = uint32(0); %계산을 하기위한 자료형 맞춰주기
left_n = uint32(0); %계산을 하기위한 자료형 맞춰주기

  for j = 1:m*n
      if i(j) >= M,
         i_right = i_right + i(j); %경계값보다 큰 값 누적합
         right_n = right_n+1; %경계값보다 큰 값 카운트
      else
         i_left = i_left + i(j); %경계값보다 작은 값 누적합
         left_n = left_n+1; %경계값보다 작은 값 카운트
      end  
  end
  
 mean_r = uint32(i_right/right_n); %경계값보다 큰 쪽의 평균값
 mean_l = uint32(i_left/left_n); %경계값보다 작은 쪽의 평균값
 
 T = uint32((mean_l+mean_r)/2) %새로운 경계값 저장 
 
   if (abs(M-T) < A) %경계값의 차이가 정해진 오차율 보다 작아지면 종료
     break
   end
end

for j = 1:m*n % 구한 경계값으로 이진화 진행
  if i(j) < T,
     i(j) = 0;
  else 
     i(j) = 255;
  end
end

i = uint8(i); %다시 자료형을 8비트로 맞춰줌
imshow(i); %이진화된 이미지 보여주기


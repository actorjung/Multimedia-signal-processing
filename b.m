i = imread("len.jpg"); %행렬 i에 이미지 저장

[m,n] = size(i); %이미지의 크기 

i_image = zeros(m,n); %이진화된 이미지 저장위한 행렬 선언

A = 0.5; %정의된 오차값 
a = 100; %
imax = int32(max(max(i))); %i의 최대값
imin = int32(min(min(i))); %i의 최소값

T = (imax+imin)/2 % 경계값

p = 1;  %총 몇번 했는지 카운트
k = 0;  %for문에서 사용할 변수 초기화
l = 0;  %for문에서 사용할 변수 초기화
e = 0; 

i_left = zeros(m,n); %이진화된 좌측행렬 저장
i_right = zeros(m,n); %이진화된 우측행렬 저장

while a >= A % 
  for j = 1:m*n 
    if i(j) >= T,
       i_right(j) = i(j);
       k = k+1; %이진화된 우측행렬 개수 세기위해서 카운트
    else 
       i_left(j) = i(j);
       l = l+1; %이진화된 좌측행렬 개수 세기위해서 카운트
    end  
  end
  
 sr = sum(sum(i_right));%임계값보다 큰 값으로 저장된 값을 다 더함
 mr = sr/k; %저장된 갯수만큼 나눔
 sl = sum(sum(i_left));%임계값보다 작은 값 저장된 값을 다 더함
 ml = sl/l; %저장된 갯수만큼 나눔
 M = (ml+mr)/2 %새로운 경계값 저장 
 
 k = 0; %for문에서 사용할 변수 초기화
 l = 0;%for문에서 사용할 변수 초기화
 
 E = abs(T-M); %(초기임계값-새로운경계값)을 E에 저장
 T = M; %새로운경계값을 초기임계값으로 바꿈
 a = abs(E-e) %오차율을 a값에 저장
 e = E; %새로운(초기임계값-새로운경계값)을 초기기(초기임계값-새로운경계값)으로 바꿈
 p = p+1;%횟수 카운트 

end

i_image = i_right + i_image;

for q = 1:m*n
  if i_image(q) <= T,
     i_image(q) = 0;
  else 
     i_image(q) = 255;
  end
end

imshow(i_image);




























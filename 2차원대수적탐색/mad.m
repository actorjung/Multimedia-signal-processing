function [ index_x , index_y ] = mad(x,y,p,idx,idy) 
  
img1 = imread("frame2.jpg"); %이전이미지
img2 = imread("frame1.jpg"); %현재이미지

n =16; %매크로블럭의 사이즈

p_img1 = zeros(144,208); %매크로 블럭 크기인 16으로 나누었을때 딱 떨어지게 하기위한 배열 선언 
p_img2 = zeros(176,240); %매크로블럭 처리를 위한 제로패딩 배열 선언

for i = 1 : 142   %이전 이미지 저장
  for j = 1 : 208
    p_img1(i,j) = img1(i,j);
  end
end

for i = 1 : 142 %현재 이미지 저장
  for j = 1 : 208
    p_img2(i+16,j+16) = img2(i,j);
  end
end 

A = [0 0 0 0 0 0 0 0 0]; %MAD값 저장을 위한 배열 저장

MAD1 = zeros(n,n); %MAD값 계산을 위한 배열 저장
MAD2 = zeros(n,n);
MAD3 = zeros(n,n);
MAD4 = zeros(n,n);
MAD5 = zeros(n,n);
MAD6 = zeros(n,n);
MAD7 = zeros(n,n);
MAD8 = zeros(n,n);
MAD9 = zeros(n,n);

   
for i = 1 : 16   %매드값 계산
 for j = 1 : 16
      MAD1(i,j) = (abs(p_img1(i+16*(idx-1),j+16*(idy-1)) - p_img2(i+16+16*(idx-1)-p+x,j+16+16*(idy-1)-p+y))); %왼쪽위 영역값
      MAD2(i,j) = (abs(p_img1(i+16*(idx-1),j+16*(idy-1)) - p_img2(i+16+16*(idx-1)+x,j+16+16*(idy-1)-p+y))); %위 영역값
      MAD3(i,j) = (abs(p_img1(i+16*(idx-1),j+16*(idy-1)) - p_img2(i+16+16*(idx-1)+p+x,j+16+16*(idy-1)-p+y))); %오른쪽위 영역값
      MAD4(i,j) = (abs(p_img1(i+16*(idx-1),j+16*(idy-1)) - p_img2(i+16+16*(idx-1)-p+x,j+16+16*(idy-1)+y))); %왼쪽 영역값  
      MAD5(i,j) = (abs(p_img1(i+16*(idx-1),j+16*(idy-1)) - p_img2(i+16+16*(idx-1)+x,j+16+16*(idy-1)+y))); %가운데 영역값
      MAD6(i,j) = (abs(p_img1(i+16*(idx-1),j+16*(idy-1)) - p_img2(i+16+16*(idx-1)+p+x,j+16+16*(idy-1)+y))); %오른쪽 영역값
      MAD7(i,j) = (abs(p_img1(i+16*(idx-1),j+16*(idy-1)) - p_img2(i+16+16*(idx-1)-p+x,j+16+16*(idy-1)+p+y))); %왼쪽아래 영역값
      MAD8(i,j) = (abs(p_img1(i+16*(idx-1),j+16*(idy-1)) - p_img2(i+16+16*(idx-1)+x,j+16+16*(idy-1)+p+y))); %아래 영역값
      MAD9(i,j) = (abs(p_img1(i+16*(idx-1),j+16*(idy-1)) - p_img2(i+16+16*(idx-1)+p+x,j+16+16*(idy-1)+p+y))); %오른쪽아래 영역값
 end
end

A(1) = sum(sum(MAD1))/(n*n); %매드값 계산
A(2) = sum(sum(MAD2))/(n*n);
A(3) = sum(sum(MAD3))/(n*n);   
A(4) = sum(sum(MAD4))/(n*n);
A(5) = sum(sum(MAD5))/(n*n);
A(6) = sum(sum(MAD6))/(n*n);
A(7) = sum(sum(MAD7))/(n*n);
A(8) = sum(sum(MAD8))/(n*n);
A(9) = sum(sum(MAD9))/(n*n);

Min = min(A); %최소 매드값 찾기 

if Min == A(1) %최소 매드값의 인덱스 저장을 위한 조건문 
index_x = x-p;
index_y = y-p;
end

if Min == A(2)
index_x = x;
index_y = y-p;
end

if Min == A(3)
index_x = x+p;
index_y = y-p;
end

if Min == A(4)
index_x = x-p;
index_y = y;
end

if Min == A(5)
index_x = x;
index_y = y;
end

if Min == A(6)
index_x = x+p;
index_y = y;
end

if Min == A(7)
index_x = x-p;
index_y = y+p;
end

if Min == A(8)
index_x = x;
index_y = y+p;
end

if Min == A(9)
index_x = x+p;
index_y = y+p;
end




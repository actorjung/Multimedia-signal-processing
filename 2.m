img1 = imread("frame1.jpg");
img2 = imread("frame2.jpg");

[M,N] = size(img1); 

p =15;
n =16;

block = zeros(n,n); %16x16크기 매크로 블럭

MAD1 = zeros(n,n);
MAD2 = zeros(n,n);
MAD3 = zeros(n,n);
MAD4 = zeros(n,n);
MAD5 = zeros(n,n);
MAD6 = zeros(n,n);
MAD7 = zeros(n,n);
MAD8 = zeros(n,n);
MAD9 = zeros(n,n);

A = [0 0 0 0 0 0 0 0 0];

index1 = (M/2-8); %초기픽셀값 인덱스 지정
index2 = (N/2-8); 

for i= 1 : 16
  for j = 1 : 16
    block(i,j) = img1(index1+i,index2+j); %1번이미지프레임 매크로 블럭에 저장
  end
end

for i= 1 : 16     
    for j = 1 : 16
      MAD1(i,j) = (abs(block(i,j) - img2(index1+i-p,index2+j-p))); %왼쪽위 영역값
      MAD2(i,j) = (abs(block(i,j) - img2(index1+i,index2+j-p))); %위 영역값
      MAD3(i,j) = (abs(block(i,j) - img2(index1+i+p,index2+j-p))); %오른쪽위 영역값
      MAD4(i,j) = (abs(block(i,j) - img2(index1+i-p,index2+j))); %왼쪽 영역값  o 
      MAD5(i,j) = (abs(block(i,j) - img2(index1+i,index2+j))); %가운데 영역값
      MAD6(i,j) = (abs(block(i,j) - img2(index1+i+p,index2+j))); %오른쪽 영역값
      MAD7(i,j) = (abs(block(i,j) - img2(index1+i-p,index2+j+p))); %왼쪽아래 영역값
      MAD8(i,j) = (abs(block(i,j) - img2(index1+i,index2+j+p))); %아래 영역값
      MAD9(i,j) = (abs(block(i,j) - img2(index1+i+p,index2+j+p))); %오른쪽아래 영역값
  end
end

A(1) = sum(sum(MAD1))/(n*n);
A(2) = sum(sum(MAD2))/(n*n);
A(3) = sum(sum(MAD3))/(n*n);   
A(4) = sum(sum(MAD4))/(n*n);
A(5) = sum(sum(MAD5))/(n*n);
A(6) = sum(sum(MAD6))/(n*n);
A(7) = sum(sum(MAD7))/(n*n);
A(8) = sum(sum(MAD8))/(n*n);
A(9) = sum(sum(MAD9))/(n*n);

Min = min(A);

%p를 반으로 줄임 8
p=8;
for i= 1 : 16     
    for j = 1 : 16
      MAD1(i,j) = (abs(block(i,j) - img2(index1-15+i-p,index2+j-p))); %왼쪽위 영역값
      MAD2(i,j) = (abs(block(i,j) - img2(index1-15+i,index2+j-p))); %위 영역값
      MAD3(i,j) = (abs(block(i,j) - img2(index1-15+i+p,index2+j-p))); %오른쪽위 영역값
      MAD4(i,j) = (abs(block(i,j) - img2(index1-15+i-p,index2+j))); %왼쪽 영역값
      MAD5(i,j) = (abs(block(i,j) - img2(index1-15+i,index2+j))); %가운데 영역값   o 
      MAD6(i,j) = (abs(block(i,j) - img2(index1-15+i+p,index2+j))); %오른쪽 영역값
      MAD7(i,j) = (abs(block(i,j) - img2(index1-15+i-p,index2+j+p))); %왼쪽아래 영역값
      MAD8(i,j) = (abs(block(i,j) - img2(index1-15+i,index2+j+p))); %아래 영역값
      MAD9(i,j) = (abs(block(i,j) - img2(index1-15+i+p,index2+j+p))); %오른쪽아래 영역값
  end
end

A(1) = sum(sum(MAD1))/(n*n);
A(2) = sum(sum(MAD2))/(n*n);
A(3) = sum(sum(MAD3))/(n*n);   
A(4) = sum(sum(MAD4))/(n*n);
A(5) = sum(sum(MAD5))/(n*n);
A(6) = sum(sum(MAD6))/(n*n);
A(7) = sum(sum(MAD7))/(n*n);
A(8) = sum(sum(MAD8))/(n*n);
A(9) = sum(sum(MAD9))/(n*n);

Min = min(A);

%p를 반으로 줄임 4
p=4;
for i= 1 : 16     
    for j = 1 : 16
      MAD1(i,j) = (abs(block(i,j) - img2(index1-15+i-p,index2+j-p))); %왼쪽위 영역값
      MAD2(i,j) = (abs(block(i,j) - img2(index1-15+i,index2+j-p))); %위 영역값
      MAD3(i,j) = (abs(block(i,j) - img2(index1-15+i+p,index2+j-p))); %오른쪽위 영역값
      MAD4(i,j) = (abs(block(i,j) - img2(index1-15+i-p,index2+j))); %왼쪽 영역값
      MAD5(i,j) = (abs(block(i,j) - img2(index1-15+i,index2+j))); %가운데 영역값   o
      MAD6(i,j) = (abs(block(i,j) - img2(index1-15+i+p,index2+j))); %오른쪽 영역값
      MAD7(i,j) = (abs(block(i,j) - img2(index1-15+i-p,index2+j+p))); %왼쪽아래 영역값
      MAD8(i,j) = (abs(block(i,j) - img2(index1-15+i,index2+j+p))); %아래 영역값
      MAD9(i,j) = (abs(block(i,j) - img2(index1-15+i+p,index2+j+p))); %오른쪽아래 영역값
  end
end

A(1) = sum(sum(MAD1))/(n*n);
A(2) = sum(sum(MAD2))/(n*n);
A(3) = sum(sum(MAD3))/(n*n);   
A(4) = sum(sum(MAD4))/(n*n);
A(5) = sum(sum(MAD5))/(n*n);
A(6) = sum(sum(MAD6))/(n*n);
A(7) = sum(sum(MAD7))/(n*n);
A(8) = sum(sum(MAD8))/(n*n);
A(9) = sum(sum(MAD9))/(n*n);

Min = min(A);

%p를 반으로 줄임 2
p=2;
for i= 1 : 16     
    for j = 1 : 16
      MAD1(i,j) = (abs(block(i,j) - img2(index1-15+i-p,index2+j-p))); %왼쪽위 영역값
      MAD2(i,j) = (abs(block(i,j) - img2(index1-15+i,index2+j-p))); %위 영역값
      MAD3(i,j) = (abs(block(i,j) - img2(index1-15+i+p,index2+j-p))); %오른쪽위 영역값
      MAD4(i,j) = (abs(block(i,j) - img2(index1-15+i-p,index2+j))); %왼쪽 영역값
      MAD5(i,j) = (abs(block(i,j) - img2(index1-15+i,index2+j))); %가운데 영역값   
      MAD6(i,j) = (abs(block(i,j) - img2(index1-15+i+p,index2+j))); %오른쪽 영역값
      MAD7(i,j) = (abs(block(i,j) - img2(index1-15+i-p,index2+j+p))); %왼쪽아래 영역값
      MAD8(i,j) = (abs(block(i,j) - img2(index1-15+i,index2+j+p))); %아래 영역값 o
      MAD9(i,j) = (abs(block(i,j) - img2(index1-15+i+p,index2+j+p))); %오른쪽아래 영역값
  end
end

A(1) = sum(sum(MAD1))/(n*n);
A(2) = sum(sum(MAD2))/(n*n);
A(3) = sum(sum(MAD3))/(n*n);   
A(4) = sum(sum(MAD4))/(n*n);
A(5) = sum(sum(MAD5))/(n*n);
A(6) = sum(sum(MAD6))/(n*n);
A(7) = sum(sum(MAD7))/(n*n);
A(8) = sum(sum(MAD8))/(n*n);
A(9) = sum(sum(MAD9))/(n*n);

Min = min(A);

%p를 반으로 줄임 1
p=1;
for i= 1 : 16     
    for j = 1 : 16
      MAD1(i,j) = (abs(block(i,j) - img2(index1-15+i-p,index2+2+j-p))); %왼쪽위 영역값
      MAD2(i,j) = (abs(block(i,j) - img2(index1-15+i,index2+2+j-p))); %위 영역값 o
      MAD3(i,j) = (abs(block(i,j) - img2(index1-15+i+p,index2+2+j-p))); %오른쪽위 영역값
      MAD4(i,j) = (abs(block(i,j) - img2(index1-15+i-p,index2+2+j))); %왼쪽 영역값
      MAD5(i,j) = (abs(block(i,j) - img2(index1-15+i,index2+2+j))); %가운데 영역값   
      MAD6(i,j) = (abs(block(i,j) - img2(index1-15+i+p,index2+2+j))); %오른쪽 영역값
      MAD7(i,j) = (abs(block(i,j) - img2(index1-15+i-p,index2+2+j+p))); %왼쪽아래 영역값
      MAD8(i,j) = (abs(block(i,j) - img2(index1-15+i,index2+2+j+p))); %아래 영역값 o
      MAD9(i,j) = (abs(block(i,j) - img2(index1-15+i+p,index2+2+j+p))); %오른쪽아래 영역값
  end
end

A(1) = sum(sum(MAD1))/(n*n);
A(2) = sum(sum(MAD2))/(n*n);
A(3) = sum(sum(MAD3))/(n*n);   
A(4) = sum(sum(MAD4))/(n*n);
A(5) = sum(sum(MAD5))/(n*n);
A(6) = sum(sum(MAD6))/(n*n);
A(7) = sum(sum(MAD7))/(n*n);
A(8) = sum(sum(MAD8))/(n*n);
A(9) = sum(sum(MAD9))/(n*n);

Min = min(A);

%모션벡터
img2(index1-15,index2+2-1);




















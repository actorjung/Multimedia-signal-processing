function [ index_x , index_y ] = mad(x,y,p,idx,idy) 
  
img1 = imread("frame2.jpg"); %�����̹���
img2 = imread("frame1.jpg"); %�����̹���

n =16; %��ũ�κ��� ������

p_img1 = zeros(144,208); %��ũ�� �� ũ���� 16���� ���������� �� �������� �ϱ����� �迭 ���� 
p_img2 = zeros(176,240); %��ũ�κ� ó���� ���� �����е� �迭 ����

for i = 1 : 142   %���� �̹��� ����
  for j = 1 : 208
    p_img1(i,j) = img1(i,j);
  end
end

for i = 1 : 142 %���� �̹��� ����
  for j = 1 : 208
    p_img2(i+16,j+16) = img2(i,j);
  end
end 

A = [0 0 0 0 0 0 0 0 0]; %MAD�� ������ ���� �迭 ����

MAD1 = zeros(n,n); %MAD�� ����� ���� �迭 ����
MAD2 = zeros(n,n);
MAD3 = zeros(n,n);
MAD4 = zeros(n,n);
MAD5 = zeros(n,n);
MAD6 = zeros(n,n);
MAD7 = zeros(n,n);
MAD8 = zeros(n,n);
MAD9 = zeros(n,n);

   
for i = 1 : 16   %�ŵ尪 ���
 for j = 1 : 16
      MAD1(i,j) = (abs(p_img1(i+16*(idx-1),j+16*(idy-1)) - p_img2(i+16+16*(idx-1)-p+x,j+16+16*(idy-1)-p+y))); %������ ������
      MAD2(i,j) = (abs(p_img1(i+16*(idx-1),j+16*(idy-1)) - p_img2(i+16+16*(idx-1)+x,j+16+16*(idy-1)-p+y))); %�� ������
      MAD3(i,j) = (abs(p_img1(i+16*(idx-1),j+16*(idy-1)) - p_img2(i+16+16*(idx-1)+p+x,j+16+16*(idy-1)-p+y))); %�������� ������
      MAD4(i,j) = (abs(p_img1(i+16*(idx-1),j+16*(idy-1)) - p_img2(i+16+16*(idx-1)-p+x,j+16+16*(idy-1)+y))); %���� ������  
      MAD5(i,j) = (abs(p_img1(i+16*(idx-1),j+16*(idy-1)) - p_img2(i+16+16*(idx-1)+x,j+16+16*(idy-1)+y))); %��� ������
      MAD6(i,j) = (abs(p_img1(i+16*(idx-1),j+16*(idy-1)) - p_img2(i+16+16*(idx-1)+p+x,j+16+16*(idy-1)+y))); %������ ������
      MAD7(i,j) = (abs(p_img1(i+16*(idx-1),j+16*(idy-1)) - p_img2(i+16+16*(idx-1)-p+x,j+16+16*(idy-1)+p+y))); %���ʾƷ� ������
      MAD8(i,j) = (abs(p_img1(i+16*(idx-1),j+16*(idy-1)) - p_img2(i+16+16*(idx-1)+x,j+16+16*(idy-1)+p+y))); %�Ʒ� ������
      MAD9(i,j) = (abs(p_img1(i+16*(idx-1),j+16*(idy-1)) - p_img2(i+16+16*(idx-1)+p+x,j+16+16*(idy-1)+p+y))); %�����ʾƷ� ������
 end
end

A(1) = sum(sum(MAD1))/(n*n); %�ŵ尪 ���
A(2) = sum(sum(MAD2))/(n*n);
A(3) = sum(sum(MAD3))/(n*n);   
A(4) = sum(sum(MAD4))/(n*n);
A(5) = sum(sum(MAD5))/(n*n);
A(6) = sum(sum(MAD6))/(n*n);
A(7) = sum(sum(MAD7))/(n*n);
A(8) = sum(sum(MAD8))/(n*n);
A(9) = sum(sum(MAD9))/(n*n);

Min = min(A); %�ּ� �ŵ尪 ã�� 

if Min == A(1) %�ּ� �ŵ尪�� �ε��� ������ ���� ���ǹ� 
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




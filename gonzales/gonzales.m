i = imread("lena.jpg"); %��� i�� �̹��� ����

i = uint32(i); %255���� �Ѵ� ���� ����ϱ� ���� �ڷ����� ũ�⸦ �÷���

[m,n] = size(i); %�̹����� ũ��

A = 0.01; %���ǵ� ������ 

imax = max(max(i)); %i�� �ִ밪
imin = min(min(i)); %i�� �ּҰ�

T = (imax+imin)/2; % �ʱ� ��谪 

while 1
  
M = T; 
i_right = uint32(0); %����� �ϱ����� �ڷ��� �����ֱ�
i_left = uint32(0); %����� �ϱ����� �ڷ��� �����ֱ�

right_n = uint32(0); %����� �ϱ����� �ڷ��� �����ֱ�
left_n = uint32(0); %����� �ϱ����� �ڷ��� �����ֱ�

  for j = 1:m*n
      if i(j) >= M,
         i_right = i_right + i(j); %��谪���� ū �� ������
         right_n = right_n+1; %��谪���� ū �� ī��Ʈ
      else
         i_left = i_left + i(j); %��谪���� ���� �� ������
         left_n = left_n+1; %��谪���� ���� �� ī��Ʈ
      end  
  end
  
 mean_r = uint32(i_right/right_n); %��谪���� ū ���� ��հ�
 mean_l = uint32(i_left/left_n); %��谪���� ���� ���� ��հ�
 
 T = uint32((mean_l+mean_r)/2) %���ο� ��谪 ���� 
 
   if (abs(M-T) < A) %��谪�� ���̰� ������ ������ ���� �۾����� ����
     break
   end
end

for j = 1:m*n % ���� ��谪���� ����ȭ ����
  if i(j) < T,
     i(j) = 0;
  else 
     i(j) = 255;
  end
end

i = uint8(i); %�ٽ� �ڷ����� 8��Ʈ�� ������
imshow(i); %����ȭ�� �̹��� �����ֱ�


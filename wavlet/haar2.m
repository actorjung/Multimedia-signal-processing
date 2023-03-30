img = imread("lena2.bmp"); 

H0 = zeros(512,256); %LPF �̹��� ����
H1 = zeros(512,256); %HPF �̹��� ����


Y1 = zeros(256,256); %LPFLPF �̹��� ����
Y2 = zeros(256,256); %LPFHPF �̹��� ����
Y3 = zeros(256,256); %HPFLPF �̹��� ����
Y4 = zeros(256,256); %HPFHPF �̹��� ����

Z = zeros(512,512); % �����̹��� ����

i_img = zeros(512,512); %���������� �ٲٱ� ���� ���� 

for i = 1 : 512   %������ ���� ��Ʈ�� �̹����� ������ �̹����� �ٲ�
  for j = 1 : 512
    i_img(i,j) = img(i,j);
  end
end

for i =  1 : 512    %LPF����
  for j = 1 : 256
     H0(i,j) = (i_img(i,(2*j)-1) + i_img(i,2*j))/2;
  end
end

for i =  1 : 512      %HPF����
  for j = 1 : 256
     H1(i,j) = (i_img(i,(2*j)-1) - i_img(i,2*j))/2 ;
  end
end

for i =  1 : 256     %LPFLPF����
  for j = 1 : 256
     Y1(i,j) = (H0(2*i-1,j) + H0(2*i,j))/2;
  end
end

for i =  1 : 256     %LPFHPF����
  for j = 1 : 256
     Y2(i,j) = (H0(2*i-1,j) - H0(2*i,j))/2;
  end
end

                  
for i =  1 : 256  %HPFLPF����
  for j = 1 : 256
     Y3(i,j) = (H1(2*i-1,j) + H1(2*i,j))/2;
  end
end

for i =  1 : 256     %HPFHPF����
  for j = 1 : 256
     Y4(i,j) = (H1(2*i-1,j) - H1(2*i,j))/2;
  end
end

for i = 1: 256
  for j = 1 : 256
   Z(i,j) = Y1(i,j)/255; %LL
   Z(i+256,j) = Y2(i,j); %LH
   Z(i,j+256) = Y3(i,j); %HL
   Z(i+256,j+256) = Y4(i,j); %HH
 end
end

imshow(Z);

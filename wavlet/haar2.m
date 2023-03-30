img = imread("lena2.bmp"); 

H0 = zeros(512,256); %LPF 이미지 저장
H1 = zeros(512,256); %HPF 이미지 저장


Y1 = zeros(256,256); %LPFLPF 이미지 저장
Y2 = zeros(256,256); %LPFHPF 이미지 저장
Y3 = zeros(256,256); %HPFLPF 이미지 저장
Y4 = zeros(256,256); %HPFHPF 이미지 저장

Z = zeros(512,512); % 최종이미지 저장

i_img = zeros(512,512); %더블형으로 바꾸기 위해 선언 

for i = 1 : 512   %연산을 위해 인트형 이미지를 더블형 이미지로 바꿈
  for j = 1 : 512
    i_img(i,j) = img(i,j);
  end
end

for i =  1 : 512    %LPF연산
  for j = 1 : 256
     H0(i,j) = (i_img(i,(2*j)-1) + i_img(i,2*j))/2;
  end
end

for i =  1 : 512      %HPF연산
  for j = 1 : 256
     H1(i,j) = (i_img(i,(2*j)-1) - i_img(i,2*j))/2 ;
  end
end

for i =  1 : 256     %LPFLPF연산
  for j = 1 : 256
     Y1(i,j) = (H0(2*i-1,j) + H0(2*i,j))/2;
  end
end

for i =  1 : 256     %LPFHPF연산
  for j = 1 : 256
     Y2(i,j) = (H0(2*i-1,j) - H0(2*i,j))/2;
  end
end

                  
for i =  1 : 256  %HPFLPF연산
  for j = 1 : 256
     Y3(i,j) = (H1(2*i-1,j) + H1(2*i,j))/2;
  end
end

for i =  1 : 256     %HPFHPF연산
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

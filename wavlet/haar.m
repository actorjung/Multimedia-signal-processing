img = imread("lena2.bmp");  %%1차원 하아 웨이블릿 변환으로 18페이지 보고 하세요

LPF = ones(3,3); 

T = 117;

sobel_filter_x = [-1,0,1;-2,0,2;-1,0,1]; 
sobel_filter_y = [-1,-2,-1;0,0,0;1,2,1]; 

[mL,nL] = size(LPF);


H0 = zeros(512,256);
H1 = zeros(512,256);

Y1 = zeros(256,256); 
Y2 = zeros(256,256); 
Y3 = zeros(256,256); 
Y4 = zeros(256,256); 

Z = zeros(512,512);

LPFImg = conv2(LPF,img)/(mL*nL);  %23-39 LPF

for i = 1 : 512               
  for j = 1 : 256
    H0(i,j) = LPFImg(i,j*2); 
  end
 end 
 
%  H0 = H0.*0.707;

LPFLPFImg = conv2(LPF,H0)/(mL*nL);   %31-37 LPFLPF

for i = 1 : 256                   
  for j = 1 : 256
    Y1(i,j) = LPFLPFImg(2*i,j); 
  end
end 

filter_imeage_x = conv2(sobel_filter_x,H0,'full');  %40-58 LPFHPF
filter_imeage_y = conv2(sobel_filter_y,H0,'full'); 
LPFHPFImg = sqrt((filter_imeage_x).^2 + (filter_imeage_y).^2); 

for i = 1:512*256
  if LPFHPFImg(i) <= T,   
     LPFHPFImg(i) = 0;
  else 
     LPFHPFImg(i) = 255;
  end
end


for i = 1 : 256                       
  for j = 1 : 256
    Y2(i,j) = LPFHPFImg(2*i,j); 
  end
end 

filter_imeage_x = conv2(sobel_filter_x,img,'full');  %64-80 HPF
filter_imeage_y = conv2(sobel_filter_y,img,'full'); 
HPFImg = sqrt((filter_imeage_x).^2 + (filter_imeage_y).^2); 

for i = 1:512*512
  if HPFImg(i) <= T, 
     HPFImg(i) = 0;
  else 
     HPFImg(i) = 255;
  end
end

for i = 1 : 512                       
  for j = 1 : 256
    H1(i,j) = HPFImg(i,2*j); 
  end
end 



HPFLPFImg = conv2(LPF,H1)/(mL*nL);   %82-88 HPFLPF

for i = 1 : 256                   
  for j = 1 : 256
    Y3(i,j) = HPFLPFImg(2*i,j); 
  end
end 


filter_imeage_x = conv2(sobel_filter_x,H1,'full');  %93-109 HPFHPF
filter_imeage_y = conv2(sobel_filter_y,H1,'full'); 
HPFHPFImg = sqrt((filter_imeage_x).^2 + (filter_imeage_y).^2); 

for i = 1:512*256
  if HPFHPFImg(i) <= T,   
     HPFHPFImg(i) = 0;
  else 
     HPFHPFImg(i) = 255;
  end
end

for i = 1 : 256                      
  for j = 1 : 256
    Y4(i,j) = HPFHPFImg(2*i,j); 
  end
end 

for i = 1: 256
  for j = 1 : 256
   Z(i,j) = Y1(i,j); %LL
   Z(i+256,j) = Y2(i,j); %LH
   Z(i,j+256) = Y3(i,j); %HL
   Z(i+256,j+256) = Y4(i,j); %HH
 end
end

Z = uint8(Z);
imshow(Z);







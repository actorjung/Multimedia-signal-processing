img = imread("lena2.bmp");

[M,N] = size(img);

A = zeros(8,8);
B = zeros(8,8);
C = zeros(8,8);

D = zeros(8,8);
E = zeros(8,8);
F = zeros(8,8);

K = 2;   %양자화 계수

F_dct = zeros(512,512);
F_idct = zeros(512,512);

m = 0 ;
n = 0 ;

Q_mask = [10 10 15 20 25 30 35  40   %양자화 테이블
          10 15 20 25 30 35 40  50
          15 20 25 30 35 40 50  60
          20 25 30 35 40 50 60  70
          25 30 35 40 50 60 70  80
          30 35 40 50 60 70 80  90
          35 40 50 60 70 80 90  100
          40 50 60 70 80 90 100 110];


for k = 1 : 64       %양자화와 DCT변환하기 위한 구문 23-51번 라인
 for l = 1 : 64
 
  for i = 1+8*(k-1) : 8*k   %이미지를 8X8행렬에 넣기
   for j = 1+8*(l-1) : 8*l
     A(i-8*m,j-8*n) = img(i,j);
   end
 end


B = dct2(A); %DCT변환

C = B./Q_mask; %양자화
C = int8(C);

D = C;

E = D.*Q_mask; %역양자화 

F = idct2(D); %IDCT변환

 
 for i= 1+8*(k-1) : 8*k     %*8X8행렬에 넣은값을 F라는 512X512행렬에 넣기               
  for j= 1+8*(l-1) : 8*l                       
    F_dct(i,j) = F(i-8*m,j-8*n);
  end
 end
  
   n = n+1;
   
 end
  
   n = 0 ;   %n초기화
   m = m+1;  

end
 
 F_dct = uint8(F_dct);
 
 figure(1);
 imshow(F_dct);
 figure(2);
 imshow(img);

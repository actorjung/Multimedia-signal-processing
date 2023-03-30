img = imread("lena2.bmp");

[M,N] = size(img);

A = zeros(8,8);
B = zeros(8,8);
C = zeros(8,8);

D = zeros(8,8);
E = zeros(8,8);
F = zeros(8,8);

K = 2;   %����ȭ ���

F_dct = zeros(512,512);
F_idct = zeros(512,512);

m = 0 ;
n = 0 ;

Q_mask = [10 10 15 20 25 30 35  40   %����ȭ ���̺�
          10 15 20 25 30 35 40  50
          15 20 25 30 35 40 50  60
          20 25 30 35 40 50 60  70
          25 30 35 40 50 60 70  80
          30 35 40 50 60 70 80  90
          35 40 50 60 70 80 90  100
          40 50 60 70 80 90 100 110];


for k = 1 : 64       %����ȭ�� DCT��ȯ�ϱ� ���� ���� 23-51�� ����
 for l = 1 : 64
 
  for i = 1+8*(k-1) : 8*k   %�̹����� 8X8��Ŀ� �ֱ�
   for j = 1+8*(l-1) : 8*l
     A(i-8*m,j-8*n) = img(i,j);
   end
 end


B = dct2(A); %DCT��ȯ

C = B./Q_mask; %����ȭ
C = int8(C);

D = C;

E = D.*Q_mask; %������ȭ 

F = idct2(D); %IDCT��ȯ

 
 for i= 1+8*(k-1) : 8*k     %*8X8��Ŀ� �������� F��� 512X512��Ŀ� �ֱ�               
  for j= 1+8*(l-1) : 8*l                       
    F_dct(i,j) = F(i-8*m,j-8*n);
  end
 end
  
   n = n+1;
   
 end
  
   n = 0 ;   %n�ʱ�ȭ
   m = m+1;  

end
 
 F_dct = uint8(F_dct);
 
 figure(1);
 imshow(F_dct);
 figure(2);
 imshow(img);

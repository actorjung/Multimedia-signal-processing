img = imread("lena2.bmp");

[M,N] = size(img);

A = zeros(8,8);
B = zeros(8,8);
C = zeros(8,8);

D = zeros(8,8);
E = zeros(8,8);
F = zeros(8,8);

K = 0.5;   %����ȭ ��� 1�� 0.5 1.5�� ���ؼ� �ֱ�

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
          40 50 60 70 80 90 100 110]*K;

for k = 1 : 64       %����ȭ�� DCT��ȯ�ϱ� ���� ���� 23-51�� ����
 for l = 1 : 64
 
  for i = 1+8*(k-1) : 8*k   %�̹����� 8X8��Ŀ� �ֱ�
   for j = 1+8*(l-1) : 8*l
     A(i-8*m,j-8*n) = img(i,j);
   end
 end


B = dct2(A); %DCT��ȯ

C = round(B./Q_mask); %����ȭ

 
 for i= 1+8*(k-1) : 8*k     %*8X8��Ŀ� �������� F��� 512X512��Ŀ� �ֱ�               
  for j= 1+8*(l-1) : 8*l                       
    F_dct(i,j) = C(i-8*m,j-8*n);
  end
 end
  
   n = n+1;
   
 end
  
   n = 0 ;   %n�ʱ�ȭ
   m = m+1;  

end

m = 0;    
n = 0;

for k = 1 : 64      %������ȭ�� DCT����ȯ �ϱ� ���� ���� 64-91�� ����
 for g = 1 : 64
 
  for i = 1+8*(k-1) : 8*k         %DCT�� �迭���� 8X8�迭�� �ֱ�
   for j = 1+8*(g-1) : 8*g
     D(i-8*m,j-8*n) = F_dct(i,j);
   end
 end

E = round(D.*Q_mask); %������ȭ

F = idct2(E); %IDCT��ȯ

 for i= 1+8*(k-1) : 8*k                        
  for j= 1+8*(g-1) : 8*g                       
    F_idct(i,j) = F(i-8*m,j-8*n);
  end
 end
  
   n = n+1;
   
 end
  
   n = 0 ;   %n�ʱ�ȭ
   m = m+1;  

 end
 
 F_idct = uint8(F_idct); 
 
 figure(1);      %IDCT�� �̹��� �����ֱ�
 imshow(F_idct);
 figure(2);      %�����̹��� �����ֱ�
 imshow(img);
 
 
 
 

 
 
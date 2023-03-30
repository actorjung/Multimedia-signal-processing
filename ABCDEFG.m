img = imread("lena2.bmp");

[M,N] = size(img);

a = zeros(8,8);

F = zeros(512,512);

m = 0;
g = 0;

for k = 1 : 64

 for i = 1+8*m : 8*k
  for j = 1+8*m : 8*k
    a(i-8*m,j-8*m) = img(i,j);
  end
end





B = dct2(a); %��ȯ

Q_mask = [10 10 15 20 25 30 35  40    %����ȭ ���̺�
          10 15 20 25 30 35 40  50
          15 20 25 30 35 40 50  60
          20 25 30 35 40 50 60  70
          25 30 35 40 50 60 70  80
          30 35 40 50 60 70 80  90
          35 40 50 60 70 80 90  100
          40 50 60 70 80 90 100 110];

C = B./Q_mask; %����ȭ
 
 for i= 1+8*m : 8*k                         12345678 
  for j= 1+8*m : 8*k                        
    F(i,j) = C(i-8*m,j-8*m);
  end
 end

   m = m+1;

end


%%%%%%%%%%%%%

%B = B.*Q_mask; %������ȭ

%C = idct2(B); %����ȯ 







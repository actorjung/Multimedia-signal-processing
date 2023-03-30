img = imread("lena2.bmp"); 

[m,n] = size(img); 

T = 1; %�Ӱ谪

sigma = 0.5; %�ñ׸��� 

gaussian_filter = fspecial("gaussian",[3,3],sigma); %����þ� ���� ����

laplacian_filter = [0,1,0;1,-4,1;0,1,0]; %���ö�þ� ���� ����

gaussian_img = conv2(gaussian_filter,img,'full'); %�̹����� ����þ� ���͸�
 
laplacian_img = conv2(gaussian_img,laplacian_filter,'full'); %����þ� ���͸� ������ �̹����� ���ö�þ� ���͸� wjrdyd

zero_cros = zeros(518,518); %���� ũ�ν� ������ ���� ����

for i = 1:516                  %�����е� 
  for j = 1:516
    zero_cros(i+1,j+1) = laplacian_img(i,j);
  end
end

for i = 2:517           %����ũ�ν�
  for j = 2:517
    
    l=0;         %ī��Ʈ �ʱ�ȭ
    
    if zero_cros(i-1,j-1)*zero_cros(i+1,j+1) < 0,         %���δٸ� ��ȣ �밢�� �� 
       ans1 = abs(zero_cros(i-1,j-1)) + abs(zero_cros(i+1,j+1)); %���� ������ ���Ѱ� ����
        if ans1 > T,  %���尪�� �Ӱ谪���� ũ�ٸ� 
           l = l+1;   %ī��Ʈ
        end
     end 
    if zero_cros(i,j-1)*zero_cros(i,j+1) < 0,      %���δٸ� ��ȣ �� �� �� 
            ans2 = abs(zero_cros(i,j-1)) + abs(zero_cros(i,j+1));
             if ans2 > T,
               l = l+1; 
             end
    end      
    if zero_cros(i+1,j-1)*zero_cros(i-1,j+1) < 0,   %���δٸ� ��ȣ �밢�� �� 
            ans3 = abs(zero_cros(i+1,j-1)) + abs(zero_cros(i-1,j+1));
            if ans3 > T,
               l = l+1; 
             end
    end       
    if zero_cros(i-1,j)*zero_cros(i+1,j) < 0,   %���δٸ� ��ȣ ���Ʒ� �� 
         ans4 = abs(zero_cros(i-1,j))+abs(zero_cros(i+1,j));
         if ans4 > T,
               l = l+1; 
             end
         
    end
    
    
    if l >= 2,    %ī��Ʈ�� 2�� ������ 
       zero_cros(i,j) = 255;   %�����Ǵ�

    end
  
  
  end
end

for i = 1:516         %�����е�
  for j = 1:516
    zero_cros_img(i,j) = zero_cros(i+1,j+1);
  end
end

zero_cros_img = uint8(zero_cros_img); 

imshow(zero_cros_img);


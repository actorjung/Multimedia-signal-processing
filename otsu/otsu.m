img = imread('lena.jpg');

[M, N] = size(img);

hist = zeros(256, 1); 

for i = 1:M
  for j = 1:N
    hist(img(i, j)+1) = hist(img(i, j)+1) + 1; 
   end
end

hist = hist/(M*N); 

P1 = zeros(256, 1); 

for k = 1:256

    P1(k) = sum(hist(1:k)); 

end

P2 = 1 - P1; 

m = zeros(256, 1);

intensity = [0:255]'; 

for k = 1:256

    m(k) = sum(intensity(1:k).*hist(1:k)); 

end

m_G = m(256); 

squared_sigma_B = ((m_G*P1 - m).^2)./(P1.*P2);

[maximum k_opt] = max(squared_sigma_B) 

for q = 1:M*N            %¿Ã¡¯»≠
  if img(q) <= k_opt,  
     img(q) = 0;
  else 
     img(q) = 255;
  end
end

imshow(img); 

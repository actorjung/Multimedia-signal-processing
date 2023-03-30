img1 = imread("frame1.jpg");
img2 = imread("frame2.jpg");

n =16;

p_img1 = zeros(144,208);
p_img2 = zeros(176,240);

for i = 1 : 142
  for j = 208
    p_img1(i,j) = img1(i,j);
  end
end

for i = 1 : 142
  for j = 1 : 208
    p_img2(i+16,j+16) = img2(i,j);
  end
end 
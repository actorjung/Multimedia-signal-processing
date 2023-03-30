
img = imread('lena.jpg');

rand('seed',1999);

rn = randi([0,1],64); %시드값으로 랜덤넘버 생성
l=0;
a = 0.1; %가중치
for k =1:4      %랜덤넘버 16비트 삽입 
for l = 1:4
for i= 1 : 64
for j= 1 : 64

wmimg((64*(k-1))+i,(64*(l-1))+j) = (1-a)*img((64*(k-1))+i,(64*(l-1))+j) .+ a*rn(i,j);

end
end
end
end


figure(1)
imshow(wmimg);

imwrite(wmimg, 'wmlena.jpg');

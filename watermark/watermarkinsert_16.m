
img = imread('lena.jpg');

rand('seed',1999);

rn = randi([0,1],64); %�õ尪���� �����ѹ� ����
l=0;
a = 0.1; %����ġ
for k =1:4      %�����ѹ� 16��Ʈ ���� 
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

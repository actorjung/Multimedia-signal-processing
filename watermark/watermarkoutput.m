clear all;

img = imread('lena.jpg');
wmimg = imread('wmlena.jpg');

rand('seed',1999);
rn = randi([0,1],256);

%c = corr2(wmimg,rn);
%c = corrcoef(img,rn);

% for i = 1:256
%   for j = 1:256
%    buf(i,j) = corr(wmimg(i,j),rn(i,j));     
%   end
% end 

%���͸�ũ�� ���� �̹��� �ڸ����̼� 0.0004
%���͸�ũ�� �ִ� �̹��� �ڸ����̼� 0.0006



i=imread("len.jpg");
i=uint32(i);
maxi=uint32(max(max(i)));
mini=uint32(min(min(i)));
T=(maxi+mini)/2



while(1)
Told=T;
up=uint32(0);
low=uint32(0);
up_total=uint32(0);
low_total=uint32(0);
up_mean=uint32(0);
low_mean=uint32(0);
for j=1:256
  for k=1:256
    if(i(j,k)>Told)
    up(1,1)+=i(j,k);
    up_total(1,1)+=1;
  else
    low(1,1)+=i(j,k);
    low_total(1,1)+=1;
    end
  end
end
  up_mean=up/up_total;
  low_mean=low/low_total;
  T=(up_mean+low_mean)/2
  if(abs(Told-T)<0.3)
  break;
end 
end
for j=1:256
  for k=1:256
    if(i(j,k)>=T)
    i(j,k)=255;
  else
    i(j,k)=0;
  end
end
end

i=uint8(i);
imshow(i);
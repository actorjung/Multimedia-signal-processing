i = imread("lena.jpg"); 

i =uint16(i);
filter =uint16(ones(3,3));
a=uint16(zeros(258,258));

    
for q=1:256
  for w=1:256
     a(q+1,w+1) = i(q,w);
 end
end

for z=1:256
  for x=1:256
v=uint16(zeros(512,512));
    for l=x:x+2
      for p=z:z+2
      v(l,p)=a(l,p)*1;
      v=uint16(sum(sum(v)));
      b=v/9
      end
  end
      i(z,x)=b;
   end
end   
i=uint8(i);  
imshow(i);
      
 

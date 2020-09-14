function coef=coef_scan2d_inv(cf,routxy)

len=numel(cf);
coef=zeros(1,sqrt(len));
for n=1:len
   coef(routxy(1,n),routxy(2,n))=cf(n);
end

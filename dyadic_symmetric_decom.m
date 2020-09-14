function coef=dyadic_symmetric_decom(a,lev)

coef=zeros(size(a));

[x,y]=decm26(a);

len=size(a,1); len1=len/2; len2=len1/2; len3=len2/2; len4=len3/2; len5=len4/2;
coef(len1+1:len,:)=y;

[x,y]=decm26(x);
coef(len2+1:len1,:)=y;

[x,y]=decm26(x);
coef(len3+1:len2,:)=y;

[x,y]=decm26(x);
coef(len4+1:len3,:)=y;
coef(1:len4,:)=x;

%-----------------------------------------------
if lev>4
   [x,y]=decm26(x);
   coef(len5+1:len4,:)=y;
   coef(1:len5,:)=x;
end
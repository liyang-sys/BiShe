function a=LFP2nInv(coef,w,fL)

coef=double(coef);
N=size(coef);

a=LFP2subInv(coef,w,fL(:,1:N(2)));
a=a';
a=LFP2subInv(a,w,fL(:,1:N(1)));
a=a';

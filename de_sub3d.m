function [sub,ptr]=de_sub3d(bin,len,delta0,n,ptr)

[qctr,binq,ptr]=find_qctr(bin,ptr); %qctr,ptr
if binq(1)>0
   [qcfr,sn,ptr]=de_sub3d_sub2(bin,len,qctr,ptr); %ptr %%%%%%%%%%
   [sbr,ptrq]=rst_sub(binq,qcfr,delta0,1);
else
   sbr=zeros(1,len);
end
sub=coef_scan3d_inv(sbr,n);

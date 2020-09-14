function [cfk,sn,ptr,cfw]=de_sub3d_sub2(bin,len,qctr,ptr)

th=[cumprod(2*ones(1,11)); 3*cumprod([1 2*ones(1,10)])]; th=reshape(th,1,22); thd_arr=[1 th];
Nidx=length(thd_arr);

Nsep=bin(ptr)*4 +bin(ptr+1)*2 +bin(ptr+2) +1;   ptr=ptr+3;

z=cell(1,Nsep); cfk=cell(1,Nsep); thd=zeros(1,Nsep);
for n=1:Nsep
   [thd_idx,ptr] = deSFcode(bin,Nidx,ptr);
   thd(n)=thd_arr(thd_idx); %%%%%%%%%%%%%
   ptr
   [z{n},cfk{n},ptr]=de_sub3d_sub2_sub(bin,thd(n),len,ptr);
end

[cf,inv,ptr]=de_r0(bin,sum(z{n}),ptr); %cfw=cf;
sn=0;
function [a,fL]=transform_time_domainB(a)

a=double(a);
ns=4; %<====== cfp4 !!!
L0=size(a,3); L=L0/ns; hL=L/2; qL=L/4;

a=shiftdim(a,2);
for y=1:size(a,3)
   [a(:,:,y),fL]=LFP2sub(a(:,:,y),ns);
end
a=shiftdim(a,1);

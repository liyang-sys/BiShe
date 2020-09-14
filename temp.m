function [a,fL4]=transform_3d_cfp8B(a)

a=double(a);

%-----------------------------------------------------------------------
M=8;
N=size(a);  w=floor(N(1:2)/M);  md=N(1:2)-M*w; 
nbk=w; hbk=nbk/2; qbk=nbk/4;
111
for ia=1:96
   ia
   a(:,:,ia)=LFP2(a(:,:,ia),M); %a(:,:,ia)=block2band_5lev(a(:,:,ia),M,tanTheta);
end
222
%-----------------------------------------------------------------------
[a,fL4]=temp1(a);

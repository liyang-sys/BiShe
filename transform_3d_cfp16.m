function a=transform_3d_cfp16(a)

a=double(a);

a=transform_time_domain(a);

%-----------------------------------------------------------------------
M=16;
N=size(a);  w=floor(N(1:2)/M);  
nbk=w; hbk=nbk/2; qbk=nbk/4;
tanTheta=1/8;
for ia=1:96
   ia
   [a(:,:,ia),fL]=LFP2(a(:,:,ia),M); a(:,:,ia)=block2band_4lev(a(:,:,ia),M,tanTheta);
end

for ia=1:12
   a(1:hbk(1),1:hbk(2),ia)=CFP2band(a(1:hbk(1),1:hbk(2),ia),tanTheta);
   a(1:hbk(1),1:hbk(2),ia)=block2LowHigh(a(1:hbk(1),1:hbk(2),ia));
end

a=single(a);

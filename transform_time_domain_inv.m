function a=transform_time_domain_inv(a)

a=single(a); a=shiftdim(a,2); a=double(a);

for y=1:size(a,3)
   a(:,:,y)=dyadic_symmetric_recon(a(:,:,y),5);
end

a=single(a); a=shiftdim(a,1); a=double(a);

function bin=en_r_cr(r,lB,nr,sumcr,sumcrc,pr,z)

cr=[sumcr sumcrc];%%%%%%%%%%%%%

sumz=sum(z);

if (sumcr>90  |  sumcrc>=36)  &  sumz>600
   bin=en_zone_new(r,[1 1 lB],nr);
   %shist(r)
   %lenz=sum(r)
   %[zr,rr,ptr]=de_zone_new(bin,3);
elseif (sumcr>39 | sumcrc>=16)  &  sumz>200
   [bin,sep]=en_zone_sub2(r,[1 0 lB]);
elseif (sumcr>16 | sumcrc>=7)  &  (pr<0.43 | pr>0.57)  &  sumz>60
   bin=en_r1(r,0.8125,[0 1 lB]); 
else
   bin=en_z0_r0(z,r,lB,pr); bin=[0 0 bin];
end

delta0=6;
delta=1.3*delta0; T=0.5*delta;

   qcf=quanTHD(sub,T,delta);
   [cf0,abssb,sb,sn_z,z,sn,cf1]=coef_scan3d(sub,qcf,n);
   
   %subr=rstTHDctr1(qcf,T(ia),delta(ia),0.42*delta(ia),0.46*delta(ia));
   nc=hist(double(cf0+1),[1:max(double(cf0+1))]);
   subr=rstTHDctr(qcf,T,delta,nc);
   e=sub-subr; e=e.*e; e=sqrt(sum(sum(sum(e)))/nn);
   SNR0=20*log10(256/e);


   [cf0,  dNnon,sn,cf1tr]=trim_coef(cf0,sn_z,abssb,delta,T); dNnon %%%%%%%%%
  
   
   [biny,xx]=en_sub3d_sub2(cf0,sn,max(cf0));
   [cfr,snrec,ptr,cf0r]=de_sub3d_sub2(biny,length(cf0),1); ptr %%%%%%%%%%
   figure; plot(double(cfr)-double(cf0).*double(sn_z))

   fprintf('\n------------------------------------------------------\n\n\n')

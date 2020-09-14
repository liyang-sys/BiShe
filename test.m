[biny,xx]=en_sub3d_sub2(cf0,sn,max(cf0));
[biny1]=en_sub3d_sub2v1(cf0,sn,max(cf0));
[biny0,z,cf0,cf1,sn]=en_subband_sub2(cf0,z,sn,max(cf0),cf1);
[biny0a]=en_subband_sub1(cf0,z,sn,max(cf0));

%[z,cf1,cf1k]=separate(cf0,0); [bin]=en_subband_sub2(cf0,z,sn,max(cf0),cf1);

lenbin=length(biny) %%%%%%%%%%%%%%
lenbin1=length(biny1) %%%%%%%%%%%%%%
lenbin0=length(biny0) %%%%%%%%%%%%%%
lenbin0a=length(biny0a) %%%%%%%%%%%%%%
fprintf('\n====================================================\n');


[cfr,snr,ptr,cf0r]=de_sub3d_sub2(biny,length(cf0),1); ptr

%[cf0r,snr,ptr,cfwr]=de_sub3d_sub2v1(biny1,length(cf0),1);


%[cf0r,snr,ptr]=de_subband_sub1(bin,length(cf0),1);
%[cf0r,snr,ptr]=de_subband_sub2(bin,length(cf0),1);


%fprintf('\neeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee\n');
figure; plot(double(cfr)-double(cf0).*double(sn_z))




%eff=(length(biny)-length(bin))/length(bin)
%eff3=(length(biny3)-length(bin))/length(bin)


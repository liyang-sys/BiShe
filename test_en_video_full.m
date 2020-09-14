clear a ar

%a=read_bin_8bit('basketball.bin');
%a=read_bin_8bit('peopleST.bin');
%a=read_bin_16bit('seeking.bin'); a=double(a)/4;
%a=read_bin_16bit('traffic.bin'); a=double(a)/16;
%a=read_bin_8bit('Johnny.bin');
a=read_bin_16bit('birds.bin'); a=single(a)/4;
%a=read_bin_16bit('Festival.bin'); a=single(a)/4;
%load cactus_96frames
%load BQTerrace_96frames
%load OldTownCross_96frames;  a=single(a)/4;
%load ParkScene_96frames; a=a/4;
%load \signif\Kimono_96frames; a=single(a)/4;
%maxa=max(max(max(a))); mina=min(min(min(a)));



%[coef,fL4]=transform_3d_cfp8C(a);
%[coef,fL]=transform_cfp8_only(a);

k=0; %time-domain decom control: k=0: all subs - original design; k=1: 1:128; k=2: 1:256, see 'transform_time_domainB.m'
a=single(a);  coef=transform_3d_cfp8B(a,k); 
%Test results show that the time-domain control does not contribute to observable gain!
clear a qcoef qcoef_dum;

%coef=transform_3d_cfp16(a); 

%load birds_cfp8_3d_transB_5lev;
%load Cactus_cfp8_3d_transB_5lev; 


delta0=32; %trim<=======================================================


[bin,qcoef_dum,Nbit]=en_video_full(delta0,coef);
bitrate=Nbit/(1024*1024*32) %%%%%%%%%%%%%%%%%%%%%%
qcoef=de_video_full(delta0,bin,qcoef_dum);  qcoef=single(qcoef); clear bin qcoef_dum bin


ar=transform_3d_cfp8B_inv(qcoef,k);
%ar0=transform_3d_cfp8C_inv(qcoef);
%ar0=transform_3d_cfp16_inv(qcoef);
clear qcoef

%ar=round(ar0*4)/4;
%ar=round(ar0*16)/16;
%maxa=255; mina=0;
%for ia=1:1024
 %  ia
  % for ib=1:1024
   %   for ic=33:64
    %     if ar(ia,ib,ic)>maxa, ar(ia,ib,ic)=maxa; end 
     %    if ar(ia,ib,ic)<mina, ar(ia,ib,ic)=mina; end 
      %end
%   end
%end
%e=double(a(:,:,33:64))-double(ar(:,:,33:64)); e=e.*e; e=sum(sum(sum(e))); e=sqrt(e/numel(a(:,:,33:64))); SNR=20*log10(256/e) %%%%%%%%%%%%%%%%%%


a=read_bin_16bit('birds.bin'); a=(single(a)/4);
%a=read_bin_16bit('Festival.bin'); a=single(a)/4;
%load cactus_96frames;  a=single(a);
%load OldTownCross_96frames;  a=single(a)/4;
%load \signif\Kimono_96frames; a=single(a)/4;
%load ParkScene_96frames; a=single(a)/4;

snr=zeros(1,32); Npix=1024*1024;
for ia=1:32
   fm=ia+32;
   e=double(a(:,:,fm))-double(ar(:,:,fm)); e=e.*e; e=sum(sum(sum(e))); e=sqrt(e/Npix); snr(ia)=20*log10(255/e); %%%%%%%%%%%%%%%%%%
end
[mean(snr) min(snr)]

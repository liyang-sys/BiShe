%a=read_bin_8bit('e:\signif\basketball.bin');
%a=read_bin_8bit('peopleST.bin');
%a=read_bin_16bit('seeking.bin'); a=double(a)/4;
%a=read_bin_16bit('traffic.bin'); a=double(a)/16;
%a=read_bin_16bit('birds.bin'); a=double(a)/4;
%a=read_bin_8bit('Johnny.bin');
%load cactus_96frames
%load BQTerrace_96frames
load OldTownCross_96frames;  a=a/4;
%load ParkScene_96frames; a=a/4;
%load Kimono_96frames; a=a/4;
%maxa=max(max(max(a))); mina=min(min(min(a)));


%[coef,fL4]=transform_3d_cfp8B(a,k); 
[coef,fL4]=temp(a); 


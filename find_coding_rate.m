%er=16*3.9/2; fsz=(65536-er/2)*3.9/2;
%er=16*1.5; fsz=(65536-er/2)*1.5;
%er=16; fsz=65536-er/2;
%er=12; fsz=32768-er/2;
%er=10; fsz=16384-er/2;
%er=8; fsz=8192-er/2;
%er=6; fsz=4096-er/2;


%Code-stream bytes (excluding any file format) = 375318 = 2.86345 bits/pel. Birds
%er=96;  fsz=375318; 
%Code-stream bytes (excluding any file format) = 349672 = 2.66779 bits/pel.  Kemino
%er=96;  fsz=349672; 
%Code-stream bytes (excluding any file format) = 335880 = 2.56256 bits/pel.  Train
%er=96;  fsz=335880; % Train

er=16*4*2; fsz=(65536*4-er/2)*2;  %delta appx 1.82 52.76 dB 8.8%(crowd run)
%er=16*4*1.5; fsz=(65536*4-er/2)*1.5; %delta appx 3.5
%er=16*4; fsz=65536*4-er/2; %delta 6.32 41.66 dB, 10.1%
%er=10*4; fsz=32768*4-er/2; %delta 15.09 35.40 dB, 6%
%er=10*4; fsz=16384*4-er/2; %delta appx 30.77 30.85 dB, 3.4%
%er=8*4; fsz=8192*4-er/2; %delta 54.88, 27.50 dB, 1.8% 
%er=6*4; fsz=4096*4-er/2; 

delta=1.7;
decom1
test_en_coef1
eer0=file_size-fsz 
SN0=SN; delta0=delta

if eer0<0
   delta=delta*(1-1/20); 
else
   delta=delta*(1+1/20); 
end
decom1
test_en_coef1
eer=file_size-fsz %%%%%%%%%%%%%%%%%%%

while abs(eer)>er && abs(SN-SN0)>0.001
   delta2=(delta-delta0)/(eer-eer0) * (0-eer) + delta %%%%%%%%%%%%%%%%%%
   
   delta0=delta; eer0=eer;
   delta=delta2;
   decom1
   test_en_coef1
   eer=file_size-fsz %%%%%%%%%%%%%%%%%%%   
end

fprintf('PSNR = %5.2f dB, rate = %5.3f bpp,   delta =%6.2f \n',SN,file_size*8/(N(1)*N(2)), delta);
fprintf('\n===================================================================\n\n\n')

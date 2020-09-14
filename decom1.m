%infile='lena512.bin'; fid=fopen(infile); a=fread(fid,[512 512],'uint8')'; fclose(fid);
%infile='barbara.bin'; fid=fopen(infile); a=fread(fid,[512 512],'uint8')'; fclose(fid);
%infile='goldhill.bin'; fid=fopen(infile); a=fread(fid,[512 512],'uint8')'; fclose(fid);
%a=double(imread('mandrill.tif'));
%a=double(imread('mandrill_corrected.bmp'));
%a=double(imread('boat.tif'));
%a=double(imread('zelda.tif'));


%infile='bike.bin'; fid=fopen(infile); a=fread(fid,[2560 2048],'uint8'); fclose(fid);
%infile='cafe.bin'; fid=fopen(infile); a=fread(fid,[2560 2048],'uint8'); fclose(fid);
%infile='woman.bin'; fid=fopen(infile); a=fread(fid,[2560 2048],'uint8'); fclose(fid);
%a=double(imread('mandrill.tif'));
%a=double(imread('mandrill_corrected.bmp'));
%a=double(imread('boat.tif'));
%a=double(imread('zelda.tif'));
%a=double(imread('man.tiff'));


%a=double(imread('GorgeSt2.bmp'));
%a=double(imread('floriade5.bmp'));
%a=double(imread('GorgeSt_bw.bmp')); 
%a=double(imread('floriade_bw.bmp'));

%n=2; m=2; a=double(a(n*512+1:(n+1)*512,m*512+1:(m+1)*512));


%load Traffic_12bit; a=Y; clear Y
%load BQTerrace_8bit; a=zeros(1088,1920); for n=1:8, a(n,:)=Y(1,:); end; a(9:1088,:)=Y; clear Y
%load FourPeople_8bit; a=Y(1:704,:); clear Y
%load FourPeople_8bit; a=Y(17:720,:); clear Y


%load BirdsInCage; x=510; y=57; a=Y(y:y+1023,x:x+1023); 
%load ParkScene; x=890; y=1; a=Y(y:y+1023,x:x+1023);
load CrowdRun;  x=690; y=1; a=Y(y:y+1023,x:x+1023);
%load Kimono1_10bit;  x=310; y=50; a=Y(y:y+1023,x:x+1023);
%load Cactus_8bit;  x=310; y=50; a=Y(y:y+1023,x:x+1023);
%load SteamLocomotiveTrain_10bit;  x=1070; y=310; a=Y(y:y+1023,x:x+1023);
%load Traffic_12bit;  x=1350; y=1; a=Y(y:y+1023,x:x+1023); %not used for paper
%load PeopleOnStreet_8bit;  x=310; y=1; a=Y(y:y+1023,x:x+1023); %not used for paper



%n=1; m=1; a=double(a(n*512+1:(n+1)*512,m*512+1:(m+1)*512));
%n=0; m=1; a=double(a(n*512+1:(n+1)*512,m*512+1:(m+1)*512));
%n=0; m=0; a=double(a(n*512+1:(n+1)*512,m*512+1:(m+1)*512));

a=round(a);
N=size(a);


T=delta;

%[coef,fL]=LFP2(a,4);  tanTheta=1/8; coef=block2tree4bandC(coef,tanTheta);
%[coef,fL]=LFP2(a,4);  tanTheta=1/8; coef=block2band(coef,4,tanTheta);
%[coef,fL]=LFP2(a,8); tanTheta=1/8; coef=block2treeC(coef,tanTheta); %<=====LFP
[coef,fL]=LFP2(a,8); tanTheta=1/8;  coef=block2band(coef,8,tanTheta); %<=====LFP

coef=coef_reorder(coef);
%qcoef=quanTHD(coef,T,delta);
qcoef=quantVariableDeadZone(coef,delta);
[Nnon,zone0,subzone,subcoef]=Coef_Statistics(qcoef);

clear qcoef coef
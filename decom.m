%infile='lena512.bin'; fid=fopen(infile); a=fread(fid,[512 512],'uint8')'; fclose(fid);
%infile='barbara.bin'; fid=fopen(infile); a=fread(fid,[512 512],'uint8')'; fclose(fid);
%infile='goldhill.bin'; fid=fopen(infile); a=fread(fid,[512 512],'uint8')'; fclose(fid);
%a=double(imread('mandrill.tif'));
%a=double(imread('mandrill_corrected.bmp'));
%a=double(imread('boat.tif'));
%a=double(imread('zelda.tif'));
%a=a(17:496,17:496);

%infile='bike.bin'; fid=fopen(infile); a=fread(fid,[2560 2048],'uint8'); fclose(fid); %a=a(33:33+2495, 17:17+2015);
%infile='cafe.bin'; fid=fopen(infile); a=fread(fid,[2560 2048],'uint8'); fclose(fid); %a=a(33:33+2495, 17:17+2015);
%infile='woman.bin'; fid=fopen(infile); a=fread(fid,[2560 2048],'uint8'); fclose(fid); %a=a(33:33+2495, 17:17+2015);
%a=a(257:2304,:);


%a=double(imread('man.tiff'));

%a=double(imread('GorgeSt2.bmp'));
%a=double(imread('floriade5.bmp'));
%a=double(imread('GorgeSt_bw.bmp')); 
%a=double(imread('floriade_bw.bmp'));

%load Traffic_12bit; a=Y; clear Y
%load SteamLocomotiveTrain_10bit; a=Y; clear Y
%load NebutaFestival_10bit; a=Y; clear Y
%load PeopleOnStreet_8bit; a=Y; clear Y

%load BirdsInCage; a=zeros(1088,1920); for n=1:8, a(n,:)=Y(1,:); end; a(9:1088,:)=Y; clear Y
%load BQTerrace_8bit_frame1; a=zeros(1088,1920); for n=1:8, a(n,:)=Y(1,:); end; a(9:1088,:)=Y; clear Y
%load BQTerrace_8bit_frame500; a=zeros(1088,1920); for n=1:8, a(n,:)=Y(1,:); end; a(9:1088,:)=Y; clear Y
%load Cactus_8bit; a=zeros(1088,1920); for n=1:8, a(n,:)=Y(1,:); end; a(9:1088,:)=Y; clear Y
%load Kimono1_10bit; a=zeros(1088,1920); for n=1:8, a(n,:)=Y(1,:); end; a(9:1088,:)=Y; clear Y
%load Kimono1_8bit; a=zeros(1088,1920); for n=1:8, a(n,:)=Y(1,:); end; a(9:1088,:)=Y; clear Y
%load Kimono1_8bit_frame240; a=zeros(1088,1920); for n=1:8, a(n,:)=Y(1,:); end; a(9:1088,:)=Y; clear Y
%load ParkScene; a=zeros(1088,1920); for n=1:8, a(n,:)=Y(1,:); end; a(9:1088,:)=Y; clear Y
%load ParkScene_frame200; a=zeros(1088,1920); for n=1:8, a(n,:)=Y(1,:); end; a(9:1088,:)=Y; clear Y
%load CrowdRun; a=zeros(1088,1920); for n=1:8, a(n,:)=Y(1,:); end; a(9:1088,:)=Y; clear Y
%load KristenAndSara_8bit_frame1; Y=Y(1:704,:); u=u(1:352,:); v=v(1:352,:);
%load FourPeople_8bit_frame600; Y=Y(1:704,:); u=u(1:352,:); v=v(1:352,:);


%n=0; m=0; a=double(a(n*512+1:(n+1)*512,m*512+1:(m+1)*512));

%a=v;



%load BirdsInCage; x=510; y=57; a=Y(y:y+1023,x:x+1023); 
%load ParkScene; x=890; y=1; a=Y(y:y+1023,x:x+1023);
%load CrowdRun;  x=690; y=1; a=Y(y:y+1023,x:x+1023);
%load Kimono1_10bit;  x=310; y=50; a=Y(y:y+1023,x:x+1023);
%load Cactus_8bit;  x=310; y=50; a=Y(y:y+1023,x:x+1023);
%load SteamLocomotiveTrain_10bit;  x=1070; y=310; a=Y(y:y+1023,x:x+1023);
%load Traffic_12bit;  x=1350; y=1; a=Y(y:y+1023,x:x+1023); %not used for paper
%load PeopleOnStreet_8bit;  x=310; y=1; a=Y(y:y+1023,x:x+1023); %not used for paper
%a=a(33:496*2,33:496*2);


N=size(a);


%aa=round(a);
%e=(a-aa); e=sqrt( sum(sum(e.*e))/(N(1)*N(2)) );
%SN=20*log10(255/e); fprintf('%5.2f\n',SN);
%SN 58.93 dB for 'Traffic_12bit'


%coef=dy79decm(a);
%coef=dy79decm_5lev(a);
%coef=dy79decm_3lev(a);
%coef=dy53decm(a);

%tanTheta=1/8; coef=CFPdyadic1(a,tanTheta);  %the PTV



%[coef,fL]=LFP2(a,4);  tanTheta=1/8; coef=block2tree4bandC(coef,tanTheta);
%[coef,fL]=LFP2(a,4);  tanTheta=1/8; coef=block2band(coef,4,tanTheta);
%[coef,fL]=LFP2(a,8); tanTheta=1/8; coef=block2treeC(coef,tanTheta); %<=====LFP
%[coef,fL]=LFP2sav(a,8); tanTheta=1/8; coef=block2band(coef,8,tanTheta); %<=====LFP
Ns=8;
%[coef,fL]=LFP2(a,Ns); tanTheta=1/8; coef=block2band_5lev(coef,Ns,tanTheta); %<=====LFP


%[coef,hh,gg,hhh,ggg]=swp2modified(a); %coef=wp2tree(coef,4,2,1); %The latest version of SWP

%fid=fopen('coefficient.dat','w'); fwrite(fid,coef,'float'); fclose(fid);

[Nnon,zone0,subzone,sub]=Coef_Statistics(coef);
%[Nnon,zone0,subzone,sub]=Coef_Statistics_5lev(coef);


%delta=7; 
delta=6; 
%delta=4.259;

%delta=36/4;
%delta=36/2;
%delta=36;
%delta=72;
%delta=72*2;

%[tem,tem,tem,subcf]=Coef_Statistics(coef);

%T=0.5*delta; qcoef=quanTHD(coef,T,delta);
%T=0.9*delta; qcoef=quanTHD(coef,T,delta);
T=0.65*delta; qcoef=quanTHD(coef,T,delta);
%qcoef=quantVariableDeadZone(coef,delta);


%delta=delta/10; T=delta; qcoef=quanTHD(coef,T,delta);


[Nnon,zone0,subzone,subqcf]=Coef_Statistics(qcoef);
%[Nnon,zone0,subzone,subqcf]=Coef_Statistics_5lev(qcoef);
[subqcoef]=subbands(qcoef,Ns);


sz=size(sub{1,1});
cf=rstTHDctr1(subqcf{1,1},T,delta,0.39*delta,0.46*delta);
e=cf-sub{1,1}; e=e.^2; e=sqrt(sum(sum(e))/(sz(1)*sz(2)));
SN=20*log10(255/e)


%----------------------------------------------------------------------------------
%cf0=abs(reshape(subqcf{1,1},1,256*256)); cf0=double(cf0);
%nc=hist(cf0+1,[1:max(cf0+1)]);
%figure; plot(nc/nc(1)); hold on; plot(nc/nc(1),'r.');  axis([0 25 0 1.1]); grid

%x1=nc(1:2:30)+nc(2:2:30); x2=nc(2:2:28)+nc(3:2:30);
%x=[reshape([x1(1:14); x2], 1, 28) x1(15)]; xx=x(2:29)./x(1:28);
%figure; plot(xx); hold on;  plot(xx,'r.');  axis([0 26 0.3 1]); grid
%----------------------------------------------------------------------------------



%NnonTotal=sum(sum(zone0))
%figure; imshow(1-double(zone0))

%[Nnonf,zone0f,subzonef,subcoeff]=Coef_Statistics(flipspec(qcoef,3));


%b=uint8(round(a));
%imwrite(b, 'goldhill.jp2', 'Mode','lossless');
%imwrite(b, 'lena.jp2', 'Mode','lossy',  'QualityLayers', 1, 'CompressionRatio',2.1);
%imwrite(b, 'goldhill.png');
%qb=double(imread('lena.jp2'));
%e=qb-a;   e=e.^2;   e=sqrt(sum(sum(e))/(N(1)*N(2)));   SN=20*log10(255/e)

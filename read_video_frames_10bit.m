%infile='\HEVC\HEVC_images_and_tests\1080\ParkScene_1920x1080_24_10bit_422.yuv'; fid=fopen(infile); %240 frames
%infile='\HEVC\HEVC_images_and_tests\1080\Kimono1_1920x1080_24_10bit_422.yuv'; fid=fopen(infile); %240 frames
%infile='\HEVC\HEVC_images_and_tests\1080\CrowdRun_1920x1080_50_10bit_422.yuv'; fid=fopen(infile); %240 frames
infile='\HEVC\HEVC_images_and_tests\1080\OldTownCross_1920x1080_50_10bit_422.yuv'; fid=fopen(infile); %240 frames


L1=1080; L2=1920; hL1=L1/2; hL2=L2/2;

%a=uint16(zeros(L1,L2,240)); fm=0; frame=36; %ParkScene from frame 36!
a=uint16(zeros(L1,L2,240)); fm=0; frame=1; 
for ia=frame:frame+95
   fseek(fid,(ia-1)*1920*1080*4,'bof');    b=uint16(fread(fid, [1920,1080],'uint16'))';
   u=fread(fid, [960,1080],'uint16')'/4;
   v=fread(fid, [960,1080],'uint16')'/4;
   fm=fm+1;
   a(:,:,fm)=b;
end
fclose(fid);

a=a(:,:,1:fm);
clear b u v

a0=a;

%x=510; y=50; a=double(a(y:y+1023,x:x+1023,:));  %ParkScene
%x=310; y=50; a=double(a(y:y+1023,x:x+1023,:));  %Kimono
x=500; y=1080-1024; a=double(a(y:y+1023,x:x+1023,:));  %OldTownCross

%save Kimono_96frames a
%save CrowdRun_96frames a
save OldTownCross_96frames a

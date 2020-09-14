%infile='\HEVC\HEVC_images_and_tests\1080\Cactus_1920x1080_50.yuv'; fid=fopen(infile); %500 frames
infile='\HEVC\HEVC_images_and_tests\1080\BQTerrace_1920x1080_60.yuv'; fid=fopen(infile); %240 frames


L1=1080; L2=1920; hL1=L1/2; hL2=L2/2;

a=uint8(zeros(L1,L2,300)); fm=0; frame=1;
for ia=frame:frame+95
   fseek(fid,(ia-1)*L2*L1*1.5,'bof');    Y=fread(fid, [L2,L1],'uint8')';
   u=fread(fid, [hL2,hL1],'uint8')';
   v=fread(fid, [hL2,hL1],'uint8')';
   fm=fm+1;
   a(:,:,fm)=Y;
end
fclose(fid);

a=a(:,:,1:fm);
%clear Y u v

%x=310; y=50; a=double(a(y:y+1023,x:x+1023,:));  %save Cactus_96frames a
x=310; y=50; a=double(a(y:y+1023,x:x+1023,:));  save BQRerrace_96frames a

function arr = read_yuv(infile,Nfm)


%infile='rec_inter.yuv'; fid=fopen(infile); 

%infile='cactus_intra24.yuv'; fid=fopen(infile); 

%infile='cactus_inter18.yuv'; fid=fopen(infile); 
%infile='cactus_inter20.yuv'; fid=fopen(infile); 
%load cactus_96frames

%infile='birds_inter22.yuv'; fid=fopen(infile); 


fid=fopen(infile); 

arr=uint16(zeros(1024,1024,Nfm));
for ia=1:Nfm
   arr(:,:,ia)=fread(fid,[1024 1024],'uint16'); 
   b=fread(fid,[1024 1024]/2,'uint16'); 
   b=fread(fid,[1024 1024]/2,'uint16'); 
end

fclose(fid);

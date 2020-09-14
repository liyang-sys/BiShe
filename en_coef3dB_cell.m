function [bin,Nbit]=en_coef3dB_cell(Lev_sub,delta0)

px0=1;
load H3L1

n8=H3cutted(px0,8,n)'+1; 
n8=[n8(2,:); n8(3,:); n8(1,:)];

n7=H3cutted(px0,7,n)'+1;
n7=[n7(2,:); n7(3,:); n7(1,:)];

n6=H3cutted(px0,6,n)'+1;
n6=[n6(2,:); n6(3,:); n6(1,:)];

n5=H3cutted(px0,5,n)'+1;
n5=[n5(2,:); n5(3,:); n5(1,:)];

n4=H3cutted(px0,4,n)'+1;
n4=[n4(2,:); n4(3,:); n4(1,:)];

%whos %%%%%%%%%%%%%%%%%%%%%%

bin=cell(8,4);

w=2^4;
r=1; c=1;
sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
[bn,qcf]=en_sub3d(sub,n4,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
bin{5,1} = bn;

rc=[1 2; 2 2; 2 1];
sb=cell(1,3);
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   sb{ia} = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
end
[bn,tem,qcf]=en_sub3d3(sb{1},sb{2},sb{3},n4,delta0);   %bitrate=length(bin)/numel(sub)/3 %%%%%%%%%%
bin{5,2} = bn;

w=2^5;
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
   [bn,qcf]=en_sub3d(sub,n5,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   bin{6,ia} = bn;
end

w=2^6;
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
   [bn,qcf]=en_sub3d(sub,n6,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   bin{7,ia} = bn;
end

w=2^7;
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
   [bn,qcf]=en_sub3d(sub,n7,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   bin{8,ia} = bn;
end

w=2^8;
r=1
for c=2:4
   %row_col=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
   [bn,qcf]=en_sub3d(sub,n8,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   bin{r,c} = bn;
end
for r=2:4
   r
   for c=1:4
      %row_col=[r c] %<==================================================
      sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
      [bn,qcf]=en_sub3d(sub,n8,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
      bin{r,c} = bn;
   end
end


Nbit=0;
for ia=1:8
   for ib=1:4
      Nbit=Nbit+numel(bin{ia,ib});
   end
end

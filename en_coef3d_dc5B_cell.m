function [bin,Nbit]=en_coef3d_dc5B_cell(Lev_sub,delta0,n)

w=2^4;
bin=cell(6,3);
r=1; c=1;
sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));



%This part needs to modified in the new version. Basically, the DC band is not garanteed
%to be possitive. Thus, this part can treat it as a non-DC band, causing
%inefficiency. 29/10/2017 ===============================================================
if min(min(min(sub)))<0
   [bn,qcf]=en_sub3d_dc5(sub,n,delta0);   
else
   sb=coef_scan2d(sub,n);
   qsb=round(sb/delta0); maxqsb=max(qsb); minqsb=min(qsb); %%%%%%%%%%%%%
   nbits=ceil(16.5-log2(delta0));
   bin_max=uint8(abs(dec2bin(maxqsb,nbits))-48);
   nbitsMax=ceil(log2(double(maxqsb)));
   bin_min=uint8(abs(dec2bin(minqsb,nbitsMax))-48);
   
   qsb=qsb-minqsb;
   Nsym=maxqsb-minqsb+1;
   bn=zeros(1,numel(sb)*nbitsMax);
   ptr=1;
   for ia=1:length(qsb)
      bnn=SFcode(qsb(ia)+1,double(Nsym));
      lenbnn=length(bnn);
      bn(ptr:ptr+lenbnn-1)=bnn;
      ptr=ptr+lenbnn;
   end
   bn=[bin_max bin_min bn(1:ptr-1)];
end
bin{1,1} = bn;
%bitrate=length(bn)/numel(sub) %%%%%%%%%%
%=========================================================================================




rc=[1 2; 2 2; 2 1];
sb=cell(1,3);
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   sb{ia} = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
end
[bn,tem,qcf]=en_sub3d3_dc5(sb{1},sb{2},sb{3},n,delta0);   %bitrate=length(bin)/numel(sub)/3 %%%%%%%%%%
bin{1,2} = bn;

w=2^5;
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
   [bn,qcf]=en_sub3d_dc5(sub,n,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   bin{2,ia} = bn;
end

w=2^6;
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
   [bn,qcf]=en_sub3d_dc5(sub,n,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   bin{3,ia} = bn;
end

w=2^7;
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_colA=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
   [bn,qcf]=en_sub3d_dc5(sub,n,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   bin{4,ia} = bn;
end

fprintf('\nLevel 2 -------------------------------\n')
w=2^8;
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_colB=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
   [bn,qcf]=en_sub3d_dc5(sub,n,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   bin{5,ia} = bn;
end

fprintf('\nLevel 1 -------------------------------\n')
w=2^9;
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   %row_colC=[r c] %<==================================================
   sub = double(Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :));
   [bn,qcf]=en_sub3d_dc5(sub,n,delta0); %bitrate=length(bn)/numel(sub) %%%%%%%%%%   
   bin{6,ia} = bn;
end


Nbit=0;
for ia=1:6
   for ib=1:3
      Nbit=Nbit+numel(bin{ia,ib});
   end
end
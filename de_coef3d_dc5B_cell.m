function [Lev_sub]=de_coef3d_dc5B_cell(bin,delta0,n,dc)

Lev_sub=zeros(1024,1024);

wh=1;
w=2^4; nn=w*w*wh;

bn=bin{1,1}; ptr=1;
r=1; c=1;
if dc==1
   nbits=ceil(16.5-log2(delta0));
   bnn=bn(ptr:ptr+nbits-1); ptr=ptr+nbits;
   maxqsb=bin2dec(char(bnn+48));
   
   nbitsMax=ceil(log2(double(maxqsb)));
   bnn=bn(ptr:ptr+nbitsMax-1); ptr=ptr+nbitsMax;
   minqsb=bin2dec(char(bnn+48));
   Nsym=maxqsb-minqsb+1;

   subr=zeros(w,w);
   for ia=1:nn
      [subr(n(1,ia),n(2,ia)),ptr] = deSFcode(bn,Nsym,ptr);
   end
   %qdc=subr; %%%%%%%%%%%%%%%%%
   subr = (double(subr)-1 +double(minqsb)) *delta0;
   Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = subr;
else
   [subr,ptr]=de_sub3d_dc5(bn,nn,delta0,n,ptr); 
   Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = subr;
end

bn=bin{1,2};
rc=[1 2; 2 2; 2 1];
sb=cell(1,3);
[sb{1},sb{2},sb{3},ptr]=de_sub3d3_dc5(bn,nn*3,delta0,n,1);
for ia=1:3
   r=rc(ia,1); c=rc(ia,2);
   Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = sb{ia};
end

w=2^5; nn=w*w*wh;
for ia=1:3
   bn=bin{2,ia};
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   [subr,ptr]=de_sub3d_dc5(bn,nn,delta0,n,1); 
   Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = subr;
end

w=2^6; nn=w*w*wh;
for ia=1:3
   bn=bin{3,ia};
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   [subr,ptr]=de_sub3d_dc5(bn,nn,delta0,n,1);
   Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = subr;
end

w=2^7; nn=w*w*wh;
for ia=1:3
   bn=bin{4,ia};
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   [subr,ptr]=de_sub3d_dc5(bn,nn,delta0,n,1); 
   Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = subr;
end

fprintf('\nLevel 2 -------------------------------\n')
w=2^8; nn=w*w*wh;
for ia=1:3
   bn=bin{5,ia};
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   [subr,ptr]=de_sub3d_dc5(bn,nn,delta0,n,1); 
   Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = subr;
end

fprintf('\nLevel 1 -------------------------------\n')
w=2^9; nn=w*w*wh;
for ia=1:3
   bn=bin{6,ia};
   r=rc(ia,1); c=rc(ia,2);
   %row_col=[r c] %<==================================================
   [subr,ptr]=de_sub3d_dc5(bn,nn,delta0,n,1); 
   Lev_sub( (r-1)*w+1:r*w, (c-1)*w+1:c*w, :) = subr;
end

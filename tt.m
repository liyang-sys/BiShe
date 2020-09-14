cf=xx; nc=shist(xx);


th=[cumprod(2*ones(1,11)); 3*cumprod([1 2*ones(1,10)])]; th=reshape(th,1,22); thd_arr=[1 th];

idx0=1;
[thdidx,r,lB,pr,nr,scr,scrc,cf1,cf1k,nc1,nc1k,z] = find_thd4subs(cf,thd_arr,nc,idx0); thd1=thd_arr(thdidx); %%%%%%%


%binn0=[biny SFcode(thdidx,Nidx)];

[binn]=en_sub3d_sub2_sub(z,r,lB,pr,nr,scr,scrc,cf1k,nc1k,thd1);


%[zr,cfkr,ptr]=de_sub3d_sub2_sub(binn,thd1,length(z),1); ptr



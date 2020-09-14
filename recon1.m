sz=size(a);
fprintf('\n');
coef=rstVariableDeadZone(qcr,delta);
   
   coef=coef_reorder(coef);
   coef=band2block(coef,8,tanTheta); qb=LFP2Inv(coef,8,fL); %<==== LFP
   
   
   qbb=round(qb);
   for ia=1:N(1)
      for ib=1:N(2)
         if qbb(ia,ib)>255
            qbb(ia,ib)=255;
         elseif qbb(ia,ib)<0
            qbb(ia,ib)=0;
         end
      end
   end
   eq=qbb-a;
   Nonr=sum(sum(abs(sign(eq)))) / (N(1)*N(2))
   
   e=qb-a;
   max_err_del=[delta  mean(mean(abs(e)))/delta  max(max(e))/delta   min(min(e))/delta]%%%%%%%%%%%%%%%%%%%%%%%   
   e=e.^2;
   e=sqrt(sum(sum(e))/(N(1)*N(2)));
   SN=20*log10(255/e);

%   fprintf('PSNR =%5.2f dB\n',SN);
   fprintf('PSNR = %5.2f dB\n',SN);

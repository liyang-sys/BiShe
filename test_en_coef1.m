binary=en_coef(subcoef,N,delta);
clear subcoef subzone zone0 Nnon

[qcf,qcr]=de_coef(binary,delta);
clear qcf

fprintf('\n---------------------------------------------------------\n')
max_min_bin=[max(binary), min(binary)]
file_size=ceil(length(binary)/8)
recon1

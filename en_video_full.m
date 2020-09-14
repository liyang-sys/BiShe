function [bin,qcoef_dum,Nbit]=en_video_full(delta0,coef)

Ldc=coef(:,:,2);  L5=coef(:,:,5);  L4=coef(:,:,9:10);  L3=coef(:,:,17:20);
L2c=coef(:,:,33:40);  L2b=coef(:,:,57:64);  L2a=coef(:,:,81:88);


load H2ext

%coding the middle part:   ==========================================================

bin=cell(1,7);

wh=8;
fprintf('L2 ====================================\n')
[bin{1},N2a]=en_coef3d_cell(L2a,wh,delta0); 
fprintf('L2a bitrate =%7.3f ---------------------------------\n\n', N2a/numel(L2a) );
[bin{2},N2b]=en_coef3d_cell(L2b,wh,delta0);
fprintf('L2b bitrate =%7.3f ---------------------------------\n\n', N2b/numel(L2b) );
[bin{3},N2c]=en_coef3d_cell(L2c,wh,delta0);
fprintf('L2c bitrate =%7.3f ---------------------------------\n\n', N2c/numel(L2c) );

fprintf('L3 ====================================\n')
wh=4;
[bin{4},N3]=en_coef3d_cell(L3,wh,delta0);
fprintf('L3 bitrate =%7.3f ---------------------------------\n\n', N3/numel(L3) );

fprintf('L4 ====================================\n')
[bin{5},N4]=en_coef3dB_cell(L4,delta0);
fprintf('L4 bitrate =%7.3f ---------------------------------\n\n', N4/numel(L4) );

fprintf('Ldc5 ====================================\n')
[bin{6},N5]=en_coef3d_dc5B_cell(L5,delta0,routxy);
fprintf('\nL5 bitrate =%7.3f ---------------------------------\n', N5/numel(L5) );
[bin{7},Ndc]=en_coef3d_dc5B_cell(Ldc,delta0,routxy);
fprintf('\nLdc bitrate =%7.3f ---------------------------------\n', Ndc/numel(Ldc) );

Nbit = N2a +N2b +N2c +N3 +N4 +N5 +Ndc;
bitrate=Nbit/(1024*1024*32)



%generating dummy qcoef parts:   ========================================================
qcoef_dum=cell(2,7);

Ldc=coef(:,:,2-1);  L5=coef(:,:,5-1);  L4=coef(:,:,[9:10]-2);  L3=coef(:,:,[17:20]-4);
L2c=coef(:,:,[33:40]-8);  L2b=coef(:,:,[57:64]-8);  L2a=coef(:,:,[81:88]-8);

wh=8;
fprintf('\n\nL2 dum1 ====================================\n')
qcoef_dum{1,1} = en_coef3d_dum(L2a,wh,delta0);
qcoef_dum{1,2} = en_coef3d_dum(L2b,wh,delta0);
qcoef_dum{1,3} = en_coef3d_dum(L2c,wh,delta0);

fprintf('L3 dum1 ====================================\n')
wh=4;
qcoef_dum{1,4} = en_coef3d_dum(L3,wh,delta0);

fprintf('L4 dum1 ====================================\n')
qcoef_dum{1,5} = en_coef3dB_dum(L4,delta0);

fprintf('Ldc5 dum1 ====================================\n')
qcoef_dum{1,6} = en_coef3d_dc5B_dum(L5,delta0,routxy);
qcoef_dum{1,7} = en_coef3d_dc5B_dum(Ldc,delta0,routxy);


%------------------------------------------------------------------------------------

Ldc=coef(:,:,2+1);  L5=coef(:,:,5+1);  L4=coef(:,:,[9:10]+2);  L3=coef(:,:,[17:20]+4);
L2c=coef(:,:,[33:40]+8);  L2b=coef(:,:,[57:64]+8);  L2a=coef(:,:,[81:88]+8);

wh=8;
fprintf('\nL2 dum2 ====================================\n')
qcoef_dum{2,1} = en_coef3d_dum(L2a,wh,delta0);
qcoef_dum{2,2} = en_coef3d_dum(L2b,wh,delta0);
qcoef_dum{2,3} = en_coef3d_dum(L2c,wh,delta0);

fprintf('L3 dum2 ====================================\n')
wh=4;
qcoef_dum{2,4} = en_coef3d_dum(L3,wh,delta0);

fprintf('L4 dum2 ====================================\n')
qcoef_dum{2,5} = en_coef3dB_dum(L4,delta0);

fprintf('Ldc5 dum2 ====================================\n')
qcoef_dum{2,6} = en_coef3d_dc5B_dum(L5,delta0,routxy);
qcoef_dum{2,7} = en_coef3d_dc5B_dum(Ldc,delta0,routxy);

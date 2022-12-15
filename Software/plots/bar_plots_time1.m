%%
clear all;
close all;

init_plots;

A_01_f_01_S1 = 0.6791;
A_1_f_01_S1 = 0.439;
A_10_f_01_S1 = 0.8909;
A_100_f_01_S1 = 2.6059;

A_01_f_01_S2 = 1.9231;
A_1_f_01_S2 = 1.769;
A_10_f_01_S2 = 2.1146;
A_100_f_01_S2 = 2.596;

A_01_f_01_S3 = 1.0433;
A_1_f_01_S3 = 0.9436;
A_10_f_01_S3 = 0.8161;
A_100_f_01_S3 = 2.5505;

r1 = [A_01_f_01_S1, A_01_f_01_S2, A_01_f_01_S3];
r2 = [A_1_f_01_S1, A_1_f_01_S2, A_1_f_01_S3];
r3 = [A_10_f_01_S1, A_10_f_01_S2, A_10_f_01_S3];
r4 = [A_100_f_01_S1, A_100_f_01_S2, A_100_f_01_S3];

r = [r1; r2; r3; r4];

fig = figure('name','Position Error','Position',[Position, Dimension]);
set(fig,'defaulttextinterpreter','latex');
set(fig,'defaultAxesTickLabelInterpreter','latex');  
set(fig,'DefaultTextFontname', 'CMU Time');
ha = tight_subplot(dim_raw,dim_col,[0.1 1],[.16 .1],[.11 .017]); % (dim_h, dim_w, mar_axes[h,w], mar_hBox[b,t], mar_wBox[l,r])

b = bar(r);
%title(ha,'Spatial Mean $\bar{V}_x(t)$','FontSize', FontSize_label)
grid on;
legend(ha, '$S1$', '$S2$','$S3$','Interpreter','LaTex','FontSize', FontSize_legend);
ylabel('$r_{\bar{V}_x(t)}$~$[\rm mm/s]$','Interpreter','LaTex','FontSize', FontSize_label);
ylim([0 3.4]);
ticks = string(zeros(4,1));
ticks(1) = '$A$=0.1'; 
ticks(2) = '$A$=1'; 
ticks(3) = '$A$=10'; 
ticks(4) = '$A$=100';

set(ha,'XTicklabels', ticks, 'XTickLabelMode', 'manual','FontSize', FontSize_label);
xlabel('$\textnormal{Amplitude}~[\rm mm/Hg]$','Interpreter','LaTex','FontSize', FontSize_label);

b(1,1).FaceColor = color(:,1);
b(1,2).FaceColor = color(:,2);
b(1,3).FaceColor = color(:,3);

set(gca,'ytick',[0:0.5:4]);

%% Save
save_ck = 1;
name_exp = 'bar_plots_time';
result_dir = 'pdf/'
if save_ck == 1
    set(gcf, 'PaperSize', [15 15]);
    set(gcf, 'PaperPositionMode', 'auto');
    print(fig,'-dpdf',strcat(result_dir,name_exp));
    system(['pdfcrop ',result_dir,name_exp,'.pdf ',result_dir,name_exp,'.pdf']);
end
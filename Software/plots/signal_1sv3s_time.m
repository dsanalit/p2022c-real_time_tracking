clear all;
close all;
init_plots;
Dimension = [1200 1000];
dim_raw = 4;
dim_col = 1;
LineWidth = 1.5;
time = [0.008:0.0080:11.9920];
load ('data/ResultC3_f01_fs125_A10.mat');
fig = figure('name','1 section vs 3 section analysis','Position',[Position, Dimension]);
set(fig,'defaulttextinterpreter','latex');
set(fig,'defaultAxesTickLabelInterpreter','latex');  
set(fig,'DefaultTextFontname', 'CMU Time');
ha = tight_subplot(dim_raw,dim_col,[0.05 0.8],[.1 .05],[.121 .017]); % (dim_h, dim_w, mar_axes[h,w], mar_hBox[b,t], mar_wBox[l,r])
ylimits = [-0.15 0.15];
i = 1;
count = 1;
axes(ha(1));
handle(count) = plot(time, s_mean_1S.vx_mean,'Color', 'k', 'LineWidth', LineWidth);
title('$S_0$', 'Interpreter','LaTex');
set(gca,'FontSize',FontSize_axes);
set(gca, 'XTickLabel', []);
set(gca,'ytick',[-0.1:0.05:0.1]);
grid on;
ylim(ylimits);
ylabel('$r_{\bar{V}_x(t)}$~$[\rm mm/s]$','Interpreter','LaTex','FontSize', FontSize_axes);
count = count + 1;
axes(ha(2));
handle(count) = plot(time, s_mean_3S.vx_mean_3s(1,:),'Color', color(:,1), 'LineWidth', LineWidth);
ylim(ylimits);
ylabel('$r_{\bar{V}_x(t)}$~$[\rm mm/s]$','Interpreter','LaTex','FontSize', FontSize_label);
set(gca,'FontSize',FontSize_axes);
set(gca,'ytick',[-0.1:0.05:0.1]);
grid on;
set(gca, 'XTickLabel', []);
title('$S_1$');
count = count +1;
axes(ha(3));
handle(count) = plot(time, s_mean_3S.vx_mean_3s(2,:),'Color', color(:,2), 'LineWidth', LineWidth);
title('$S_2$', 'Interpreter','LaTex');
ylim(ylimits);
ylabel('$r_{\bar{V}_x(t)}$~$[\rm mm/s]$','Interpreter','LaTex','FontSize', FontSize_label);
set(gca,'FontSize',FontSize_axes);
set(gca, 'XTickLabel', []);
set(gca,'ytick',[-0.1:0.05:0.1]);
grid on;
count = count +1;
axes(ha(4));
handle(count) = plot(time, s_mean_3S.vx_mean_3s(3,:),'Color', color(:,3), 'LineWidth', LineWidth);
title('$S_3$', 'Interpreter','LaTex');
ylabel('$r_{\bar{V}_x(t)}$~$[\rm mm/s]$','Interpreter','LaTex','FontSize', FontSize_label);
set(gca,'FontSize',FontSize_axes);
grid on;
ylim(ylimits);
xlabel('Time~$[\rm s]$');
set(gca,'FontSize',FontSize_axes);
set(gca,'ytick',[-0.1:0.05:0.1]);
%% Save
save_ck = 1;
name_exp = '1vs3s_time';
result_dir = 'pdf/'
if save_ck == 1
    set(gcf, 'PaperSize', [15 15]);
    set(gcf, 'PaperPositionMode', 'auto');
    print(fig,'-dpdf',strcat(result_dir,name_exp));
    system(['pdfcrop ',result_dir,name_exp,'.pdf ',result_dir,name_exp,'.pdf']);
end
% Set line style, line width, and color.

clear all;
addpath('../lib');

% load previously generated fig file
figFile = 'single.fig';
open(figFile)

%% plot now
opt.XLabel = 'Time, t (ms)'; % xlabel
opt.YLabel = 'Voltage, V (V)'; %ylabel
opt.Colors = [0, 0, 0]; % change plot color
opt.LineWidth = 2; % line width
opt.LineStyle = {'--'}; % line style

% Save? comment the following line if you do not want to save
opt.FileName = 'plotLineStyle.png'; 

% create the plot
setPlotProp(opt);
    
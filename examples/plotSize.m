% Set box size.

clear all;
addpath('../lib');


% load previously generated fig file
figFile = 'single.fig';
open(figFile)

%% plot now
opt.XLabel = 'Time, t (ms)'; % xlabel
opt.YLabel = 'Voltage, V (V)'; %ylabel
opt.BoxDim = [6, 5]; %[width, height]

% Save? comment the following line if you do not want to save
opt.FileName = 'plotSize.eps'; 

% create the plot
setPlotProp(opt);
    
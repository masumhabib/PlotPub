% Set box size.

clear all;
addpath('../lib');


% load previously generated fig file
figFile = 'single.fig';
open(figFile)

%% change settings
opt.XLabel = 'Time, t (ms)'; % xlabel
opt.YLabel = 'Voltage, V (V)'; %ylabel
opt.BoxDim = [7, 3]; %[width, height]

% Save? comment the following line if you do not want to save
opt.FileName = 'plotSize.eps'; 

% apply
setPlotProp(opt);
    
% Set box size.

clear all;
addpath('../lib');


% load previously generated fig file
figFile = 'single.fig';
open(figFile)

%% change settings
plt = Plot();
plt.XLabel = 'Time, t (ms)'; % xlabel
plt.YLabel = 'Voltage, V (V)'; %ylabel
plt.BoxDim = [7, 5]; %[width, height]

% Save? comment the following line if you do not want to save
plt.export('plotSize.eps'); 

    
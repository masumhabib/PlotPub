clear all;


% load previously generated fig file
figFile = 'multiple.fig';
open(figFile)


% change properties
opt.XLabel = 'Time, t (ms)'; % xlabel
opt.YLabel = 'Voltage, V (V)'; %ylabel
opt.YTick = [-10, 0, 10]; %[tick1, tick2, .. ]
opt.XLim = [0, 80]; % [min, max]
opt.YLim = [-11, 11]; % [min, max]

opt.Colors = [ % three colors for three data set
    1,      0,       0;
    0.25,   0.25,    0.25;
    0,      0,       1;
    ];

opt.LineWidth = [2, 2, 2]; % three line widths
opt.LineStyle = {'-', '-', '-'}; % three line styles
opt.Markers = {'o', '', 's'};
opt.MarkerSpacing = [15, 15, 15];
opt.Legend = {'\theta = 0^o', '\theta = 45^o', '\theta = 90^o'}; % legends

% Save? comment the following line if you do not want to save
opt.FileName = 'plotMarkers.png'; 

% create the plot
setPlotProp(opt);

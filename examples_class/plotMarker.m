clear all;


% load previously generated fig file
figFile = 'multiple.fig';
plt = Plot(figFile);

% change properties
plt.XLabel = 'Time, t (ms)'; % xlabel
plt.YLabel = 'Voltage, V (V)'; %ylabel
plt.YTick = [-10, 0, 10]; %[tick1, tick2, .. ]
plt.XLim = [0, 80]; % [min, max]
plt.YLim = [-11, 11]; % [min, max]

plt.Colors = { % three colors for three data set
    [ 1,      0,       0]
    [ 0.25,   0.25,    0.25]
    [ 0,      0,       1]
    };

plt.LineWidth = [2, 2, 2]; % three line widths
plt.LineStyle = {'-', '-', '-'}; % three line styles
plt.Markers = {'o', '', 's'};
plt.MarkerSpacing = [15, 15, 15];
plt.Legend = {'\theta = 0^o', '\theta = 45^o', '\theta = 90^o'}; % legends

% Save? comment the following line if you do not want to save
plt.export('plotMarkers.png');


% Set line style, line width, and color.

clear all;
addpath('../lib');

% load previously generated fig file
figFile = 'single.fig';
plt = Plot(figFile);

%% ettings
plt.XLabel = 'Time, t (ms)'; % xlabel
plt.YLabel = 'Voltage, V (V)'; %ylabel
plt.Colors = {[0, 0, 0]}; % change plot color
plt.LineWidth = 2; % line width
plt.LineStyle = {'--'}; % line style

% Save? comment the following line if you do not want to save
plt.export('plotLineStyle.png'); 

    
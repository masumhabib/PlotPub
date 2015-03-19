% Multiple plots using setPlotProp. Sets color, legend, line style, tick
% etc.

clear all;
addpath('../lib');

%% lets plot 3 cycles of 50Hz AC voltage
f = 50;
Vm = 10;
phi = pi/4;

% generate the signal
t = [0:0.0001:3/f];
th = 2*pi*f*t;
v1 = Vm*sin(th);
v2 = Vm*sin(th - phi);
v3 = Vm*sin(th - phi*2);

figure;
plot(t*1E3, v1);
hold on;
plot(t*1E3, v2);
plot(t*1E3, v3);
hold off;

%% change properties
plt = Plot();
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
plt.LineStyle = {'-', ':', '--'}; % three line styles
plt.Legend = {'\theta = 0^o', '\theta = 45^o', '\theta = 90^o'}; % legends

% Save? comment the following line if you do not want to save
plt.export('plotMultiple2.eps'); 


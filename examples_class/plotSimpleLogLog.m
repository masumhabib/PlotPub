% Log-log scale.

clear all;
addpath('../lib');

%% lets plot 3 cycles of 50Hz AC voltage
f = 50;
Vm = 10;
phi = 0;

% generate the signal
t = [0:0.00001:3/f];
th = 2*pi*f*t;
v = Vm*sin(th+phi);
vsqr = v.^2;

%% plot and settings
plt = Plot(t*1E3, vsqr);

plt.XLabel = 'Time, t (ms)'; % xlabel
plt.YLabel = 'Voltage, V (V)'; %ylabel
plt.YScale = 'log'; % 'linear' or 'log'
plt.XScale = 'log'; % 'linear' or 'log'
plt.YLim = [1E-3, 1E3]; % [min, max]
plt.YTick = [1E-3, 1E-1, 1E1, 1E3]; %[tick1, tick2, .. ]
plt.YGrid = 'on'; % 'on' or 'off'
plt.XGrid = 'on'; % 'on' or 'off'

% Save? comment the following line if you do not want to save
plt.export('plotSimpleLogLog.png'); 
    
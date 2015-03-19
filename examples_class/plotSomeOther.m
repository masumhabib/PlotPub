clear all;
addpath('../lib');

%% lets plot 3 cycles of 50Hz AC voltage
f = 50;
Vm = 10;
phi = 0;

% generate the signal
t = [0:0.0001:3/f];
th = 2*pi*f*t;
v = Vm*sin(th+phi);

%% plot now
plt = Plot(t*1E3, v);

plt.XLabel = 'Time, t (ms)'; % xlabel
plt.YLabel = 'Voltage, V (V)'; %ylabel
plt.YTick = [-10, 0, 10]; %[tick1, tick2, .. ]
plt.YLim = [-11, 11]; % [min, max]
plt.XMinorTick = 'off'; % 'on' or 'off'
plt.Colors = {[1, 0, 0], [0, 0, 1]}; %[red, green, blue]

plt.FontName = 'Times';

% Save? comment the following line if you do not want to save
plt.export('plotVoltSomeOther.tiff'); 

    
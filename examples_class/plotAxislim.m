% Set axes limit.

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
plt.XLim = [0, 40]; % set x axis limit
plt.YLim = [-11, 11]; % set y axis limit

% Save? comment the following line if you do not want to save
plt.export('plotAxisLimit.jpg'); 
    
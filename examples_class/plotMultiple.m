% Multiple plots using plotPub

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

%% plot and settings
plt = Plot(t*1E3, v1, t*1E3, v2, t*1E3, v3);

plt.XLabel = 'Time, t (ms)'; % xlabel
plt.YLabel = 'Voltage, V (V)'; %ylabel
plt.YTick = [-10, 0, 10];
plt.YLim = [-11, 11];

% Save? comment the following line if you do not want to save
plt.export('plotMultiple.png'); 

    
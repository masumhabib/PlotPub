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

figure;
plot(t*1E3, v);

%% plot now
opt.XLabel = 'Time, t (ms)'; % xlabel
opt.YLabel = 'Voltage, V (V)'; %ylabel
opt.XLim = [0, 40]; % set x axis limit
opt.YLim = [-11, 11]; % set y axis limit

% Save? comment the following line if you do not want to save
opt.FileName = 'plotAxisLimit.jpg'; 

% create the plot
setPlotProp(opt);
    
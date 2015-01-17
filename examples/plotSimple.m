% Load, modify and export a fig file as an eps file.

clear all;
addpath('../lib');

%% lets plot 3 cycles of 50Hz AC voltage
f = 50;  % frequency
Vm = 10; % peak
phi = 0; % phase

% generate the signal
t = [0:0.0001:3/f];
th = 2*pi*f*t;
v = Vm*sin(th+phi);

% plot it
figure;
plot(t*1E3, v);

% change settings
opt = [];
opt.XLabel = 'Time, t (ms)'; % xlabel
opt.YLabel = 'Voltage, V (V)'; %ylabel
opt.Title = 'Voltage as a function of time';

% Save? comment the following line if you do not want to save
opt.FileName = 'plotSimple1.eps'; 

% apply the settings
setPlotProp(opt);
    
% Log scale.

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
vsqr = v.^2 + 1E-5;

figure;
plot(t*1E3, vsqr);

%% plot now
opt.XLabel = 'Time, t (ms)'; % xlabel
opt.YLabel = 'Voltage, V (V)'; %ylabel
opt.YScale = 'log';

% Save? comment the following line if you do not want to save
opt.FileName = 'plotSimpleLog.eps'; 

% create the plot
setPlotProp(opt);
    
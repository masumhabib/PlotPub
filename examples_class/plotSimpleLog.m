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

%% set properties
plt = Plot();
plt.XLabel = 'Time, t (ms)'; % xlabel
plt.YLabel = 'Voltage, V (V)'; %ylabel
plt.YScale = 'log';

% Save? comment the following line if you do not want to save
plt.export('plotSimpleLog.eps'); 
    
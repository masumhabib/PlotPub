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
plotx{1} = t*1E3; %convert time in ms and create a cell array
ploty{1} = v; % assign v to a cell array
opt.XLabel = 'Time, t (ms)'; % xlabel
opt.YLabel = 'Voltage, V (V)'; %ylabel
opt.YTick = [-10, 0, 10]; %[tick1, tick2, .. ]
opt.YLim = [-11, 11]; % [min, max]
opt.XMinorTick = 'off'; % 'on' or 'off'
opt.Colors = [1, 0, 0]; %[red, green, blue]

% Save? comment the following line if you do not want to save
opt.FileName = 'plotVoltSomeOther.tiff'; 

% create the plot
plotPub(plotx, ploty, 1,opt);
    
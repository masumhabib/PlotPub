clear all;

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

%% plot now
% data set 1
plotx{1} = t*1E3; %convert time in ms and create a cell array
ploty{1} = v1; % assign v to a cell array
% data set 2
plotx{2} = t*1E3; %convert time in ms and create a cell array
ploty{2} = v2; % assign v to a cell array
% data set 3
plotx{3} = t*1E3; %convert time in ms and create a cell array
ploty{3} = v3; % assign v to a cell array

opt.XLabel = 'Time, t (ms)'; % xlabel
opt.YLabel = 'Voltage, V (V)'; %ylabel
opt.YTick = [-10, 0, 10]; %[tick1, tick2, .. ]
opt.XLim = [0, 80]; % [min, max]
opt.YLim = [-11, 11]; % [min, max]

opt.Colors = [ % three colors for three data set
    1,      0,       0;
    0.25,   0.25,    0.25;
    0,      0,       1;
    ];

opt.LineWidth = [2, 1, 1]; % three line widths
opt.LineStyle = {'-', ':', '--'}; % three line styles
opt.Legend = {'\phi = 0^o', '\phi = 45^o', '\phi = 90^o'}; % legends

% Save? comment the following line if you do not want to save
opt.FileName = 'plotVoltMultiple2.eps'; 

% create the plot
plotPub(plotx, ploty, 3, opt);
    
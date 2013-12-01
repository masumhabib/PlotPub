function h = plotPub(X, Y, N, opt)
% function h = plotPub(X, Y, N, opt)
% Publication quality plot in MATLAB
% Parameters:
% X:   cell array of x coordinates
% Y:   cell array of y coordinates
% N:   number of plots to be created. N <= length(X) 
% opt: options structure:
% BoxDim:       vector [width, height]: size of the axes box in inches; default: [6, 2.5]
% FontName:     string: font name; default: 'Arial'
% FontSize:     integer; default: 20
% LineWidth:    vector [width1, width2, ..]: element i changes the property of i-th dataset; default: 2
% LineStyle:    cell array {'style1', 'style2', ..}: element i changes the property of i-th dataset; default: '-'
% Colors:       3xN matrix, [red, green, blue] where N is the number of datasets.
% XTick:        [tick1, tick2, ..]: major ticks for X axis.
% YTick:        [tick1, tick2, ..]: major ticks for Y axis.
% XLim:         [min, max]: X axis limit.
% YLim:         [min, max]: Y axis limit.
% XScale:       'linear' or 'log': X axis scale.
% YScale:       'linear' or 'log': Y axis scale.
% XGrid:        'on' or 'off': show grid in X axis?
% YGrid:        'on' or 'off': show grid in Y axis?
% XDir:         'in' or 'out': X axis tick direction
% YDir:         'in' or 'out': Y axis tick direction
% XMinorTick:   'on' or 'off': show X minor tick?
% YMinorTick:   'on' or 'off': show Y minor tick?
% Legend:       {'legend1','legend2',...}
% LegendLoc:    'NorthEast', ..., 'SouthWest': legend location
% XLabel:       X axis label
% YLabel:       Y axis label
% FileName:     Save? Give a file name.
%
% Written by: K M Masum Habib (http://masumhabib.com)
% Copyright (c) K M Masum Habib 2012-2013.
% Distributed under the BSD License.
%
%
if nargin < 4
    fprintf('Usage: function h = plotPub(X, Y, N, opt)');
end

% initialize settings
% plot dimensions
BoxDim = [6, 2.5]; 
if isfield(opt, 'BoxDim')
    BoxDim = opt.BoxDim;
end
BoxPos = [1, 1, BoxDim(1), BoxDim(2)];

%font
FontName = 'Helvetica';
if isfield(opt, 'FontName')
    FontName = opt.FontName;
end
FontSize = 20;
if isfield(opt, 'FontSize')
    FontSize = opt.FontSize;
end

%plot properties
LineWidth = 2*ones(1, N);
if isfield(opt, 'LineWidth')
    LineWidth = opt.LineWidth;
end
for ii = 1:N
    LineStyle{ii} = '-';
end
if isfield(opt, 'LineStyle')
    LineStyle = opt.LineStyle;
end
Colors = [
      0.16,     0.44,    1.00;
      0.93,     0.00,    0.00;
      0.00,     0.57,    0.00;
      0.17,     0.17,    0.17;
      0.44,     0.00,    0.99;
      1.00,     0.50,    0.10;
      0.75,     0.00,    0.75;
      0.50,     0.50,    0.50;
      0.50,     0.57,    0.00;
      0.00,     0.00,    0.00;
      ];
if isfield(opt, 'Colors')
    Colors = opt.Colors;
end

% create figure window
hfig = figure('Units', 'inches', ...
    'Color', [1,1,1]);%, ...
%     'Position', [PlotX PlotY PlotWidth PlotHeight]);

% plot the functions and set style
for ii=1:N

    hold on;
    hp{ii} = plot(X{ii},Y{ii}); 
    set(hp{ii}          , ...
      'LineStyle'       , LineStyle{ii}, ...
      'Color'           , Colors(ii,:), ...
      'LineWidth',        LineWidth(ii));
end
hold off;

% set axis properties
haxis = gca;
if isfield(opt, 'XTick')
    set( haxis , ...
    'XTick'    , opt.XTick);
end
if isfield(opt, 'YTick')
    set( haxis , ...
    'YTick'    , opt.YTick);
end
if isfield(opt, 'XLim')
    set( haxis , ...
    'XLim'     , opt.XLim);
end
if isfield(opt, 'YLim')
    set( haxis , ...
    'YLim'     , opt.YLim);
end
if isfield(opt, 'XScale')
    set( haxis , ...
    'XScale'     , opt.XScale);
end
if isfield(opt, 'YScale')
    set( haxis , ...
    'YScale'     , opt.YScale);
end
if isfield(opt, 'XGrid')
    set( haxis , ...
    'XGrid'     , opt.XGrid);
end
if isfield(opt, 'YGrid')
    set( haxis , ...
    'YGrid'     , opt.YGrid);
end
if isfield(opt, 'XDir')
    set( haxis , ...
    'XDir'     , opt.XDir);
end
if isfield(opt, 'YDir')
    set( haxis , ...
    'YDir'     , opt.YDir);
end
XMinorTick = 'on';
if isfield(opt, 'XMinorTick')
    XMinorTick = opt.XMinorTick;
end
YMinorTick = 'on';
if isfield(opt, 'YMinorTick')
    YMinorTick = opt.YMinorTick;
end

set( haxis        , ...
    'Units'              , 'inches',...
    'FontName'    , FontName, ...
    'FontSize'    , FontSize - 2,...
    'Box'         , 'on'     , ...
    'Color'       , 'none',...
    'TickDir'     , 'in'     , ...
    'TickLength'  , [.02 .02] , ...
    'XMinorTick'  , XMinorTick, ...
    'YMinorTick'  , YMinorTick, ...
    'XColor'      , [0.0 0.0 0.0], ...
    'YColor'      , [0.0 0.0 0.0], ...
    'LineWidth'   , 1);

% legend
if isfield(opt, 'Legend')
    hLegend = legend(haxis, ...
        opt.Legend);
    set(hLegend, ...
        'Box'       , 'off',...
        'Color'     , 'none',...
        'TextColor' , [0 0 0]);
    if isfield(opt, 'LegendLoc')
        set(hLegend,...
            'location'  , opt.LegendLoc);
    end
    if isfield(opt, 'FontSize')
        set(hLegend,...
            'FontSize'  , opt.FontSize - 4);
    end
end

% labels
if isfield(opt, 'XLabel')
    hxl = xlabel(opt.XLabel);
    set(hxl              , ...
        'FontName'       , FontName,...
        'FontSize'       , FontSize);
end
if isfield(opt, 'YLabel')
    hyl = ylabel(opt.YLabel);
    set(hyl              , ...
        'FontName'       , FontName,...
        'FontSize'       , FontSize);
end

% positioning
% set the box size
set(haxis, ...
    'Units'              , 'inches',...
    'Position'           , BoxPos);
% set the figure size and position
pos = get(hfig, 'Position');
outerpos = get(haxis, 'OuterPosition');
set(haxis, 'OuterPosition',[0, 0, outerpos(3), outerpos(4)]);
set(hfig, 'Position', [pos(1), pos(2), outerpos(3), outerpos(4)]);
% for paper position in the eps
set(hfig, 'PaperPositionMode', 'auto');

% save to disk
if isfield(opt, 'FileName')
    fileType = opt.FileName(end-2:end);
    
    if strcmpi(fileType, 'eps')
        print( '-depsc2', opt.FileName);
        fixPSlinestyle(opt.FileName);
    end
end

h = hfig;

function h = setPlotProp(opt, hfig)
% function h = setPlotProp(opt, hfig)
% This function changes the properties of the figure represented by 'hfig'
% and exports it as a publication quality image file. The resolution of 
% the image can be chosen by the user. Supported image formats are EPS, 
% PDF, PNG, JPEG and TIFF. The figure properties are specified by the 
% options structure 'opt'. 
%
% Parameters:
% opt: options structure:
%   BoxDim:       vector [width, height]: size of the axes box in inches; default: [6, 2.5]
%   ShowBox:      'on' = show or 'off' = hide bounding box; default: 'on'
%   FontName:     string: font name; default: 'Arial'
%   FontSize:     integer; default: 26
%   LineWidth:    vector [width1, width2, ..]: element i changes the property of i-th dataset; default: 2
%   LineStyle:    cell array {'style1', 'style2', ..}: element i changes the property of i-th dataset; default: '-'
%   Markers:      cell array {'marker1', 'marker2', ..}: element i changes the property of i-th dataset; default: 'None'
%   MarkerSpacing:vector [space1, space2, ..]: element i changes the property of i-th dataset; default: 0
%   Colors:       3xN matrix, [red, green, blue] where N is the number of datasets.
%   AxisColor:    [red, green, blue]; color of the axis lines; default: black
%   AxisLineWidth:Witdth of the axis lines; default: 2
%   XLabel:       X axis label
%   YLabel:       Y axis label
%   ZLabel:       Z axis label
%   Title:        Plot title
%   XTick:        [tick1, tick2, ..]: major ticks for X axis.
%   YTick:        [tick1, tick2, ..]: major ticks for Y axis.
%   ZTick:        [tick1, tick2, ..]: major ticks for Z axis.
%   XMinorTick:   'on' or 'off': show X minor tick?
%   YMinorTick:   'on' or 'off': show Y minor tick?
%   ZMinorTick:   'on' or 'off': show Z minor tick?
%   TickDir:      tick direction: 'in' or 'out'; default: 'in'
%   TickLength:   tick length; default: [0.02, 0.02]
%   XLim:         [min, max]: X axis limit.
%   YLim:         [min, max]: Y axis limit.
%   ZLim:         [min, max]: Z axis limit.
%   XScale:       'linear' or 'log': X axis scale.
%   YScale:       'linear' or 'log': Y axis scale.
%   ZScale:       'linear' or 'log': Z axis scale.
%   XGrid:        'on' or 'off': show grid in X axis?
%   YGrid:        'on' or 'off': show grid in Y axis?
%   ZGrid:        'on' or 'off': show grid in Z axis?
%   XDir:         'in' or 'out': X axis tick direction
%   YDir:         'in' or 'out': Y axis tick direction
%   ZDir:         'in' or 'out': Z axis tick direction
%   Legend:       {'legend1','legend2',...}
%   LegendBox:    bounding box of legend: 'on'/'off'; default: 'off'
%   LegendBoxColor: color of the bounding box of legend; default: 'none'
%   LegendTextColor: color of the legend text; default: [0,0,0]
%   LegendEdgeColor: color of the legend edges; default: [0,0,0]
%   LegendLoc:    'NorthEast', ..., 'SouthWest': legend location
%   Resolution:   Resolution (dpi) for bitmapped file. Default:600.
%   HoldLines:    true/false. true == only modify axes settings, do not touch plot lines/surfaces. Default false.
%   FileName:     Save? Give a file name.
% 
% hfig:         Figure handle (optional). Default: current figure.
%
%
% Written by: K M Masum Habib (http://masumhabib.com)
% Copyright (c) K M Masum Habib 2012-2015.
%
% Distributed under the BSD License.
%
% Version: 2.2
%

if nargin < 1 || nargin > 2
    fprintf('Usage: function h = setPlotProp(opt, hfig)');
elseif nargin == 1
    hfig = gcf;
end

% get the object handles.
haxis = get(hfig,'CurrentAxes');
hp = get(haxis, 'Children');
N = length(hp);
for ihp = 1:N
    tmp(ihp) = hp(end-ihp+1);
end
hp = tmp;
hxl = get(haxis, 'XLabel');
hyl = get(haxis, 'YLabel');
hzl = get(haxis, 'ZLabel');

% initialize settings
BoxDim = [6, 3]; 
ShowBox = 'on';
FontName = 'Arial';
FontSize = 20;
LineWidth = 2.5*ones(1, N);
LineStyle = {};
for ii = 1:N
    LineStyle{ii} = '-';
end
Markers = {};
for ii = 1:N
    Markers{ii} = 'None';
end
MarkerSpacing = zeros(size(hp));
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
XMinorTick = 'on';
YMinorTick = 'on';
ZMinorTick = 'on';
TickDir = 'in';
TickLength = [0.02, 0.02];

Resolution = 600; % figure resolution for bitmapped file.
HoldLines = false;
AxisColor = [0.0 0.0 0.0]; % axis color
AxisLineWidth = 1.5; % axis color

% Figure properties
% create figure window
set(hfig, 'Units', 'inches', ...
    'Color', [1,1,1]);

% plot dimensions
if isfield(opt, 'BoxDim')
    BoxDim = opt.BoxDim;
end
BoxPos = [1, 1, BoxDim(1), BoxDim(2)];

% Show Box?
if isfield(opt, 'ShowBox')
    ShowBox = opt.ShowBox;
end

%font
if isfield(opt, 'FontName')
    FontName = opt.FontName;
end

if isfield(opt, 'FontSize')
    FontSize = opt.FontSize;
end

%plot properties
if isfield(opt, 'LineWidth')
    LineWidth = opt.LineWidth;
    if N > length(LineWidth)
        LineWidth = [LineWidth, 2*ones(1, N-length(LineWidth))]; 
    end    
end

if isfield(opt, 'LineStyle')
    LineStyle = opt.LineStyle;

    for ii = 1:N
        if ii > length(LineStyle)
            LineStyle{ii} = '-';
        end
        if strcmp(LineStyle{ii}, '')
            LineStyle{ii} = '-';
        end
    end
end

if isfield(opt, 'Markers')
    Markers = opt.Markers;

    for ii = 1:N
        if ii > length(Markers)
            Markers{ii} = 'None';
        end
        if strcmp(Markers{ii}, '')
            Markers{ii} = 'None';
        end
    end
end

if isfield(opt, 'MarkerSpacing')
    MarkerSpacing = opt.MarkerSpacing;
    if N > length(MarkerSpacing)
        MarkerSpacing = [MarkerSpacing, 2*zeros(1, N-length(MarkerSpacing))]; 
    end    

end

if isfield(opt, 'Colors')
    Colors = opt.Colors;
    for ii = 1:N
        if ii > length(Colors)
            Colors(ii,:) = [0.16,     0.44,    1.00];
        end
    end

end

if isfield(opt, 'Resolution')
    Resolution = opt.Resolution;
end

if isfield(opt, 'HoldLines')
    HoldLines = opt.HoldLines;
end

if isfield(opt, 'AxisColor')
    AxisColor = opt.AxisColor;
end

if isfield(opt, 'AxisLineWidth')
    AxisLineWidth = opt.AxisLineWidth;
end

if HoldLines == false
    for ii=1:N   
        if MarkerSpacing(ii) ~= 0
            Marker = 'None';
        else
            Marker = Markers{ii};
        end
        set(hp(ii)          , ...
          'LineStyle'       , LineStyle{ii}, ...
          'Marker'          , Marker,...
          'Color'           , Colors(ii,:), ...
          'LineWidth'       , LineWidth(ii));
    end

    for ii = 1:N
        if MarkerSpacing(ii) ~= 0
            xdata = get(hp(ii),'XData');
            ydata = get(hp(ii),'YData');
            hold on;
            
            % duplicate each plots twice:
            % for marker
            hmarker = plot (xdata(1:MarkerSpacing(ii):end), ydata(1:MarkerSpacing(ii):end));
            % for legend
            hfake = plot (xdata, ydata);

            % remove any original markers
            set(hp(ii), 'Marker', 'none');  
            
            set(hmarker, ...
              'LineStyle'       , 'None', ...
              'Marker'          , Markers{ii},...
              'Color'           , Colors(ii,:), ...
              'MarkerEdgeColor' , 'none',... %Colors(ii,:), ...
              'MarkerFaceColor' , Colors(ii,:), ...
              'MarkerSize'      , 3*LineWidth(ii), ...
              'LineWidth'       , LineWidth(ii));

            set(hfake, ...
              'LineStyle'       , LineStyle{ii}, ...
              'Marker'          , Markers{ii},...
              'Color'           , Colors(ii,:), ...
              'MarkerEdgeColor' , 'none',... %Colors(ii,:), ...
              'MarkerFaceColor' , Colors(ii,:), ...
              'MarkerSize'      , 3*LineWidth(ii), ...
              'LineWidth'       , LineWidth(ii),...
              'Visible'         , 'off');

            hp(ii) = hfake;
        end
    end
end

if isfield(opt, 'XTick')
    set( haxis , ...
    'XTick'    , opt.XTick);
end
if isfield(opt, 'YTick')
    set( haxis , ...
    'YTick'    , opt.YTick);
end
if isfield(opt, 'ZTick')
    set( haxis , ...
    'ZTick'    , opt.ZTick);
end

if isfield(opt, 'XMinorTick')
    XMinorTick = opt.XMinorTick;
end
if isfield(opt, 'YMinorTick')
    YMinorTick = opt.YMinorTick;
end
if isfield(opt, 'ZMinorTick')
    ZMinorTick = opt.ZMinorTick;
end

if isfield(opt, 'TickDir')
    TickDir = opt.TickDir;
end

if isfield(opt, 'TickLength')
    TickLength = opt.TickLength;
end

if isfield(opt, 'XLim')
    set( haxis , ...
    'XLim'     , opt.XLim);
end
if isfield(opt, 'YLim')
    set( haxis , ...
    'YLim'     , opt.YLim);
end
if isfield(opt, 'ZLim')
    set( haxis , ...
    'ZLim'     , opt.ZLim);
end

if isfield(opt, 'XScale')
    set( haxis , ...
    'XScale'     , opt.XScale);
end
if isfield(opt, 'YScale')
    set( haxis , ...
    'YScale'     , opt.YScale);
end
if isfield(opt, 'ZScale')
    set( haxis , ...
    'ZScale'     , opt.ZScale);
end

if isfield(opt, 'XGrid')
    set( haxis , ...
    'XGrid'     , opt.XGrid);
end
if isfield(opt, 'YGrid')
    set( haxis , ...
    'YGrid'     , opt.YGrid);
end
if isfield(opt, 'ZGrid')
    set( haxis , ...
    'ZGrid'     , opt.ZGrid);
end

if isfield(opt, 'XDir')
    set( haxis , ...
    'XDir'     , opt.XDir);
end
if isfield(opt, 'YDir')
    set( haxis , ...
    'YDir'     , opt.YDir);
end
if isfield(opt, 'ZDir')
    set( haxis , ...
    'ZDir'     , opt.ZDir);
end

if isfield(opt, 'XMinorTick')
    XMinorTick = opt.XMinorTick;
end
if isfield(opt, 'YMinorTick')
    YMinorTick = opt.YMinorTick;
end
if isfield(opt, 'ZMinorTick')
    ZMinorTick = opt.ZMinorTick;
end

set( haxis        , ...
    'Units'       , 'inches',...
    'FontName'    , FontName, ...
    'FontSize'    , FontSize,...
    'Box'         , ShowBox     , ...
    'Color'       , 'none',...
    'TickDir'     , TickDir     , ...
    'TickLength'  , TickLength , ...
    'XMinorTick'  , XMinorTick, ...
    'YMinorTick'  , YMinorTick, ...
    'ZMinorTick'  , ZMinorTick, ...
    'XMinorGrid'  , 'off', ...
    'YMinorGrid'  , 'off', ...
    'ZMinorGrid'  , 'off', ...
    'XColor'      , AxisColor, ...
    'YColor'      , AxisColor, ...
    'ZColor'      , AxisColor, ...
    'LineWidth'   , AxisLineWidth);

% legend
if isfield(opt, 'Legend')
    hLegend = legend(hp, ...
        opt.Legend);
else
    hLegend = legend();
end

if isfield(opt, 'LegendBox')
    set(hLegend, 'Box'       , opt.LegendBox);
else
    set(hLegend, 'Box'       , 'off');
end

if isfield(opt, 'LegendBoxColor')
    set(hLegend, 'Color'       , opt.LegendBoxColor);
else
    set(hLegend, 'Color'       , 'none');
end

if isfield(opt, 'LegendTextColor')
    set(hLegend, 'TextColor'       , opt.LegendTextColor);
else
    set(hLegend, 'TextColor'       , [0 0 0]);
end

if isfield(opt, 'LegendEdgeColor')
    set(hLegend, 'EdgeColor'       , opt.LegendEdgeColor);
else
    set(hLegend, 'EdgeColor'       , [0 0 0]);
end

if isfield(opt, 'LegendLoc')
    set(hLegend,...
        'location'  , opt.LegendLoc);
end

if isfield(opt, 'FontSize')
    set(hLegend,...
        'FontSize'  , opt.FontSize);
end


% labels
if isfield(opt, 'XLabel')
    set(hxl              , ...
        'String'         , opt.XLabel);
end
set(hxl              , ...
    'FontName'       , FontName,...
    'FontSize'       , FontSize);

if isfield(opt, 'YLabel')
    set(hyl              , ...
        'String'         , opt.YLabel);
end
set(hyl              , ...
    'FontName'       , FontName,...
    'FontSize'       , FontSize);

if isfield(opt, 'ZLabel')
    set(hyl              , ...
        'String'         , opt.YLabel);
end
set(hzl              , ...
    'FontName'       , FontName,...
    'FontSize'       , FontSize);

if isfield(opt, 'Title')
    htitle = title(haxis, opt.Title,...
        'FontName', FontName, ...
        'FontSize', FontSize);
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
    fileType = strread(opt.FileName, '%s', 'delimiter', '.');
    
    fileType = fileType(end);
    
    if strcmpi(fileType, 'eps')
        print(hfig, '-depsc2', opt.FileName);
        vers = version();
        if ~strcmp(vers(1:3), '8.4')
            fixPSlinestyle(opt.FileName);
        end
    elseif strcmpi(fileType, 'pdf')
        print(hfig, '-dpdf', opt.FileName);
    elseif strcmpi(fileType, 'jpg') || strcmpi(fileType, 'jpeg')
        print(hfig, '-djpeg', '-opengl', sprintf('-r%d',Resolution), opt.FileName);
    elseif strcmpi(fileType, 'png') 
        print(hfig, '-dpng', '-opengl', sprintf('-r%d',Resolution), opt.FileName);
    elseif strcmpi(fileType, 'tiff') 
        print(hfig, '-dtiff', '-opengl', sprintf('-r%d',Resolution), opt.FileName);
    elseif strcmpi(fileType, 'emf')
        print(hfig, '-dmeta', sprintf('-r%d',Resolution), opt.FileName); 
    else
        err = MException('', ...
            '=====> ERROR: File type %s is not supported. ', fileType);
        throw(err);
    end
end

h = hfig;

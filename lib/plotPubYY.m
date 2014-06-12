function h = plotPubYY(X1, Y1, N1, X2, Y2, N2, opt)
% function h = plotPubYY(X1, Y1, N1, X2, Y2, N2, opt)

if nargin < 7
    fprintf('Usage: function h = plotPubYY(X1, Y1, N1, X2, Y2, N2, opt)');
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
% for plot 1
LineWidth1 = 2*ones(1,N1);
if isfield(opt, 'LineWidth1')
    LineWidth1 = opt.LineWidth1;
end
for ii = 1:N1
    LineStyle1{ii} = '-';
end
if isfield(opt, 'LineStyle1')
    LineStyle1 = opt.LineStyle1;
end
Colors1 = [
      0.16,     0.44,    1.00;
      0.00,     0.57,    0.00;
      0.44,     0.00,    0.99;
      0.75,     0.00,    0.75;
      0.50,     0.50,    0.50;
      ];
if isfield(opt, 'Colors1')
    Colors1 = opt.Colors1;
end
XColor1 = [0, 0, 0];
if isfield(opt, 'XColor1')
    XColor1 = opt.XColor1;
end
YColor1 = Colors1(1,:);
if isfield(opt, 'YColor1')
    YColor1 = opt.YColor1;
end
% for plot 2
LineWidth2 = 2*ones(1,N2);
if isfield(opt, 'LineWidth2')
    LineWidth2 = opt.LineWidth2;
end
for ii = 1:N2
    LineStyle2{ii} = '--';
end
if isfield(opt, 'LineStyle2')
    LineStyle2 = opt.LineStyle2;
end
Colors2 = [
      0.93,     0.00,    0.00;
      0.17,     0.17,    0.17;
      1.00,     0.50,    0.10;
      0.25,     0.25,    0.25;
      0.00,     0.00,    0.00;
      ];
if isfield(opt, 'Colors2')
    Colors2 = opt.Colors2;
end
XColor2 = [0, 0, 0];
if isfield(opt, 'XColor2')
    XColor2 = opt.XColor2;
end
YColor2 = Colors2(1,:);
if isfield(opt, 'YColor2')
    YColor2 = opt.YColor2;
end

% create figure window
hfig = figure('Units', 'inches', ...
    'Color', [1,1,1]);%, ...
%     'Position', [PlotX PlotY PlotWidth PlotHeight]);

hax1 = axes(...
    'Units'       , 'inches',...
    'Color'       , 'none',...
    'Position'    , BoxPos);

hax2 = axes(...
    'Units'       , 'inches',...
    'Color'       , 'none',...
    'Position'    , BoxPos);

% plot the functions and set style
for ii=1:N1
    hold(hax1, 'on');
    hp1{ii} = plot(X1{ii},Y1{ii}, 'Parent', hax1); 
    set(hp1{ii}          , ...
      'LineStyle'       , LineStyle1{ii}, ...
      'Color'           , Colors1(ii,:), ...
      'LineWidth',        LineWidth1(ii));
end
hold(hax1, 'off');

for ii=1:N2
    hold(hax2, 'on');
    hp2{ii} = plot(X2{ii},Y2{ii}, 'Parent', hax2); 
    set(hp2{ii}          , ...
      'LineStyle'       , LineStyle2{ii}, ...
      'Color'           , Colors2(ii,:), ...
      'LineWidth',        LineWidth2(ii));
end
hold(hax2, 'off');

% axis settings
% set axis properties for plot 1
if isfield(opt, 'XTick1')
    set( hax1 , ...
    'XTick'    , opt.XTick1);
end
if isfield(opt, 'YTick1')
    set( hax1 , ...
    'YTick'    , opt.YTick1);
end
if isfield(opt, 'XLim1')
    set( hax1 , ...
    'XLim'     , opt.XLim1);
end
if isfield(opt, 'YLim1')
    set( hax1 , ...
    'YLim'     , opt.YLim1);
end
if isfield(opt, 'XScale1')
    set( hax1 , ...
    'XScale'     , opt.XScale1);
end
if isfield(opt, 'YScale1')
    set( hax1 , ...
    'YScale'     , opt.YScale1);
end
if isfield(opt, 'XGrid1')
    set( hax1 , ...
    'XGrid'     , opt.XGrid1);
end
if isfield(opt, 'YGrid1')
    set( hax1 , ...
    'YGrid'     , opt.YGrid1);
end

% set axis properties for plot 2
if isfield(opt, 'XTick2')
    set( hax2 , ...
    'XTick'    , opt.XTick2);
end
if isfield(opt, 'YTick2')
    set( hax2 , ...
    'YTick'    , opt.YTick2);
end
if isfield(opt, 'XLim2')
    set( hax2 , ...
    'XLim'     , opt.XLim2);
end
if isfield(opt, 'YLim2')
    set( hax2 , ...
    'YLim'     , opt.YLim2);
end
if isfield(opt, 'XScale2')
    set( hax2 , ...
    'XScale'     , opt.XScale2);
end
if isfield(opt, 'YScale2')
    set( hax2 , ...
    'YScale'     , opt.YScale2);
end
if isfield(opt, 'XGrid2')
    set( hax2 , ...
    'XGrid'     , opt.XGrid2);
end
if isfield(opt, 'YGrid2')
    set( hax2 , ...
    'YGrid'     , opt.YGrid2);
end
% presets
set([hax1, hax2], ...
    'FontName'    , FontName, ...
    'FontSize'    , FontSize - 2,...
    'Box'         , 'off', ...
    'TickDir'     , 'in'     , ...
    'TickLength'  , [.02 .02] , ...
    'XMinorTick'  , 'on'      , ...
    'YMinorTick'  , 'on'      , ...
    'LineWidth'   , 1);
set(hax1, ...
    'XColor'      , XColor1, ...
    'YColor'      , YColor1, ...
    'XAxisLocation','bottom',...
    'YAxisLocation','left');

set(hax2,...
    'XColor'      , XColor2, ...
    'YColor'      , YColor2, ...
    'XAxisLocation','top',...
    'YAxisLocation','right',...
    'XTickLabel'   ,'');

% legend for plot 1
if isfield(opt, 'Legend1')
    hLegend1 = legend(hax1, ...
        opt.Legend1);
    set(hLegend1, ...
        'Box'       , 'off',...
        'Color'     , 'none',...
        'TextColor' , [0 0 0]);
    if isfield(opt, 'LegendLoc1')
        set(hLegend1,...
            'location'  , opt.LegendLoc1);
    end
    if isfield(opt, 'FontSize')
        set(hLegend1,...
            'FontSize'  , opt.FontSize - 4);
    end
end

% legend for plot 2
if isfield(opt, 'Legend2')
    hLegend2 = legend(hax2, ...
        opt.Legend2);
    set(hLegend2, ...
        'Box'       , 'off',...
        'Color'     , 'none',...
        'TextColor' , [0 0 0]);
    if isfield(opt, 'LegendLoc2')
        set(hLegend2,...
            'location'  , opt.LegendLoc2);
    end
    if isfield(opt, 'FontSize')
        set(hLegend2,...
            'FontSize'  , opt.FontSize - 4);
    end
end

% labels for plot 1
if isfield(opt, 'XLabel1')
    hxl1 = xlabel(hax1, opt.XLabel1);
    set(hxl1              , ...
        'FontName'       , FontName,...
        'FontSize'       , FontSize);
end
if isfield(opt, 'YLabel1')
    hyl1 = ylabel(hax1, opt.YLabel1);
    set(hyl1              , ...
        'FontName'       , FontName,...
        'FontSize'       , FontSize);
end

% labels for plot 2
if isfield(opt, 'XLabel2')
    hxl2 = xlabel(hax2, opt.XLabel2);
    set(hxl2              , ...
        'FontName'       , FontName,...
        'FontSize'       , FontSize);
end
if isfield(opt, 'YLabel2')
    hyl2 = ylabel(hax2, opt.YLabel2);
    set(hyl2              , ...
        'FontName'       , FontName,...
        'FontSize'       , FontSize);
end

% positioning
% set the box size
% set(hax1, ...
%     'Units'              , 'inches',...
%     'Position'           , BoxPos);
boxpos = get(hax1, 'TightInset');
BoxPos = [boxpos(1), boxpos(2), boxpos(3)+BoxPos(3), boxpos(4)+BoxPos(4)];
set(hax1, ...
    'Position'           , BoxPos);
set(hax2, ...
    'Position'           , BoxPos);
% set the figure size and position
pos = get(hfig, 'Position');
outerpos = get(hax1, 'OuterPosition');
set(hfig, 'Position', [pos(1), pos(2), outerpos(3), outerpos(4)]);
set(hfig, 'PaperPositionMode', 'auto');

% save to disk
if isfield(opt, 'FileName')
    print( '-depsc2', opt.FileName);
    fixPSlinestyle(opt.FileName);
end
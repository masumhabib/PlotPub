classdef Plot < handle
% 
% Plot class for Publication Quality Plot in MATLAB
% 
% This class changes the properties of the figure represented by 'hfig'
% and exports it as a publication quality image file. The resolution of 
% the image can be chosen by the user. Supported image formats are EPS, 
% PDF, PNG, JPEG and TIFF. The figure properties are specified by the 
%
% Properties:
%   BoxDim:         vector [width, height]: size of the axes box in inches; default: [6, 2.5]
%   ShowBox:        'on' = show or 'off' = hide bounding box
%   FontName:       string: font name; default: 'Helvetica'
%   FontSize:       integer; default: 26
%   LineWidth:      vector [width1, width2, ..]: element i changes the property of i-th dataset; default: 2
%   LineStyle:      cell array {'style1', 'style2', ..}: element i changes the property of i-th dataset; default: '-'
%   Markers:        cell array {'marker1', 'marker2', ..}: element i changes the property of i-th dataset; default: 'None'
%   MarkerSpacing:  vector [space1, space2, ..]: element i changes the property of i-th dataset; default: 0
%   Colors:         3xN matrix, [red, green, blue] where N is the number of datasets.
%   AxisColor:      axis color, [red, green, blue]; default black.
%   AxisLineWidth:  axis line width, number; default 2.
%   XLabel:       X axis label
%   YLabel:       Y axis label
%   ZLabel:       Z axis label
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
%   LegendLoc:    'NorthEast', ..., 'SouthWest': legend location
%   Title:        plot title, string
%   Resolution:   Resolution (dpi) for bitmapped file. Default:600.
%   HoldLines:    true/false. true == only modify axes settings, do not touch plot lines/surfaces. Default false.
%   FileName:     Save? Give a file name.


    methods (Hidden, Access = private)
        function setDefaultProperties(plot)
            plot.BoxDim          = [6, 4];  
            plot.ShowBox         = 'on';
            plot.FontName        = 'Helvetica'; 
            plot.FontSize        = 26;
            plot.LineWidth       = 4;
            plot.LineStyle       = '-'; 
            plot.Markers         = 'None';
            plot.Colors          = [
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
            
            plot.AxisColor       = [0.0 0.0 0.0];
            plot.AxisLineWidth   = 2;
            plot.XMinorTick      = 'on';
            plot.YMinorTick      = 'on';
            plot.ZMinorTick      = 'on';
            plot.TickDir         = 'in';
            plot.TickLength      = [.02 .02];
            plot.XMinorGrid      = 'off';
            plot.YMinorGrid      = 'off';
            plot.ZMinorGrid      = 'off';
            plot.LegendBox       = 'off';
            plot.LegendBoxColor  = 'none';
            plot.LegendTextColor = [0,0,0];

            plot.Resolution      = 600;
        end
    end

    % Public properties
    properties (Dependent = true) 
        BoxDim   
        ShowBox
        FontName   
        FontSize
        LineWidth
        LineStyle
        Markers
        MarkerSpacing   = 0;
        Colors
        AxisColor
        AxisLineWidth
        XLabel       
        YLabel       
        ZLabel                             
        XTick        
        YTick        
        ZTick        
        XMinorTick
        YMinorTick
        ZMinorTick
        TickDir
        TickLength
        XLim         
        YLim         
        ZLim         
        XScale       
        YScale       
        ZScale       
        XGrid        
        YGrid        
        ZGrid  
        XMinorGrid
        YMinorGrid
        ZMinorGrid
        XDir         
        YDir         
        ZDir         
        Legend  
        LegendBox
        LegendBoxColor
        LegendTextColor
        LegendLoc    
        Title         
    end
    
    % independent public properties
    properties 
        Resolution
    end
    

    % Private properties
    properties(Hidden, SetAccess = private, GetAccess = private)
        % Handles
        hfig        % Figure
        haxes       % Axes
        
        htitle      % Title
        
        hxlabel     % XLabel
        hylabel     % YLabel
        hzlabel     % ZLabel
        
        hp          % plot handle
        N           % number of plots
        
        holdLines   % if true, do not change existing plots.
        
        % private helper members
        boxDim      % The box dimension, private member. Needed since matlab changes the box dimension when fonts are changed.
        legendText  % legend text cell-array
        hlegend     % legend handle
        lineWidth   % line width
        lineStyle   % line style
        markers     % markers
        colors      % line colors
    end
        
    methods
        % Constructor
        function plot = Plot(h, HoldLines)
            if (nargin == 0)
                plot.hfig = gcf;
                plot.holdLines = false;
            elseif (nargin == 1)
                if isempty(h)
                    plot.hfig = gcf;
                else
                    plot.hfig = h;
                end
                plot.holdLines = false;
            else
                plot.holdLines = HoldLines;
            end
                        
            % get figure handles
            plot.haxes = get(plot.hfig, 'CurrentAxes');
            plot.htitle = get(plot.haxes, 'Title');
            
            plot.hxlabel = get(plot.haxes, 'XLabel');
            plot.hylabel = get(plot.haxes, 'YLabel');
            plot.hzlabel = get(plot.haxes, 'ZLabel');
            
            % get the plot handles
            plot.hp = get(plot.haxes, 'Children');
            plot.N = length(plot.hp);
            % the order is reversed, correct it
            for ihp = 1:plot.N
                tmp(ihp) = plot.hp(end-ihp+1);
            end
            plot.hp = tmp;
            
            % set dimension unit
            set(plot.hfig, 'Units', 'inches', 'Color', [1,1,1]);
            set(plot.haxes,'Units', 'inches');
            
            % apply default properties
            plot.setDefaultProperties()            
        end
        
        function set.BoxDim(plot, value)
            plot.boxDim = value;
            plot.adjustBoxDim();
        end
        function value = get.BoxDim(plot)
            pos = get(plot.haxes, 'Position');
            value(1) = pos(3);
            value(2) = pos(4);
        end
        
        function set.ShowBox(plot, ShowBox)
            set(plot.haxes, 'Box', ShowBox);
        end
        function ShowBox = get.ShowBox(plot)
            ShowBox = get(plot.haxes, 'Box');
        end

        function set.FontName(plot, FontName)
            % set font name
            set(plot.haxes, 'FontName', FontName);
            set(plot.hxlabel, 'FontName', FontName);
            set(plot.hylabel, 'FontName', FontName);
            set(plot.hzlabel, 'FontName', FontName);
            set(plot.htitle, 'FontName', FontName);
            if isfield(plot, 'hlegend')
                set(plot.hlegend, 'FontName', FontName);
            end
            % re-adjust box dimension since changing font name might 
            % also result in change in box dimension.
            plot.adjustBoxDim();
        end
        function FontName = get.FontName(plot)
            FontName = get(plot.haxes, 'FontName');
        end

        function set.FontSize(plot, FontSize)
            % change font size
            set(plot.haxes, 'FontSize', FontSize);
            set(plot.hxlabel, 'FontSize', FontSize);
            set(plot.hylabel, 'FontSize', FontSize);
            set(plot.hzlabel, 'FontSize', FontSize);
            set(plot.htitle, 'FontSize', FontSize);
            if isfield(plot, 'hlegend')
                set(plot.hlegend, 'FontSize', FontSize);
            end
            % re-adjust box dimension since changing font size might 
            % also result in change in box dimension.
            plot.adjustBoxDim();
        end
        function FontSize = get.FontSize(plot)
            FontSize = get(plot.haxes, 'FontSize');
        end
  
        function set.LineWidth(plot, LineWidth)
            if plot.holdLines == false
                for ii=1:plot.N   
                    if ii > length(LineWidth)
                        plot.lineWidth(ii) = LineWidth(end);
                    else
                        plot.lineWidth(ii) = LineWidth(ii);
                    end
                    set(plot.hp(ii), 'LineWidth', plot.lineWidth(ii));
                end
            end 
        end
        function LineWidth = get.LineWidth(plot)
            LineWidth = plot.lineWidth;
        end

        function set.LineStyle(plot, LineStyle)
            if ~iscell(LineStyle)
                tmp = LineStyle;
                LineStyle = [];
                LineStyle{1} = tmp;
            end
            if plot.holdLines == false
                for ii=1:plot.N   
                    if ii > length(LineStyle)
                       plot.lineStyle{ii} = LineStyle{end};
                    else
                       plot.lineStyle{ii} = LineStyle{ii};
                    end
                    set(plot.hp(ii), 'LineStyle', plot.lineStyle{ii});
                end
            end 
        end
        function LineStyle = get.LineStyle(plot)
            LineStyle = plot.lineStyle;
        end

        function set.Markers(plot, Markers)
            if ~iscell(Markers)
                tmp = Markers;
                Markers = [];
                Markers{1} = tmp;
            end
            if plot.holdLines == false
                for ii=1:plot.N   
                    if ii > length(Markers)
                       plot.Markers{ii} = Markers{end};
                    else
                       plot.markers{ii} = Markers{ii};
                    end
                    %set(plot.hp(ii), 'LineStyle', plot.lineStyle{ii});
                end
            end 
        end
        function Markers = get.Markers(plot)
            Markers = plot.markers;
        end
        
        function set.Colors(plot, Colors)
            if plot.holdLines == false
                for ii=1:plot.N   
                    if ii > size(Colors, 1)
                       plot.colors(ii, :) = Colors(end, :);
                    else
                       plot.colors(ii, :) = Colors(ii, :);
                    end
                    set(plot.hp(ii), 'Color', plot.colors(ii,:));
                end
            end 
        end
        function Colors = get.Colors(plot)
            Colors = plot.colors;
        end        
        
        function set.AxisColor(plot, AxisColor)
            set(plot.haxes    , ...
                'XColor'      , AxisColor, ...
                'YColor'      , AxisColor, ...
                'ZColor'      , AxisColor);
        end
        function AxisColor = get.AxisColor(plot)
            AxisColor = get(plot.haxes, 'XColor');
        end
        
        function set.AxisLineWidth(plot, AxisLineWidth)
            set(plot.haxes, 'LineWidth' , AxisLineWidth);
        end
        function AxisLineWidth = get.AxisLineWidth(plot)
            AxisLineWidth = get(plot.haxes, 'LineWidth');
        end
        
        function set.XLabel(plot, XLabel)
            set(plot.hxlabel, 'String', XLabel);
            plot.adjustBoxDim();
        end
        function XLabel = get.XLabel(plot)
            XLabel = get(plot.hxlabel, 'String');
        end

        function set.YLabel(plot, YLabel)
            set(plot.hylabel, 'String', YLabel);
            plot.adjustBoxDim();
        end
        function YLabel = get.YLabel(plot)
            YLabel = get(plot.hylabel, 'String');
        end
        
        function set.ZLabel(plot, ZLabel)
            set(plot.hzlabel, 'String', ZLabel);
            plot.adjustBoxDim();
        end
        function ZLabel = get.ZLabel(plot)
            ZLabel = get(plot.hzlabel, 'String');
        end

        function set.XTick(plot, XTick)
            set(plot.haxes, 'XTick' , XTick);
        end
        function XTick = get.XTick(plot)
            XTick = get(plot.haxes, 'XTick');
        end
        
        function set.YTick(plot, YTick)
            set(plot.haxes, 'YTick' , YTick);
        end
        function YTick = get.YTick(plot)
            YTick = get(plot.haxes, 'YTick');
        end
        
        function set.ZTick(plot, ZTick)
            set(plot.haxes, 'ZTick' , ZTick);
        end
        function ZTick = get.ZTick(plot)
            ZTick = get(plot.haxes, 'ZTick');
        end

        function set.XMinorTick(plot, XMinorTick)
            set(plot.haxes, 'XMinorTick' , XMinorTick);
        end
        function XMinorTick = get.XMinorTick(plot)
            XMinorTick = get(plot.haxes, 'XMinorTick');
        end

        function set.YMinorTick(plot, YMinorTick)
            set(plot.haxes, 'YMinorTick' , YMinorTick);
        end
        function YMinorTick = get.YMinorTick(plot)
            YMinorTick = get(plot.haxes, 'YMinorTick');
        end

        function set.ZMinorTick(plot, ZMinorTick)
            set(plot.haxes, 'ZMinorTick' , ZMinorTick);
        end
        function ZMinorTick = get.ZMinorTick(plot)
            ZMinorTick = get(plot.haxes, 'ZMinorTick');
        end

        function set.TickDir(plot, TickDir)
            set(plot.haxes, 'TickDir' , TickDir);
        end
        function TickDir = get.TickDir(plot)
            TickDir = get(plot.haxes, 'TickDir');
        end

        function set.TickLength(plot, TickLength)
            set(plot.haxes, 'TickLength' , TickLength);
        end
        function TickLength = get.TickLength(plot)
            TickLength = get(plot.haxes, 'TickLength');
        end
        
        function set.XLim(plot, XLim)
            set(plot.haxes, 'XLim' , XLim);
        end
        function XLim = get.XLim(plot)
            XLim = get(plot.haxes, 'XLim');
        end
        
        function set.YLim(plot, YLim)
            set(plot.haxes, 'YLim' , YLim);
        end
        function YLim = get.YLim(plot)
            YLim = get(plot.haxes, 'YLim');
        end

        function set.ZLim(plot, ZLim)
            set(plot.haxes, 'ZLim' , ZLim);
        end
        function ZLim = get.ZLim(plot)
            ZLim = get(plot.haxes, 'ZLim');
        end

        function set.XScale(plot, XScale)
            set(plot.haxes, 'XScale' , XScale);
        end
        function XScale = get.XScale(plot)
            XScale = get(plot.haxes, 'XScale');
        end        

        function set.YScale(plot, YScale)
            set(plot.haxes, 'YScale' , YScale);
        end
        function YScale = get.YScale(plot)
            YScale = get(plot.haxes, 'YScale');
        end                

        function set.ZScale(plot, ZScale)
            set(plot.haxes, 'ZScale' , ZScale);
        end
        function ZScale = get.ZScale(plot)
            ZScale = get(plot.haxes, 'ZScale');
        end                
        
        function set.XGrid(plot, XGrid)
            set(plot.haxes, 'XGrid' , XGrid);
        end
        function XGrid = get.XGrid(plot)
            XGrid = get(plot.haxes, 'XGrid');
        end                

        function set.YGrid(plot, YGrid)
            set(plot.haxes, 'YGrid' , YGrid);
        end
        function YGrid = get.YGrid(plot)
            YGrid = get(plot.haxes, 'YGrid');
        end                

        function set.ZGrid(plot, ZGrid)
            set(plot.haxes, 'ZGrid' , ZGrid);
        end
        function ZGrid = get.ZGrid(plot)
            ZGrid = get(plot.haxes, 'ZGrid');
        end                

        function set.XMinorGrid(plot, XMinorGrid)
            set(plot.haxes, 'XMinorGrid' , XMinorGrid);
        end
        function XMinorGrid = get.XMinorGrid(plot)
            XMinorGrid = get(plot.haxes, 'XMinorGrid');
        end                

        function set.YMinorGrid(plot, YMinorGrid)
            set(plot.haxes, 'YMinorGrid' , YMinorGrid);
        end
        function YMinorGrid = get.YMinorGrid(plot)
            YMinorGrid = get(plot.haxes, 'YMinorGrid');
        end                

        function set.ZMinorGrid(plot, ZMinorGrid)
            set(plot.haxes, 'ZMinorGrid' , ZMinorGrid);
        end
        function ZMinorGrid = get.ZMinorGrid(plot)
            ZMinorGrid = get(plot.haxes, 'ZMinorGrid');
        end                
        
        function set.XDir(plot, XDir)
            set(plot.haxes, 'XDir' , XDir);
        end
        function XDir = get.XDir(plot)
            XDir = get(plot.haxes, 'XDir');
        end                        

        function set.YDir(plot, YDir)
            set(plot.haxes, 'YDir' , YDir);
        end
        function YDir = get.YDir(plot)
            YDir = get(plot.haxes, 'YDir');
        end                        

        function set.ZDir(plot, ZDir)
            set(plot.haxes, 'ZDir' , ZDir);
        end
        function ZDir = get.ZDir(plot)
            ZDir = get(plot.haxes, 'ZDir');
        end                        

        function set.Legend(plot, Legend)
            plot.legendText = Legend;
            plot.hlegend = legend(plot.hp, plot.legendText);
        end
        function Legend = get.Legend(plot)
            Legend = plot.legendText;
        end

        function set.LegendBox(plot, LegendBox)
            if isempty(plot.hlegend)
                plot.hlegend = plot.findLegendHandle();
            end
            
            if ~isempty(plot.hlegend)
                set(plot.hlegend, 'Box', LegendBox);
            end
        end
        function LegendBox = get.LegendBox(plot)
            LegendBox = [];
            if isempty(plot.hlegend)
                plot.hlegend = plot.findLegendHandle();
            end
            
            if ~isempty(plot.hlegend)
                LegendBox = get(plot.hlegend, 'Box');
            end

        end

        function set.LegendBoxColor(plot, LegendBoxColor)
            if isempty(plot.hlegend)
                plot.hlegend = plot.findLegendHandle();
            end
            
            if ~isempty(plot.hlegend)
                set(plot.hlegend, 'Color', LegendBoxColor);
            end
        end
        function LegendBoxColor = get.LegendBoxColor(plot)
            LegendBoxColor = [];
            if isempty(plot.hlegend)
                plot.hlegend = plot.findLegendHandle();
            end
            
            if ~isempty(plot.hlegend)
                LegendBoxColor = get(plot.hlegend, 'Color');
            end

        end

        function set.LegendTextColor(plot, LegendTextColor)
            if isempty(plot.hlegend)
                plot.hlegend = plot.findLegendHandle();
            end
            
            if ~isempty(plot.hlegend)
                set(plot.hlegend, 'TextColor', LegendTextColor);
            end
        end
        function LegendTextColor = get.LegendTextColor(plot)
            LegendTextColor = [];
            if isempty(plot.hlegend)
                plot.hlegend = plot.findLegendHandle();
            end
            
            if ~isempty(plot.hlegend)
                LegendTextColor = get(plot.hlegend, 'TextColor');
            end

        end

        function set.LegendLoc(plot, LegendLoc)
            if isempty(plot.hlegend)
                plot.hlegend = plot.findLegendHandle();
            end
            
            if ~isempty(plot.hlegend)
                set(plot.hlegend, 'location', LegendLoc);
            end
        end
        function LegendLoc = get.LegendLoc(plot)
            LegendLoc = [];
            if isempty(plot.hlegend)
                plot.hlegend = plot.findLegendHandle();
            end
            
            if ~isempty(plot.hlegend)
                LegendLoc = get(plot.hlegend, 'location');
            end

        end
        
        function set.Title(plot, Title)
            set(plot.htitle, 'String', Title);
            plot.adjustBoxDim();
        end
        function Title = get.Title(plot)
            Title = get(plot.htitle, 'String');
        end
        
        % save to disk
        function export(plot, FileName)
            fileType = strread(FileName, '%s', 'delimiter', '.');
            fileType = fileType(end);

            if strcmpi(fileType, 'eps')
                print(plot.hfig, '-depsc2', FileName);
                fixPSlinestyle(FileName);
            elseif strcmpi(fileType, 'pdf')
                print(plot.hfig, '-dpdf', FileName);
            elseif strcmpi(fileType, 'jpg') || strcmpi(fileType, 'jpeg')
                print(plot.hfig, '-djpeg', '-opengl', sprintf('-r%d', plot.Resolution), FileName);
            elseif strcmpi(fileType, 'png') 
                print(plot.hfig, '-dpng', '-opengl', sprintf('-r%d', plot.Resolution), FileName);
            elseif strcmpi(fileType, 'tiff') 
                print(plot.hfig, '-dtiff', '-opengl', sprintf('-r%d', plot.Resolution), FileName);
            else
                err = MException('', ...
                    '=====> ERROR: File type %s is not supported. ', fileType);
                throw(err);
            end            
        end
        
    end
    
    methods(Hidden, Access = private)
        function adjustBoxDim(plot)
            BoxPos = [1, 1, plot.boxDim(1), plot.boxDim(2)];
            % positioning
            % set the box size
            set(plot.haxes, 'Position', BoxPos);
            % set the figure size and position
            pos = get(plot.hfig, 'Position');
            outerpos = get(plot.haxes, 'OuterPosition');
            set(plot.haxes, 'OuterPosition',[0, 0, outerpos(3), outerpos(4)]);
            set(plot.hfig, 'Position', [pos(1), pos(2), outerpos(3), outerpos(4)]);
            % for paper position in the eps
            set(plot.hfig, 'PaperPositionMode', 'auto');            
        end
        
        function h = findLegendHandle(plot)
            h = findobj(plot.hfig,'Type','axes','Tag','legend');
        end
    end
end





classdef Plot < handle
% 
% Plot class for Publication Quality Plot in MATLAB
% 
% This class represents a MATLAB figure. It can create new plots, open
% saved figure files and change properties of opened/existing figures.
% It can also export figures as publication quality image files. 
% The resolution of the image can be changed by the user. Supported image 
% formats are EPS, PDF, PNG, JPEG and TIFF. The figure properties can be 
% changed by easy-to-remember class properties.
%
% Construction:
%   Plot()        
%     Grabs the current figure.
%   Plot(handle)  
%     Grabs the figure pointed by handle.
%   Plot('filename.fig') 
%     Opens the figure file ('filename.fig') and use the opened figure.
%   Plot(handle, holdLine) 
%     Grabs the figure pointed by handle. If holdLine = true, it does not 
%     change the plot properties.
%   Plot(Y)
%     Plots Y where Y must be a vector.
%   Plot(X, Y)
%     Plots Y vs X. Both X and Y must be vectors.
%   Plot(X1, Y1, X2, Y2, ...)
%     Plots Y's vs X's. X's and Y's must be vectors.
%   
%   Returns a plot object which can be used for subsequent property 
%   changes.
%
% Properties:
%   BoxDim:       vector [width, height]: size of the axes box in inches; 
%                 default: [6, 2.5]
%   ShowBox:      'on' = show or 'off' = hide bounding box
%   FontName:     string: font name; default: 'Helvetica'
%   FontSize:     integer; default: 26
%   LineWidth:    vector [width1, width2, ..]: element i changes the 
%                 property of i-th dataset; default: 2
%   LineStyle:    cell array {'style1', 'style2', ..}: element i changes 
%                 the property of i-th dataset; default: '-'
%   LineCount:    Number of plots (readonly)
%   Markers:      cell array {'marker1', 'marker2', ..}: element i changes 
%                 the property of i-th dataset; default: 'None'
%   MarkerSpacing:vector [space1, space2, ..]: element i changes the 
%                 property of i-th dataset; default: 0
%   Colors:       3xN matrix, [red, green, blue] where N is the number of 
%                 datasets.
%   AxisColor:    axis color, [red, green, blue]; default black.
%   AxisLineWidth:axis line width, number; default 2.
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
%   LegendEdgeColor: color of the legend edges; default: [0,0,0]
%   LegendLoc:    'NorthEast', ..., 'SouthWest': legend location
%   LegendOrientation:  'horizontal' or 'vertical: 'Orientation of the legend; default: 'vertical'
%   Title:        plot title, string
%   Resolution:   Resolution (dpi) for bitmapped file. Default:600.
%   HoldLines:    true/false. true == only modify axes settings, do not 
%                 touch plot lines/surfaces. Default false.
%
%
% Written by: K M Masum Habib (http://masumhabib.com)
% Copyright (c) K M Masum Habib 2012-2015.
%
% Distributed under the BSD License.
%
% Version: 2.2
%


    methods (Hidden, Access = private)
        function setDefaultProperties(plot)
            % Default properties. Change to your taste.
            plot.BoxDim          = [6, 3];  
            plot.ShowBox         = 'on';
            plot.FontName        = 'Arial'; 
            plot.FontSize        = 20;
            plot.LineWidth       = 2.5;
            plot.LineStyle       = '-'; 
            plot.Colors          = {
                                    [ 0.16,     0.44,    1.00 ],...
                                    [ 0.93,     0.00,    0.00 ],...
                                    [ 0.00,     0.57,    0.00 ],...
                                    [ 0.17,     0.17,    0.17 ],...
                                    [ 0.44,     0.00,    0.99 ],...
                                    [ 1.00,     0.50,    0.10 ],...
                                    [ 0.75,     0.00,    0.75 ],...
                                    [ 0.50,     0.50,    0.50 ],...
                                    [ 0.50,     0.57,    0.00 ],...
                                    [ 0.00,     0.00,    0.00 ]
                                   };
            
            plot.AxisColor       = [0.0 0.0 0.0];
            plot.AxisLineWidth   = 1.5;
            plot.XMinorTick      = 'on';
            plot.YMinorTick      = 'on';
            plot.ZMinorTick      = 'on';
            plot.TickDir         = 'in';
            plot.TickLength      = [.02 .02];
            plot.XMinorGrid      = 'off';
            plot.YMinorGrid      = 'off';
            plot.ZMinorGrid      = 'off';
            plot.LegendBox       = 'off';
            plot.LegendBoxColor  = [1,1,1];
            plot.LegendTextColor = [0,0,0];
            plot.MarkerSpacing   = 5;
            plot.Markers         = '';            

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
        LineCount
        Markers
        MarkerSpacing
        Colors
        AxisColor
        AxisLineWidth
        XLabel       
        YLabel       
        ZLabel                             
        XTick        
        YTick        
        ZTick
        XTickLabel
        YTickLabel
        ZTickLabel
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
        LegendOrientation
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
        hm          % plot handle for marker plots
        hfm         % plot handle for fake marker plots
        N           % number of plots
        xdata       % x coordinates of the plots
        ydata       % y coordinates of the plots
        zdata       % z coordinates of the plots
        
        holdLines   % if true, do not change existing plots.
        
        % private helper members
        boxDim      % The box dimension, private member. Needed since matlab changes the box dimension when fonts are changed.
        legendText  % legend text cell-array
        hlegend     % legend handle
        lineWidth   % line width
        lineStyle   % line style
        markers     % markers
        markerSpacing % marker spacing
        colors      % line colors
        legendBox          % legend box, on/off
        legendBoxColor     % legend box color
        legendTextColor    % legend text color
        
        xMinorGrid
        yMinorGrid
        zMinorGrid

    end
        
    methods
        % Constructor
        function self = Plot(varargin)
            pdata = {};
            if nargin == 0
                self.hfig = gcf;
                self.holdLines = false;
            elseif nargin == 1
                if isempty(varargin{1})
                    self.hfig = gcf;
                elseif ishandle(varargin{1})
                    self.hfig = varargin{1};
                elseif ischar(varargin{1})
                    open(varargin{1});
                    self.hfig = gcf;
                elseif isfloat(varargin{1})
                    pdata{1} = varargin{1};
                end
                self.holdLines = false;
            elseif nargin == 2
                if isempty(varargin{1})
                    self.hfig = gcf;
                elseif ishandle(varargin{1})
                    self.hfig = varargin{1};
                elseif ischar(varargin{1})
                    open(varargin{1});
                    self.hfig = gcf;
                elseif isfloat(varargin{1})
                    pdata{1} = varargin{1};
                end
                if isempty(varargin{2})
                    self.holdLines = false;
                elseif islogical(varargin{2})
                    self.holdLines = varargin{2};
                elseif isfloat(varargin{2})
                    pdata{2} = varargin{2};
                end
            else
                pdata = varargin;
            end
            
            np = length(pdata);
            if np > 0
                self.holdLines = false;
                self.hfig = figure;
                hold('on');
                if np == 1
                    plot(pdata{1});
                elseif np == 2
                    plot(pdata{1}, pdata{2});
                else
                    for ip = 1:2:np
                        plot(pdata{ip}, pdata{ip+1});
                    end
                end
                hold('off');
            end
            
            % get figure handles
            self.haxes = get(self.hfig, 'CurrentAxes');
            self.htitle = get(self.haxes, 'Title');
            
            self.hxlabel = get(self.haxes, 'XLabel');
            self.hylabel = get(self.haxes, 'YLabel');
            self.hzlabel = get(self.haxes, 'ZLabel');
            
            % get the self handles
            self.hp = get(self.haxes, 'Children');
            self.N = length(self.hp);
            % the order is reversed, correct it
            tmp = cell(self.N, 1);
            self.hm = cell(self.N, 1);
            self.hfm = cell(self.N, 1);
            for ihp = 1:self.N
                tmp{ihp} = self.hp(end-ihp+1);
            end
            self.hp = tmp;
            
            self.legendText = cell(self.N, 1);
            try 
                % get the self data
                for ip = 1:self.N
                    self.xdata{ip} = get(self.hp{ip},'XData');
                    self.ydata{ip} = get(self.hp{ip},'YData');
                    self.zdata{ip} = get(self.hp{ip},'ZData');
                end
            catch e 
                warning('Unable to get data from all axes: %s',e.message);
            end
            
            % set dimension unit
            set(self.hfig, 'Units', 'inches', 'Color', [1,1,1]);
            set(self.haxes,'Units', 'inches');
            
            % apply default properties
            self.setDefaultProperties()            
        end
        
        function addPlot(self, X, Y)
            if ~isempty(self.haxes)
                hold(self.haxes, 'on');
            end
            self.hp{end+1} = plot(X,Y);
        end
        
        function set.BoxDim(self, value)
            self.boxDim = value;
            self.adjustBoxDim();
        end
        function value = get.BoxDim(self)
            pos = get(self.haxes, 'Position');
            value(1) = pos(3);
            value(2) = pos(4);
        end
        
        function set.ShowBox(self, ShowBox)
            set(self.haxes, 'Box', ShowBox);
        end
        function ShowBox = get.ShowBox(self)
            ShowBox = get(self.haxes, 'Box');
        end

        function set.FontName(self, FontName)
            % set font name
            set(self.haxes, 'FontName', FontName);
            set(self.hxlabel, 'FontName', FontName);
            set(self.hylabel, 'FontName', FontName);
            set(self.hzlabel, 'FontName', FontName);
            set(self.htitle, 'FontName', FontName);
            if isfield(self, 'hlegend')
                set(self.hlegend, 'FontName', FontName);
            end
            % re-adjust box dimension since changing font name might 
            % also result in change in box dimension.
            self.adjustBoxDim();
        end
        function FontName = get.FontName(self)
            FontName = get(self.haxes, 'FontName');
        end

        function set.FontSize(self, FontSize)
            % change font size
            set(self.haxes, 'FontSize', FontSize);
            set(self.hxlabel, 'FontSize', FontSize);
            set(self.hylabel, 'FontSize', FontSize);
            set(self.hzlabel, 'FontSize', FontSize);
            set(self.htitle, 'FontSize', FontSize);
            if isfield(self, 'hlegend')
                set(self.hlegend, 'FontSize', FontSize);
            end
            % re-adjust box dimension since changing font size might 
            % also result in change in box dimension.
            self.adjustBoxDim();
        end
        function FontSize = get.FontSize(self)
            FontSize = get(self.haxes, 'FontSize');
        end
  
        function set.LineWidth(self, LineWidth)
            if self.holdLines == false
                for ii=1:self.N   
                    if ii > length(LineWidth)
                        self.lineWidth(ii) = LineWidth(end);
                    else
                        self.lineWidth(ii) = LineWidth(ii);
                    end
                    set(self.hp{ii}, 'LineWidth', self.lineWidth(ii));
                end
            end 
        end
        function LineWidth = get.LineWidth(self)
            LineWidth = self.lineWidth;
        end

        function set.LineStyle(self, LineStyle)
            if ~iscell(LineStyle)
                tmp = LineStyle;
                LineStyle = [];
                LineStyle{1} = tmp;
            end
            if self.holdLines == false
                for ii=1:self.N   
                    if ii > length(LineStyle)
                       self.lineStyle{ii} = LineStyle{end};
                    else
                       self.lineStyle{ii} = LineStyle{ii};
                    end
                    set(self.hp{ii}, 'LineStyle', self.lineStyle{ii});
                end
            end 
        end
        function LineStyle = get.LineStyle(self)
            LineStyle = self.lineStyle;
        end
        
        function LineCount = get.LineCount(self)
            LineCount = size(self.hp,1);
        end

        function set.Markers(self, Markers)
            if ~iscell(Markers)
                tmp = Markers;
                Markers = [];
                Markers{1} = tmp;
            end
            if self.holdLines == false
                for ii=1:self.N   
                    if ii > length(Markers)
                        self.markers{ii} = Markers{end};
                    else
                        self.markers{ii} = Markers{ii};
                    end
                    
                    if strcmp(self.markers{ii}, '')
                        self.markers{ii} = 'None';
                    end
                    
                    if ~strcmp(self.markers{ii}, 'None')
                        if isempty(self.hm{ii}) && ~strcmp(self.markers{ii}, 'None')
                            X = self.xdata{ii};
                            Y = self.ydata{ii};

                            hold(self.haxes, 'on')
                            self.hm{ii} = plot (X(1:self.markerSpacing(ii):end), Y(1:self.markerSpacing(ii):end));
                        end
                        set(self.hm{ii}, ...
                          'LineStyle'       , 'None', ...
                          'Marker'          , self.markers{ii},...
                          'Color'           , self.colors{ii}, ...
                          'MarkerEdgeColor' , 'none',...
                          'MarkerFaceColor' , self.colors{ii}, ...
                          'MarkerSize'      , 3*self.lineWidth(ii)); 
                    
                        if isempty(self.hfm{ii})
                            X = self.xdata{ii};
                            Y = self.ydata{ii};
                        
                            hold(self.haxes, 'on')
                            self.hfm{ii} = plot(X, Y);
                        end
                        set(self.hfm{ii}, ...
                          'LineStyle'       , self.lineStyle{ii}, ...
                          'Marker'          , self.markers{ii},...
                          'Color'           , self.colors{ii}, ...
                          'MarkerEdgeColor' , 'none',...
                          'MarkerFaceColor' , self.colors{ii}, ...
                          'MarkerSize'      , 3*self.lineWidth(ii), ...
                          'LineWidth'       , self.lineWidth(ii),...
                          'Visible'         , 'off');
                    end                       
                end
            end 
        end
        function Markers = get.Markers(self)
            Markers = self.markers;
        end
        function set.MarkerSpacing(self, MarkerSpacing)
            if self.holdLines == false
                for ii=1:self.N   
                    if ii > length(MarkerSpacing)
                       self.markerSpacing(ii) = MarkerSpacing(end);
                    else
                       self.markerSpacing(ii) = MarkerSpacing(ii);
                    end
                end
            end 
        end
        
        function MarkerSpacing = get.MarkerSpacing(self)
            MarkerSpacing = self.markerSpacing;
        end
        
        function set.Colors(self, Colors)
            if self.holdLines == false
                for ii=1:self.N   
                    
                    % Store the colour we're about to set
                    if ii > size(Colors)
                       self.colors{ii} = Colors{end};
                    else
                       self.colors{ii} = Colors{ii};
                    end
                    
                    % Set the primary color
                    if isa(self.hp{ii}, 'matlab.graphics.chart.primitive.Area')
                        set(self.hp{ii}, 'FaceColor', self.colors{ii});
                    else
                        set(self.hp{ii}, 'Color', self.colors{ii});
                    end
                    
                    % Set for markers too if they exist
                    if ~isempty(self.hm{ii})
                        set(self.hm{ii}, 'Color', self.colors{ii}, 'MarkerFaceColor' , self.colors{ii});
                    end
                    if ~isempty(self.hfm{ii})
                        set(self.hfm{ii}, 'Color', self.colors{ii}, 'MarkerFaceColor' , self.colors{ii});
                    end                    
                end
            end 
        end
        function Colors = get.Colors(self)
            Colors = self.colors;
        end        
        
        function set.AxisColor(self, AxisColor)
            set(self.haxes    , ...
                'XColor'      , AxisColor, ...
                'YColor'      , AxisColor, ...
                'ZColor'      , AxisColor);
        end
        function AxisColor = get.AxisColor(self)
            AxisColor = get(self.haxes, 'XColor');
        end
        
        function set.AxisLineWidth(self, AxisLineWidth)
            set(self.haxes, 'LineWidth' , AxisLineWidth);
        end
        function AxisLineWidth = get.AxisLineWidth(self)
            AxisLineWidth = get(self.haxes, 'LineWidth');
        end
        
        function set.XLabel(self, XLabel)
            set(self.hxlabel, 'String', XLabel);
            self.adjustBoxDim();
        end
        function XLabel = get.XLabel(self)
            XLabel = get(self.hxlabel, 'String');
        end

        function set.YLabel(self, YLabel)
            set(self.hylabel, 'String', YLabel);
            self.adjustBoxDim();
        end
        function YLabel = get.YLabel(self)
            YLabel = get(self.hylabel, 'String');
        end
        
        function set.ZLabel(self, ZLabel)
            set(self.hzlabel, 'String', ZLabel);
            self.adjustBoxDim();
        end
        function ZLabel = get.ZLabel(self)
            ZLabel = get(self.hzlabel, 'String');
        end

        function set.XTick(self, XTick)
            set(self.haxes, 'XTick' , XTick);
        end
        function XTick = get.XTick(self)
            XTick = get(self.haxes, 'XTick');
        end
                
        function set.YTick(self, YTick)
            set(self.haxes, 'YTick' , YTick);
        end
        function YTick = get.YTick(self)
            YTick = get(self.haxes, 'YTick');
        end
        
        function set.ZTick(self, ZTick)
            set(self.haxes, 'ZTick' , ZTick);
        end
        function ZTick = get.ZTick(self)
            ZTick = get(self.haxes, 'ZTick');
        end
        
        function set.XTickLabel(self, XTickLabel)
            set(self.haxes, 'XTickLabel' , XTickLabel);
        end
        function XTickLabel = get.XTickLabel(self)
            XTickLabel = get(self.haxes, 'XTickLabel');
        end
                
        function set.YTickLabel(self, YTickLabel)
            set(self.haxes, 'YTickLabel' , YTickLabel);
        end
        function YTickLabel = get.YTickLabel(self)
            YTickLabel = get(self.haxes, 'YTickLabel');
        end
        
        function set.ZTickLabel(self, ZTickLabel)
            set(self.haxes, 'ZTickLabel' , ZTickLabel);
        end
        function ZTickLabel = get.ZTickLabel(self)
            ZTickLabel = get(self.haxes, 'ZTickLabel');
        end

        function set.XMinorTick(self, XMinorTick)
            set(self.haxes, 'XMinorTick' , XMinorTick);
        end
        function XMinorTick = get.XMinorTick(self)
            XMinorTick = get(self.haxes, 'XMinorTick');
        end

        function set.YMinorTick(self, YMinorTick)
            set(self.haxes, 'YMinorTick' , YMinorTick);
        end
        function YMinorTick = get.YMinorTick(self)
            YMinorTick = get(self.haxes, 'YMinorTick');
        end

        function set.ZMinorTick(self, ZMinorTick)
            set(self.haxes, 'ZMinorTick' , ZMinorTick);
        end
        function ZMinorTick = get.ZMinorTick(self)
            ZMinorTick = get(self.haxes, 'ZMinorTick');
        end

        function set.TickDir(self, TickDir)
            set(self.haxes, 'TickDir' , TickDir);
        end
        function TickDir = get.TickDir(self)
            TickDir = get(self.haxes, 'TickDir');
        end

        function set.TickLength(self, TickLength)
            set(self.haxes, 'TickLength' , TickLength);
        end
        function TickLength = get.TickLength(self)
            TickLength = get(self.haxes, 'TickLength');
        end
        
        function set.XLim(self, XLim)
            set(self.haxes, 'XLim' , XLim);
        end
        function XLim = get.XLim(self)
            XLim = get(self.haxes, 'XLim');
        end
        
        function set.YLim(self, YLim)
            set(self.haxes, 'YLim' , YLim);
        end
        function YLim = get.YLim(self)
            YLim = get(self.haxes, 'YLim');
        end

        function set.ZLim(self, ZLim)
            set(self.haxes, 'ZLim' , ZLim);
        end
        function ZLim = get.ZLim(self)
            ZLim = get(self.haxes, 'ZLim');
        end

        function set.XScale(self, XScale)
            set(self.haxes, 'XScale' , XScale);
        end
        function XScale = get.XScale(self)
            XScale = get(self.haxes, 'XScale');
        end        

        function set.YScale(self, YScale)
            set(self.haxes, 'YScale' , YScale);
        end
        function YScale = get.YScale(self)
            YScale = get(self.haxes, 'YScale');
        end                

        function set.ZScale(self, ZScale)
            set(self.haxes, 'ZScale' , ZScale);
        end
        function ZScale = get.ZScale(self)
            ZScale = get(self.haxes, 'ZScale');
        end                
        
        function set.XGrid(self, XGrid)
            set(self.haxes, 'XGrid' , XGrid);
            % The minor grid seems to be changed with the major grid
            % to fix this:
            self.XMinorGrid = self.xMinorGrid; 
        end
        function XGrid = get.XGrid(self)
            XGrid = get(self.haxes, 'XGrid');
        end                

        function set.YGrid(self, YGrid)
            set(self.haxes, 'YGrid' , YGrid);
            % The minor grid seems to be changed with the major grid
            % to fix this:
            self.YMinorGrid = self.yMinorGrid; 
        end
        function YGrid = get.YGrid(self)
            YGrid = get(self.haxes, 'YGrid');
        end                

        function set.ZGrid(self, ZGrid)
            set(self.haxes, 'ZGrid' , ZGrid);
            % The minor grid seems to be changed with the major grid
            % to fix this:
            self.ZMinorGrid = self.zMinorGrid;             
        end
        function ZGrid = get.ZGrid(self)
            ZGrid = get(self.haxes, 'ZGrid');
        end                

        function set.XMinorGrid(self, XMinorGrid)
            set(self.haxes, 'XMinorGrid' , XMinorGrid);
            self.xMinorGrid = XMinorGrid;
        end
        function XMinorGrid = get.XMinorGrid(self)
            XMinorGrid = get(self.haxes, 'XMinorGrid');
        end                

        function set.YMinorGrid(self, YMinorGrid)
            set(self.haxes, 'YMinorGrid' , YMinorGrid);
            self.yMinorGrid = YMinorGrid;            
        end
        function YMinorGrid = get.YMinorGrid(self)
            YMinorGrid = get(self.haxes, 'YMinorGrid');
        end                

        function set.ZMinorGrid(self, ZMinorGrid)
            set(self.haxes, 'ZMinorGrid' , ZMinorGrid);
            self.zMinorGrid = ZMinorGrid;
        end
        function ZMinorGrid = get.ZMinorGrid(self)
            ZMinorGrid = get(self.haxes, 'ZMinorGrid');
        end                
        
        function set.XDir(self, XDir)
            set(self.haxes, 'XDir' , XDir);
        end
        function XDir = get.XDir(self)
            XDir = get(self.haxes, 'XDir');
        end                        

        function set.YDir(self, YDir)
            set(self.haxes, 'YDir' , YDir);
        end
        function YDir = get.YDir(self)
            YDir = get(self.haxes, 'YDir');
        end                        

        function set.ZDir(self, ZDir)
            set(self.haxes, 'ZDir' , ZDir);
        end
        function ZDir = get.ZDir(self)
            ZDir = get(self.haxes, 'ZDir');
        end                        

        function set.Legend(self, Legend)
            hp1 = [];
            text1 = [];
            il = 1;
            for ii = 1:self.N           
                if ii <= length(Legend)
                    self.legendText{ii} = Legend{ii};
                end
                if ~isempty(self.legendText{ii})
                    if isempty(self.hfm{ii})
                        hp1(il) = self.hp{ii};
                    else
                        hp1(il) = self.hfm{ii};
                    end
                    text1{il} = self.legendText{ii};
                    il = il + 1;
                end                
            end
            self.hlegend = legend(hp1, text1);
            set(self.hlegend, 'Box', self.legendBox);
            set(self.hlegend, 'Color', self.legendBoxColor);
            set(self.hlegend, 'TextColor', self.legendTextColor);
        end
        function Legend = get.Legend(self)
            Legend = self.legendText;
        end

        function set.LegendBox(self, LegendBox)
            if isempty(self.hlegend)
                self.hlegend = self.findLegendHandle();
            end
            
            if ~isempty(self.hlegend)
                set(self.hlegend, 'Box', LegendBox);
            end
            self.legendBox = LegendBox;
        end
        function LegendBox = get.LegendBox(self)
            LegendBox = [];
            if isempty(self.hlegend)
                self.hlegend = self.findLegendHandle();
            end
            
            if ~isempty(self.hlegend)
                LegendBox = get(self.hlegend, 'Box');
            end

        end

        function set.LegendBoxColor(self, LegendBoxColor)
            if isempty(self.hlegend)
                self.hlegend = self.findLegendHandle();
            end
            
            if ~isempty(self.hlegend)
                set(self.hlegend, 'Color', LegendBoxColor);
            end
            self.legendBoxColor = LegendBoxColor;
        end
        function LegendBoxColor = get.LegendBoxColor(self)
            LegendBoxColor = [];
            if isempty(self.hlegend)
                self.hlegend = self.findLegendHandle();
            end
            
            if ~isempty(self.hlegend)
                LegendBoxColor = get(self.hlegend, 'Color');
            end
        end

        function set.LegendTextColor(self, LegendTextColor)
            if isempty(self.hlegend)
                self.hlegend = self.findLegendHandle();
            end
            
            if ~isempty(self.hlegend)
                set(self.hlegend, 'TextColor', LegendTextColor);
            end
            self.legendTextColor = LegendTextColor;
        end
        function LegendTextColor = get.LegendTextColor(self)
            LegendTextColor = [];
            if isempty(self.hlegend)
                self.hlegend = self.findLegendHandle();
            end
            
            if ~isempty(self.hlegend)
                LegendTextColor = get(self.hlegend, 'TextColor');
            end

        end

        function set.LegendLoc(self, LegendLoc)
            if isempty(self.hlegend)
                self.hlegend = self.findLegendHandle();
            end
            
            if ~isempty(self.hlegend)
                set(self.hlegend, 'location', LegendLoc);
            end
        end
        function LegendLoc = get.LegendLoc(self)
            LegendLoc = [];
            if isempty(self.hlegend)
                self.hlegend = self.findLegendHandle();
            end
            
            if ~isempty(self.hlegend)
                LegendLoc = get(self.hlegend, 'location');
            end

        end

        % Added by Protik
        function set.LegendOrientation(self, LegendOrientation)
            if isempty(self.hlegend)
                self.hlegend = self.findLegendHandle();
            end
            
            if ~isempty(self.hlegend)
                set(self.hlegend, 'Orientation', LegendOrientation);
            end
        end
        function LegendOrientation = get.LegendOrientation(self)
            LegendOrientation = [];
            if isempty(self.hlegend)
                self.hlegend = self.findLegendHandle();
            end
            
            if ~isempty(self.hlegend)
                LegendOrientation = get(self.hlegend, 'Orientation');
            end

        end
        % finished by Protik
        
        function set.Title(self, Title)
            set(self.htitle, 'String', Title);
            self.adjustBoxDim();
        end
        function Title = get.Title(self)
            Title = get(self.htitle, 'String');
        end
        
        % save to disk
        function export(self, FileName)
            fileType = strread(FileName, '%s', 'delimiter', '.');
            fileType = fileType(end);

            if strcmpi(fileType, 'eps')
                print(self.hfig, '-depsc2', FileName);
                vers = version();
                if ~strcmp(vers(1:3), '8.4')
                    fixPSlinestyle(FileName);
                end
            elseif strcmpi(fileType, 'pdf')
                print(self.hfig, '-dpdf', FileName);
            elseif strcmpi(fileType, 'jpg') || strcmpi(fileType, 'jpeg')
                print(self.hfig, '-djpeg', '-opengl', sprintf('-r%d', self.Resolution), FileName);
            elseif strcmpi(fileType, 'png') 
                print(self.hfig, '-dpng', '-opengl', sprintf('-r%d', self.Resolution), FileName);
            elseif strcmpi(fileType, 'tiff') 
                print(self.hfig, '-dtiff', '-opengl', sprintf('-r%d', self.Resolution), FileName);
            elseif strcmpi(fileType, 'svg')
                print(self.hfig, '-dsvg', '-opengl', sprintf('-r%d', self.Resolution), FileName);
            elseif strcmpi(fileType, 'fig')
                savefig(self.hfig, FileName);
            else
                err = MException('', ...
                    '=====> ERROR: File type %s is not supported. ', fileType);
                throw(err);
            end            
        end
        
    end
    
    methods(Hidden, Access = private)
        function adjustBoxDim(self)
            BoxPos = [1, 1, self.boxDim(1), self.boxDim(2)];
            % positioning
            % set the box size
            set(self.haxes, 'Position', BoxPos);
            % get the monitor size
            set(0, 'Units', 'inch');
            monitorPos = get(0,'MonitorPositions');
            % put the figure at the middle of the monitor
            pos = [monitorPos(1, 3)/2-self.boxDim(1)/2, monitorPos(1, 4)/2-self.boxDim(2)/2];
            outerpos = get(self.haxes, 'OuterPosition');
            if ~isempty(outerpos)
                set(self.haxes, 'OuterPosition',[0, 0, outerpos(3), outerpos(4)]);
                set(self.hfig, 'Position', [pos(1), pos(2), outerpos(3), outerpos(4)]);
            end
            % for paper position in the eps
            set(self.hfig, 'PaperPositionMode', 'auto');            
        end
        
        function h = findLegendHandle(self)
            h = findobj(self.hfig,'Type','axes','Tag','legend');
        end
    end
end





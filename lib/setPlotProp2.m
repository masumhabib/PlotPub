function h = setPlotProp2(hfig, opt)
% function h = setPlotProp2(hfig, opt)
% This function is a compatibility layer on top of setPlotProp, which 
% provides compatibility to MATLAB line/patch functions.
% Like setPlotProp, this function changes the properties of the figure 
% represented by 'hfig' and exports it as a publication quality image file. 
% The resolution of the image can be chosen by the user. Supported image 
% formats are EPS, PDF, PNG, JPEG and TIFF. The figure properties are 
% specified by the options structure 'opt'.
%
% Parameters:
%
% hfig:         Figure handle.
%
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
%   LegendLoc:    'NorthEast', ..., 'SouthWest': legend location
%   Resolution:   Resolution (dpi) for bitmapped file. Default:600.
%   HoldLines:    true/false. true == only modify axes settings, do not touch plot lines/surfaces. Default false.
%   FileName:     Save? Give a file name.
% 
%
%
% Written by: K M Masum Habib (http://masumhabib.com)
% Copyright (c) K M Masum Habib 2012-2015.
%
% Distributed under the BSD License.
%
% Version: 2.2
%

h = setPlotProp(opt, hfig);


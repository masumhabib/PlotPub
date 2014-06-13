function h = plotPub(X, Y, N, opt)
% function h = plotPub(X, Y, N, opt)
% This function plots X{i} vs Y{i}, changes the properties of the generated 
% figure and exports it as a publication quality image file. The resolution 
% of the image can be chosen by the user. Supported image formats are EPS, 
% PDF, PNG, JPEG and TIFF. The figure properties are specified by the 
% options structure 'opt'. 
%
% Parameters:
% X:   cell array of x coordinates
% Y:   cell array of y coordinates
% N:   number of plots to be created. N <= length(X) 
% opt: options structure:
%   BoxDim:       vector [width, height]: size of the axes box in inches; default: [6, 2.5]
%   FontName:     string: font name; default: 'Arial'
%   FontSize:     integer; default: 20
%   LineWidth:    vector [width1, width2, ..]: element i changes the property of i-th dataset; default: 2
%   LineStyle:    cell array {'style1', 'style2', ..}: element i changes the property of i-th dataset; default: '-'
%   Markers:      cell array {'marker1', 'marker2', ..}: element i changes the property of i-th dataset; default: 'None'
%   MarkerSpacing:vector [space1, space2, ..]: element i changes the property of i-th dataset; default: 0
%   Colors:       3xN matrix, [red, green, blue] where N is the number of datasets.
%   XTick:        [tick1, tick2, ..]: major ticks for X axis.
%   YTick:        [tick1, tick2, ..]: major ticks for Y axis.
%   ZTick:        [tick1, tick2, ..]: major ticks for Z axis.
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
%   XMinorTick:   'on' or 'off': show X minor tick?
%   YMinorTick:   'on' or 'off': show Y minor tick?
%   ZMinorTick:   'on' or 'off': show Z minor tick?
%   Legend:       {'legend1','legend2',...}
%   LegendLoc:    'NorthEast', ..., 'SouthWest': legend location
%   XLabel:       X axis label
%   YLabel:       Y axis label
%   ZLabel:       Z axis label
%   Resolution:   Resolution (dpi) for bitmapped file. Default:600.
%   FileName:     Save? Give a file name.
% 
% hfig:         Figure handle (optional). Default: current figure.
%
%
% Written by: K M Masum Habib (http://masumhabib.com)
% Copyright (c) K M Masum Habib 2012-2014.
%
% Distributed under the BSD License.
%
% Version: 1.2
%

if nargin ~= 4
    fprintf('Usage: function h = plotPub(X, Y, N, opt)');
end


% create figure window
hfig = figure;

% plot the functions and set style
for ii=1:N

    hold on;
    hp{ii} = plot(X{ii},Y{ii}); 
end
hold off;

% Set plot properties
setPlotProp(opt, hfig);

h = hfig;

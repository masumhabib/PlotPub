PlotPub
=======

<h4>Publication quality graphs in MATLAB.</h4>

MATLAB is an excellent tool. It is equally popular among students, researchers 
and professors. If you use MATLAB for your project/research, you probably know 
that it is not easy to create publication quality graphs (PQGs) using MATLAB. 
You will have to call a billion <code>set</code> and <code>get</code> functions 
to create a decent plot with desired height, width, fonts, line width, color 
etc. Here, I present PlotPub which is a collection of MATLAB functions and 
a MATLAB class that allows you to modify almost all aspects of MATLAB figures 
and export PQGs using one function call and a simple structure.

<h4>What's new in v2.2</h4>
<hr />
<ul>
    <li>Added SVG and fig to exports (issue # 9). Thanks to <a href="https://github.com/hsidky">Hythem Sidky</a></li>
    <li>Added X/Y/ZTickLabels. Thanks to <a href="https://github.com/hsidky">Hythem Sidky</a>.</li>
    <li>Fixed bug # 6. Thanks to <a href="https://github.com/ChuntaoLu">ChuntaoLu</a>.</li>
    <li>Fixed bug # 5. Thanks to <a href="https://github.com/protik77">Protik Das</a>.</li>
</ul>


<h4>What's new in v2.1</h4>
<hr />
<ul>
    <li>Fixed constructor for user supplied handle. Thanks to
    <a href="https://github.com/hsidky">Hythem Sidky</a>.</li>

    <li>Added a new function, <code>setPlotProp2(hfig, opt)</code> 
    for compatibility with MATLAB line and patch functions.</li>
</ul>

<h4>New features of v2.x</h4>
<hr />
<ul>
	<li>Simple and elegant object oriented approach: all aspects of the MATLAB 
	figure is encapsulated in the Plot class.</li>
	<li>Create new plots, open saved figures or change existing figure using 
	the same call, <code>Plot()</code>.</li>
	<li>Control every aspect of a MATLAB figure using the Plot class object.</li>
	<li>Property changes are immediately visible, useful when using from command
    window.</li>
	<li>Even easier to use.</li>
	<li>Fully compatible to v1.x.</li>
</ul>


<h4>What's new in v1.4</h4>
<hr />
<ul>
    <li>Added the title option.</li>
</ul>

<h4>What's new in v1.3</h4>
<hr />
<ul>
	<li>Several bugs fixed including marker spacing.</li>
	<li>New options for axis color, axis line width, tick direction, tick 
	length, minor ticks, legend box, legend text color etc.</li>
	<li>New, more appealing default look.</li>
</ul>

<h4>Features of v1.x</h4>
<hr />
<ul>
	<li>Generate beautiful, publication quality graphs from instantly generated 
	MATLAB figures or saved MATLAB fig files.</li>
	<li>Export figures in EPS, PDF, JPEG, PNG and TIFF with adjustable 
	resolution.</li>
	<li>Set marker spacing.</li>
	<li>Change almost all aspects of a figure using simple and intuitive 
	code.</li>
	<li>A lot of example codes. A decent tutorial and good documentation.</li>
	<li>Tested in Ubuntu and OSX with MATLAB 7.10. But it should work in other 
	operating systems with other versions of MATLAB.</li>
	<li>Distributed under BSD license which allows you to do anything you 
	like.</li>
</ul>

<h4> Compatibility with v1.1</h4>
<hr />
In version 1.2, I introduced a new function <code>setPlotProp</code> which is 
superior to the old function <code>plotPub</code>. But for backward 
compatibility, <code>plotPub</code> is still available in v1.2. Therefore, all 
of your previous codes should work with v1.2.

<h4>Downloads</h4>
<hr />
<ul>
	<li><a href="https://github.com/masumhabib/PlotPub/archive/master.zip">Compressed package</a></li>
</ul>

<h4>Documentation</h4>
<hr />

<h5>Installation</h5>
<hr />
Download and extract the zip file from the link given above. Install PlotPub 
using any one of the three possible ways: (1) copy all the *.m files inside 
the <code>lib</code> folder to either your MATLAB path or (2) copy those files 
to your current project folder or (3) put plotPub-master in any convenient 
folder and add the following line in your MATLAB code:

<code> addpath('D:/MATLAB/PlotPub-master/lib');</code>

where, I assume that you put PlotPub-master in <code>D:/MATLAB</code> folder. 
The sample codes can be found inside the <code>examples</code> folder.

<h5>Tutorial</h5>
<hr />
* [Tutorial for v1.4](https://github.com/masumhabib/PlotPub/wiki/Tutorial-for-v1.4)

To create a beautiful figure using PlotPub, all you need to know is how to use 
the (<code>Plot</code>) class. Alternatively, you can use the 
set-plot-properties (<code>setPlotProp</code>) function which 
is discussed [here](https://github.com/masumhabib/PlotPub/wiki/Tutorial-for-v1.4). 
The Plot class provides a simple and elegant object oriented programming 
interface for manipulating MATLAB figures.


Let us walk you through an example. Assume that we have data for 3 cycle of a 
50 Hz AC voltage signal:
```matlab
clear all;

%% lets plot 3 cycles of 50Hz AC voltage
f = 50;  % frequency
Vm = 10; % peak
phi = 0; % phase

% generate the signal
t = [0:0.0001:3/f];
th = 2*pi*f*t;
v = Vm*sin(th+phi);

% plot it
figure;
plot(t*1E3, v);
```
where, <code>f</code> is the frequency, <code>Vm</code> is the peak voltage, 
<code>t</code> is time and <code>v</code> is the AC voltage signal. Result? 
An utterly ugly looking figure punching at your face:
<a href="http://masumhabib.com/wp-content/uploads/2014/09/ugly.png"><img class="aligncenter size-full wp-image-1325" src="http://masumhabib.com/wp-content/uploads/2014/09/ugly.png" alt="MQGv1.3: ugly"/></a>


Now, let us add some spices. Let us set the labels and title:

```matlab
% change settings
plt = Plot(); % create a Plot object and grab the current figure

plt.XLabel = 'Time, t (ms)'; % xlabel
plt.YLabel = 'Voltage, V (V)'; %ylabel
plt.Title = 'Voltage as a function of time'; % plot title
```

Finally, call the <code>export</code> function to export the figure:
```matlab
% Save? comment the following line if you do not want to save
plt.export('plotSimple1.png');
```

The resulting plot should look like:

![MQGv2.0: Simple plot](https://github.com/masumhabib/PlotPub/blob/v2.0/examples_class/plotSimple1.png)

Instead of creating the plot using 

```matlab
% plot it
figure;
plot(t*1E3, v);
```

one could also use Plot class directly to plot:

```matlab
plt = Plot(t*1E3, v); % create the figure directly using data

plt.XLabel = 'Time, t (ms)'; % xlabel
plt.YLabel = 'Voltage, V (V)'; %ylabel
plt.Title = 'Voltage as a function of time'; % plot title
```

The full source code for this plot, <code>plotSimple.m</code>, can be found 
inside the <code>examples_class</code> folder.


We can change color, linewidth, linestyle etc:

```matlab
plt.Colors = {[0, 0, 0]};   % [red, green, blue]
plt.LineWidth = 2;        % line width
plt.LineStyle = {'--'};   % line style: '-', ':', '--' etc
```
![MQGv2.0: Line style](https://github.com/masumhabib/PlotPub/blob/v2.0/examples_class/plotLineStyle.png)

See <code>plotLineStyle.m</code> for full source code. We can also change scale, 
axis limit, tick and grid:

```matlab
plt.YScale = 'log';     % 'linear' or 'log'
plt.YLim = [1E-3, 1E3]; % [min, max]
plt.YTick = [1E-3, 1E-1, 1E1, 1E3]; %[tick1, tick2, .. ]
plt.YGrid = 'on';       % 'on' or 'off'
```
![MQGv2.0: Simple log scale](https://github.com/masumhabib/PlotPub/blob/v2.0/examples_class/plotSimpleLog2.png)
or create a log-log plot:

```matlab
plt.YScale = 'log';     % 'linear' or 'log'
plt.XScale = 'log';     % 'linear' or 'log'
plt.YLim = [1E-3, 1E3]; % [min, max]
plt.YTick = [1E-3, 1E-1, 1E1, 1E3]; %[tick1, tick2, .. ]
plt.YGrid = 'on';       % 'on' or 'off'
plt.XGrid = 'on';       % 'on' or 'off'
```

![MQGv2.0: Simple log log](https://github.com/masumhabib/PlotPub/blob/v2.0/examples_class/plotSimpleLogLog.png)

See <code>plotSimpleLog.m</code> and <code>plotSimpleLogLog.m</code> for full 
source code.

Creating multiple plots in a single set of axes is also easy:

```matlab
% generate the signal
t = [0:0.0001:3/f];
th = 2*pi*f*t;
v1 = Vm*sin(th);
v2 = Vm*sin(th - phi);
v3 = Vm*sin(th - phi*2);

% plot them
plt = Plot(t*1E3, v1, t*1E3, v2, t*1E3, v3);

% change settings
plt.XLabel = 'Time, t (ms)';   % xlabel
plt.YLabel = 'Voltage, V (V)'; % ylabel
plt.YTick = [-10, 0, 10];      % [tick1, tick2, .. ]
plt.YLim = [-11, 11];          % [min, max]

% Save? comment the following line if you do not want to save
plt.export('plotMultiple.tiff');

```

Note how Plot class constructor is directly used for plotting multiple 
functions. Result:

![MQGv2.0: Multiple plots](https://github.com/masumhabib/PlotPub/blob/v2.0/examples_class/plotMultiple.png)

The full source is given in <code>plotMultiple.m</code>. We can change the 
linestyle, color etc and add a legend:

```matlab
plt.XLim = [0, 80];            % [min, max]
plt.Colors = {                 % three colors for three data set
    [1,      0,       0]        % data set 1
    [0.25,   0.25,    0.25]     % data set 2
    [0,      0,       1]        % data set 3
    };
plt.LineWidth = [2, 2, 2];       % three line widths
plt.LineStyle = {'-', '-', '-'}; % three line styles
plt.Markers = {'o', '', 's'};
plt.MarkerSpacing = [15, 15, 15];
plt.Legend = {'\theta = 0^o', '\theta = 45^o', '\theta = 90^o'}; % legends
```

![MQGv2.0: Multiple plots markers](https://github.com/masumhabib/PlotPub/blob/v2.0/examples_class/plotMarkers.png)

Here, <code>plt.Colors{1}</code>, <code>plt.LineWidth(1)</code> and 
<code>plt.LineStyle{1}</code> set properties of data set 1 and so on. 
The full source is given in <code>plotMarkers.m</code>.


By default, <code>PlotPub</code> creates figures with 6in x 3in box size. You 
can easily change the figure size using the following code.

```matlab
plt.BoxDim = [7, 3]; %[width, height] in inches
```

This code creates a figure with 7in x 5in box.

![MQGv2.0: Size](https://github.com/masumhabib/PlotPub/blob/v2.0/examples_class/plotSize.png)

See <code>plotSize.m</code> for more details.


You can also load a previously saved MATLAB fig file and export it using 
<code>Plot</code> class:

```matlab
clear all;

% load previously generated fig file
plt = Plot('single.fig');

% change settings
plt.XLabel = 'Time, t (ms)'; % xlabel
plt.YLabel = 'Voltage, V (V)'; %ylabel
plt.BoxDim = [6, 5]; %[width, height]

% Save? comment the following line if you do not want to save
plt.export('plotSize.png'); 
```


<h5>Reference</h5>
<hr />
* [Reference for v1.4](https://github.com/masumhabib/PlotPub/wiki/Reference-for-v1.4)



Given bellow is a brief description of the <code>Plot</code> class and 
<code>setPlotProp</code> and <code>plotPub</code> functions and their 
parameters. This documents can also be viewed by invoking:

```matlab
>> help Plot
>> help setPlotProp
```

from inside the MATLAB command window.

<h5>Plot class</h5>
<hr />

This class represents a MATLAB figure. It can create new plots, open
saved figure files and change properties of opened/existing figures.
It can also export figures as publication quality image files. 
The resolution of the image can be changed by the user. Supported image 
formats are EPS, PDF, PNG, JPEG and TIFF. The figure properties can be 
changed by easy-to-remember class properties.

Constructors:
```matlab
Plot()        
	% Grabs the current figure.
Plot(handle)  
	% Grabs the figure pointed by handle.
Plot('filename.fig') 
	% Opens the figure file ('filename.fig') and use the opened figure.
Plot(handle, holdLine) 
	% Grabs the figure pointed by handle. If holdLine = true, it does not 
	% change the plot properties.
Plot(Y)
	% Plots Y where Y must be a vector.
Plot(X, Y)
	% Plots Y vs X. Both X and Y must be vectors.
Plot(X1, Y1, X2, Y2, ...)
	% Plots Y's vs X's. X's and Y's must be vectors.
```
The constructors return plot objects which can be used for subsequent property 
changes.


Properties:
```matlab
BoxDim          % vector [width, height]: size of the axes box in inches; 
                % default: [6, 2.5]
ShowBox         % 'on' = show or 'off' = hide bounding box
FontName        % string: font name; default: 'Helvetica'
FontSize        % integer; default: 26
LineWidth       % vector [width1, width2, ..]: element i changes the 
                % property of i-th dataset; default: 2
LineStyle       % cell array {'style1', 'style2', ..}: element i changes 
                % the property of i-th dataset; default: '-'
LineCount       % Number of plots (readonly)
Markers         % cell array {'marker1', 'marker2', ..}: element i changes 
                % the property of i-th dataset; default: 'None'
MarkerSpacing   % vector [space1, space2, ..]: element i changes the 
                % property of i-th dataset; default: 0
Colors          % 3xN matrix, [red, green, blue] where N is the number of 
                % datasets.
AxisColor       % axis color, [red, green, blue]; default black.
AxisLineWidth   % axis line width, number; default 2.
XLabel          % X axis label
YLabel          % Y axis label
ZLabel          % Z axis label
XTick           % [tick1, tick2, ..]: major ticks for X axis.
YTick           % [tick1, tick2, ..]: major ticks for Y axis.
ZTick           % [tick1, tick2, ..]: major ticks for Z axis.
XMinorTick      % 'on' or 'off': show X minor tick?
YMinorTick      % 'on' or 'off': show Y minor tick?
ZMinorTick      % 'on' or 'off': show Z minor tick?
TickDir         % tick direction: 'in' or 'out'; default: 'in'
TickLength      % tick length; default: [0.02, 0.02]
XLim            % [min, max]: X axis limit.
YLim            % [min, max]: Y axis limit.
ZLim            % [min, max]: Z axis limit.
XScale          % 'linear' or 'log': X axis scale.
YScale          % 'linear' or 'log': Y axis scale.
ZScale          % 'linear' or 'log': Z axis scale.
XGrid           % 'on' or 'off': show grid in X axis?
YGrid           % 'on' or 'off': show grid in Y axis?
ZGrid           % 'on' or 'off': show grid in Z axis?
XDir            % 'in' or 'out': X axis tick direction
YDir            % 'in' or 'out': Y axis tick direction
ZDir            % 'in' or 'out': Z axis tick direction
Legend          % {'legend1','legend2',...}
LegendBox       % bounding box of legend: 'on'/'off'; default: 'off'
LegendBoxColor  % color of the bounding box of legend; default: 'none'
LegendTextColor % color of the legend text; default: [0,0,0]
LegendLoc       % 'NorthEast', ..., 'SouthWest': legend location
Title           % plot title, string
Resolution      % Resolution (dpi) for bitmapped file. Default:600.
HoldLines       % true/false. true == only modify axes settings, do not 
                % touch plot lines/surfaces. Default false.
```

<h5>function h = setPlotProp(opt, hfig)</h5>
<hr />

This function changes the properties of the figure represented by 'hfig' and 
exports it as a publication quality image file. The resolution of the image can 
be chosen by the user. Supported image formats are EPS, PDF, PNG, JPEG and TIFF. 
The figure properties are specified by the options structure 'opt'.

Parameters:

```matlab
opt             % options structure:
  BoxDim        % vector [width, height]: size of the axes box in inches; default: [6, 2.5]
  ShowBox       % 'on' = show or 'off' = hide bounding box; default: 'on'
  FontName      % string: font name; default: 'Arial'
  FontSize      % integer; default: 26
  LineWidth     % vector [width1, width2, ..]: element i changes the property of i-th dataset; default: 2
  LineStyle     % cell array {'style1', 'style2', ..}: element i changes the property of i-th dataset; default: '-'
  Markers       % cell array {'marker1', 'marker2', ..}: element i changes the property of i-th dataset; default: 'None'
  MarkerSpacing % vector [space1, space2, ..]: element i changes the property of i-th dataset; default: 0
  Colors        % 3xN matrix, [red, green, blue] where N is the number of datasets.
  AxisColor     % [red, green, blue]; color of the axis lines; default: black
  AxisLineWidth % Witdth of the axis lines; default: 2
  XLabel        % X axis label
  YLabel        % Y axis label
  ZLabel        % Z axis label
  XTick         % [tick1, tick2, ..]: major ticks for X axis.
  YTick         % [tick1, tick2, ..]: major ticks for Y axis.
  ZTick         % [tick1, tick2, ..]: major ticks for Z axis.
  XMinorTick    % 'on' or 'off': show X minor tick?
  YMinorTick    % 'on' or 'off': show Y minor tick?
  ZMinorTick    % 'on' or 'off': show Z minor tick?
  TickDir       % tick direction: 'in' or 'out'; default: 'in'
  TickLength    % tick length; default: [0.02, 0.02]
  XLim          % [min, max]: X axis limit.
  YLim          % [min, max]: Y axis limit.
  ZLim          % [min, max]: Z axis limit.
  XScale        % 'linear' or 'log': X axis scale.
  YScale        % 'linear' or 'log': Y axis scale.
  ZScale        % 'linear' or 'log': Z axis scale.
  XGrid         % 'on' or 'off': show grid in X axis?
  YGrid         % 'on' or 'off': show grid in Y axis?
  ZGrid         % 'on' or 'off': show grid in Z axis?
  XDir          % 'in' or 'out': X axis tick direction
  YDir          % 'in' or 'out': Y axis tick direction
  ZDir          % 'in' or 'out': Z axis tick direction
  Legend        % {'legend1','legend2',...}
  LegendBox     % bounding box of legend: 'on'/'off'; default: 'off'
  LegendBoxColor   % color of the bounding box of legend; default: 'none'
  LegendTextColor  % color of the legend text; default: [0,0,0]
  LegendLoc     % 'NorthEast', ..., 'SouthWest': legend location
  Resolution    % Resolution (dpi) for bitmapped file. Default:600.
  HoldLines     % true/false. true == only modify axes settings, do not touch plot lines/surfaces. Default false.
  FileName      % Save? Give a file name.

hfig            % Figure handle (optional). Default: current figure.
```

Return value: figure handle.

<h5>function h = plotPub(X, Y, N, opt)</h5>
<hr />

This function plots <code>X{i}</code> vs <code>Y{i}</code>, changes the 
properties of the generated figure and exports it as a publication quality 
image file. The resolution of the image can be chosen by the user. Supported 
image formats are EPS, PDF, PNG, JPEG and TIFF. The figure properties are 
specified by the options structure 'opt'.

Parameters:

```matlab
X             %cell array of x coordinates
Y             %cell array of y coordinates
N             %number of plots to be created. N &amp;lt;= length(X)
opt           %options structure. Same as above.
```

<h5>Project Page</h5>
<hr />
Please see the <a href="http://masumhabib.com/publication-quality-graphs-matlab">project page</a>.



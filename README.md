PlotPub
=======

<h4>Publication quality graphs in MATLAB.</h4>

MATLAB is an excellent tool. It is equally popular among students, researchers and professors. If you use MATLAB for your project/research, you probably know that it is not easy to create publication quality graphs (PQGs) using MATLAB. You will have to call a billion <code>set</code> and <code>get</code> functions to create a decent plot with desired height, width, fonts, line width, color etc. Here, I present PlotPub which is a set of MATLAB functions that allows you to modify almost all aspects of MATLAB figures and export PQGs using one function call and a simple structure.

<h4>Features of v1.2</h4>
<hr />
<ul>
	<li>Generate beautiful, publication quality graphs from instantly generated MATLAB figures or saved MATLAB fig files.</li>
	<li>Export figures in EPS, PDF, JPEG, PNG and TIFF with adjustable resolution.</li>
	<li>Set marker spacing.</li>
	<li>Change almost all aspects of a figure using simple and intuitive code.</li>
	<li>A lot of example codes. A decent tutorial and good documentation.</li>
	<li>Tested in Ubuntu and OSX with MATLAB 7.10. But it should work in other operating systems with other versions of MATLAB.</li>
	<li>Distributed under BSD license which allows you to do anything you like.</li>
</ul>

<h4> Compatibility with v1.1</h4>
<hr />
In version 1.2, I introduced a new function <code>setPlotProp</code> which is superior to the old function <code>plotPub</code>. But for backward compatibility, <code>plotPub</code> is still available in v1.2. Therefore, all of your previous codes should work with v1.2.

<h4>Downloads</h4>
<hr />
<ul>
	<li><a href="https://github.com/masumhabib/plotPub/archive/master.zip">Compressed package</a></li>
	<li><a href="https://github.com/masumhabib/plotPub">GitHub repository</a></li>
</ul>

<h4>Installation</h4>
<hr />
Download and extract the zip file from the link given above. Install PlotPub using any one of the three possible ways: (1) copy all the *.m files inside the <code>lib</code> folder to either your MATLAB path or (2) copy those files to your current project folder or (3) put plotPub-master in any convenient folder and add the following line in your MATLAB code:

[matlab]
addpath('D:/MATLAB/plotPub-master');
[/matlab]
where, I assume that you put plotPub-master in <code>D:/MATLAB</code> folder. The sample codes can be found inside the <code>examples</code> folder.

<h4>Installation</h4>
<hr />
Please see the <a href="http://masumhabib.com/publication-quality-graphs-matlab">project page</a>.

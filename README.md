plotPub
=======

Publication quality graphs in MATLAB. 

MATLAB is an excellent tool. It is equally popular among students, researchers and professors. If you use MATLAB for your project/research, you probably know that it is not easy to create publication quality graphs (PQGs) using MATLAB. You will have to call a billion functions to create a decent plot, fix its height and width, set fonts and font sizes, fix line width and color etc. Although there are some <a href="http://blogs.mathworks.com/loren/2007/12/11/making-pretty-graphs/">tutorials</a> and <a href="http://www.mathworks.com/matlabcentral/fileexchange/31668-publication-quality-plots">codes</a> available for creating PQGs, I did not find a decent, reusable and feature rich code. Below, I will share and show a MATLAB function that allows you to create PQGs and modify almost all aspects of it using a simple MATLAB structure.

<h4> Code </h4>
The main code is just one function, <a href='http://masumhabib.com/wp-content/uploads/2012/11/plotPub.zip'><code>plotPub</code></a>. I have also prepared some <a href='http://masumhabib.com/wp-content/uploads/2012/11/sampleCode.zip'>sample codes</a>. These codes produce publication quality <code>eps</code> files. <code>EPS</code> is a vector graphics format, compatible with LaTex and can be modified using vector graphics editors such as <a href="http://inkscape.org/">Inkscape</a> and <a href="http://www.adobe.com/products/illustrator.html">Adobe Illustrator</a>.

To fix some issues with MATLAB post script line styles, I have used <a href='http://masumhabib.com/wp-content/uploads/2012/11/fixPSlinestyle.zip'>fixPSlinestyle</a> function availabe in <a href="http://www.mathworks.com/matlabcentral/fileexchange/17928-fixpslinestyle">MATLAB Central</a>.

I have tested these codes under Ubuntu 12.04 in MATLAB 7.10. But it should work under Windows and Mac OSX with other MATLAB versions as well.

All the codes provided here are distributed under BSD license which basically allows you to do anything you like. You can use, modify and/or redistribute it for free or for some cash and become a millionaire :D.

<h4>Installation</h4>
In order to use the <code>plotPub</code> function you have to unzip <code>plotPub.zip</code> and <code>fixPSlinestyle.zip</code> files, copy <code>plotPub.m</code> and <code>fixPSlinestyle.m</code> files to either your MATLAB path or your current working folder.


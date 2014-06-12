function fixPSlinestyle(varargin)

%FIXPSLINESTYLE Fix line styles in exported post script files
%
% FIXPSLINESTYLE(FILENAME) fixes the line styles in the postscript file
%   FILENAME. The file will be over-written. This takes a .PS or .EPS file
%   and fixes the dotted and dashed line styles to be a little bit more
%   esthetically pleasing. It fixes the four default line styles (line,
%   dotted, dashed, dashdot).
%
% FIXPSLINESTYLE(FILENAME, NEWFILENAME) creates a new file NEWFILENAME.
%
%   This is meant to be used with postscript files created by MATLAB
%   (print, export).
%
% Example:
%   x  = 1:.1:10;
%   y1 = sin(x);
%   y2 = cos(x);
%   h  = plot(x, y1, '--', x, y2, '-.');
%   set(h, 'LineWidth', 2);
%   grid on;
%   legend('line 1', 'line2');
%
%   print -depsc test.eps
%   fixPSlinestyle('test.eps', 'fixed_test.eps');
%
% See also PRINT.

% Copyright 2005-2010 The MathWorks, Inc.

% Error checking
error(nargchk(1, 2, nargin));
if ~ischar(varargin{1}) || (nargin == 2 && ~ischar(varargin{2}))
  error('Input arguments must be file names (char).');
end

% Make sure the files specified are postscript files
[p1, n1, e1] = fileparts(varargin{1});
if isempty(e1) || ~ismember(lower(e1), {'.ps', '.eps'})
  error('The extension has to be .ps or .eps');
end

% Open file and read it in
fid = fopen(varargin{1}, 'r');
str = fread(fid);
str = char(str');
fclose(fid);

% Find where the line types are defined
id   = findstr(str, '% line types:');
str1 = str(1:id-1);
[line1     , remline ] = strtok(str(id:end), '/');
[replacestr, remline2] = strtok(remline    , '%');

% Define the new line styles
solidLine   = sprintf('/SO { [] 0 setdash } bdef\n');
dotLine     = sprintf('/DO { [3 dpi2point mul 3 dpi2point mul] 0 setdash } bdef\n');
dashedLine  = sprintf('/DA { [6 dpi2point mul] 0 setdash } bdef\n');
dashdotLine = sprintf('/DD { [2 dpi2point mul 2 dpi2point mul 6 dpi2point mul 2 dpi2point mul] 0 setdash } bdef\n');

% Construct the new file with the new line style definitions
newText     = [str1, line1, solidLine, dotLine, dashedLine, dashdotLine, remline2];

% Check for output file name
if nargin == 2
  [p2, n2, e2] = fileparts(varargin{2});
  if isempty(e2)
    fname = fullfile(p2, [n2, e1]);
  else
    if strcmpi(e1, e2)
      fname = varargin{2};
    else
      error('Output file must have same file extension.');
    end
  end
else % if not defined, over-write
  fname = varargin{1};
end

% Write out to file
fid = fopen(fname, 'w');
fprintf(fid, '%s', newText);
fclose(fid);
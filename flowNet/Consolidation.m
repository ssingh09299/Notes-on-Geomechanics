% This script is written and read by pdetool and should NOT be edited.
% There are two recommended alternatives:
% 1) Export the required variables from pdetool and create a MATLAB script
%    to perform operations on these.
% 2) Define the problem completely using a MATLAB script. See
%    http://www.mathworks.com/help/pde/examples/index.html for examples
%    of this approach.
function Consolidation
[pde_fig,ax]=pdeinit;
pdetool('appl_cb',1);
pdetool('snapon','on');
set(ax,'DataAspectRatio',[20 20 1]);
set(ax,'PlotBoxAspectRatio',[1 0.52534113060428844 0.52534113060428844]);
set(ax,'XLim',[-20 20]);
set(ax,'YLim',[-5 35]);
set(ax,'XTick',[ -40,...
 -39,...
 -38,...
 -37,...
 -36,...
 -35,...
 -34,...
 -33,...
 -32,...
 -31,...
 -30,...
 -29,...
 -28,...
 -27,...
 -26,...
 -25,...
 -24,...
 -23,...
 -22,...
 -21,...
 -20,...
 -19,...
 -18,...
 -17,...
 -16,...
 -15,...
 -14,...
 -13,...
 -12,...
 -11,...
 -10,...
 -9,...
 -8,...
 -7,...
 -6,...
 -5,...
 -4,...
 -3,...
 -2,...
 -1,...
 0,...
 1,...
 2,...
 3,...
 4,...
 5,...
 6,...
 7,...
 8,...
 9,...
 10,...
 11,...
 12,...
 13,...
 14,...
 15,...
 16,...
 17,...
 18,...
 19,...
 20,...
 21,...
 22,...
 23,...
 24,...
 25,...
 26,...
 27,...
 28,...
 29,...
 30,...
 31,...
 32,...
 33,...
 34,...
 35,...
 36,...
 37,...
 38,...
 39,...
 40,...
]);
set(ax,'YTick',[ -5,...
 -4,...
 -3,...
 -2,...
 -1,...
 0,...
 1,...
 2,...
 3,...
 4,...
 5,...
 6,...
 7,...
 8,...
 9,...
 10,...
 11,...
 12,...
 13,...
 14,...
 15,...
 16,...
 17,...
 18,...
 19,...
 20,...
 21,...
 22,...
 23,...
 24,...
 25,...
 26,...
 27,...
 28,...
 29,...
 30,...
 31,...
 32,...
 33,...
 34,...
 35,...
]);
pdetool('gridon','on');

% Geometry description:
pderect([-15 15 0 30],'SQ1');
set(findobj(get(pde_fig,'Children'),'Tag','PDEEval'),'String','SQ1')

% Boundary conditions:
pdetool('changemode',0)
pdesetbd(4,...
'neu',...
1,...
'0',...
'0')
pdesetbd(3,...
'dir',...
1,...
'1',...
'0')
pdesetbd(2,...
'neu',...
1,...
'0',...
'0')
pdesetbd(1,...
'dir',...
1,...
'1',...
'0')

% Mesh generation:
setappdata(pde_fig,'Hgrad',1.3);
setappdata(pde_fig,'refinemethod','regular');
setappdata(pde_fig,'jiggle',char('on','mean',''));
setappdata(pde_fig,'MesherVersion','preR2013a');
pdetool('initmesh')
pdetool('refine')
pdetool('refine')
pdetool('refine')
pdetool('jiggle')

% PDE coefficients:
pdeseteq(2,...
'1.0',...
'0.0',...
'0',...
'1',...
'0:1000',...
'1000',...
'0.0',...
'[0 100]')
setappdata(pde_fig,'currparam',...
['1.0';...
'0.0';...
'0  ';...
'1  '])

% Solve parameters:
setappdata(pde_fig,'solveparam',...
char('0','31008','10','pdeadworst',...
'0.5','longest','0','1E-4','','fixed','Inf'))

% Plotflags and user data strings:
setappdata(pde_fig,'plotflags',[1 1 1 1 1 1 1 1 1 0 1 1001 1 1 0 1 0 1]);
setappdata(pde_fig,'colstring','');
setappdata(pde_fig,'arrowstring','');
setappdata(pde_fig,'deformstring','');
setappdata(pde_fig,'heightstring','');

% Solve PDE:
pdetool('solve')

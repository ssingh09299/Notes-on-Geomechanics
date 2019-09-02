% --------------------------- Granular Mechanics Lab ------------------------
% Written by - Saurabh, Indian Institute of Science
%% Cam Clay surface

key = 0; % key - 0 for original cam-clay and nonzero for modified

% parameters
M = 1.0; pc = 50;

% domain of stress-space
SMin = min([-pc/5,-6]); SMax = 1.5*pc; number = 200;

% mesh grid for stress-space
[a1,a2,a3] = meshgrid(linspace(SMin,SMax,number));

% principal invariants of stresses calculated at each point of grid
I1 = a1+a2+a3; 
I2 = a1.*a2+a2.*a3+a3.*a1; 
I3 = a1.*a2.*a3; 

% Deviatoric and mean effective stress
q = sqrt(I1.^2-3*I2); 
p = I1/3;
% f is the failure criteria
switch key
    case 0
        f=q+M*p.*log(p/pc);
    otherwise
        f = (q/(M*pc/2)).^2+((p-(pc/2))./(pc/2)).^2-1;
end

% Now we have the failure function calculated at each point in the domain
% of the stress space
% failure function has a value at each point in stress-space
% we want the locus of all the point having zero function value use
% isosurface for the same

[faces1,verts1,colors1] = isosurface(a1,a2,a3,f,0,a1);
% patch is used to provide different specification for the function
hp1 = patch('Vertices', verts1, 'Faces', faces1, ...
    'FaceVertexCData', colors1, ...
    'FaceColor','r', ...
    'edgecolor', 'k','FaceAlpha',1.0);

% chosing the shading type below (flat, faceted, interp)
shading flat
colormap(cool);

% view to look from the hydrostatic axis
view(20,0);

% lighting and camera
camlight
lighting gouraud
hold on

% plotting the x, y,z axis with hydrostatic line
arrow3([SMin,SMin,SMin],[SMax,SMax,SMax],'c-4',3,6)
text(SMax,SMax,SMax,'I_1','FontSize',24.0)
% axis limits
axis([SMin SMax SMin SMax SMin SMax])
% arrow for the axes
arrow3([0,0,0],[SMax,0,0],'r-2',3,6)
arrow3([0,0,0],[0,SMax,0],'g-2',3,6)
arrow3([0,0,0],[0,0,SMax],'b-2',3,6)
text(SMax,0,0,'\sigma_1','FontSize',24.0)
text(0,SMax,0,'\sigma_2','FontSize',24.0)
text(0,0,SMax,'\sigma_3','FontSize',24.0)
grid on
hold on
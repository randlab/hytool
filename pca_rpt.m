function pca_rpt(p,t,s,ttle)
%PCA_RPT - Produces the final figure and results for the Papadopulos Cooper model
%                
% Syntax: pca_rpt(p,t,s,ttle )
%
%   p(1) = a  = slope of the late time straight line
%   p(2) = t0 = intersept of late time straight line
%   t = measured time
%   s = measured drawdown
%   ttle = Title of the figure 
%
% Description:
%   Produces the final figure and results for the Papadopulos-Cooper model
%   in the aquifer
%
% See also: pca_dmo, pca_pre, pca_dim, pca_gss
%



global PCA_RW PCA_RC PCA_R PCA_Q

if(  isempty(PCA_RW) )
    disp(' ERROR: pca_rpt: You must run PCA_PRE before using the pca model')
    return;
end
if(nargin==3) % Default value for d if not given by user
  ttle='Diagnostic plot';
end

% Rename the parameters for a more intuitive check of the formulas
rw=PCA_RW; rc=PCA_RC; r=PCA_R; q=PCA_Q;
a=p(1); t0=p(2);

T=0.1832339*q/a;     % Compute the transmissivity
S=2.25*T*t0/r.^2;    % Compute the storativity
cd=rc.^2/2/rw.^2/S;  % Compute the wellbore storage coefficient Cd

% Calls a internal script to compute drawdown, derivative, and residuals
func='pca'; rpt_cmp

% Defines the text of the left side of the legend 
lgdl=char('Test data:');
lgdl=char(lgdl, sprintf(' Discharge rate: %3.2e m^3/s',q));
lgdl=char(lgdl, sprintf(' Well radius: %0.2g m',rw));
lgdl=char(lgdl, sprintf(' Casing radius: %0.2g m',rc));
lgdl=char(lgdl, sprintf(' Distance to pumping well: %0.2g m',r));
lgdl=char(lgdl, 'Hydraulic parameters:');
lgdl=char(lgdl, sprintf(' Transmissivity T: %3.1e m^2/s',T));
lgdl=char(lgdl, sprintf(' Storativity S: %3.1e',S));
lgdl=char(lgdl, sprintf(' Wellbore storage C_D: %3.1e',cd));

% Defines the text of the right side of the legend 
lgdr=char('Papadopulos-Cooper (1967) Model');
lgdr=char(lgdr, sprintf(' '));
lgdr=char(lgdr, 'Fitting parameters:');
lgdr=char(lgdr, sprintf(' slope a: %0.2g m',a));
lgdr=char(lgdr, sprintf(' intercept t0: %0.2g m',t0));
lgdr=char(lgdr, sprintf(' '));
lgdr=char(lgdr, sprintf(' mean residual: %0.2g m',mr));
lgdr=char(lgdr, sprintf(' 2 standard deviation: %0.2g m',sr));

% Calls an internal script that place the legend
rpt_lgd

% Calls an internal script that plot the model and the data
rpt_plt
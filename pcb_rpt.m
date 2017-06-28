function pcb_rpt(p,t,s,ttle)
%PCB_RPT - Produces the final figure and results for the Papadopulos Cooper model with independent wellbore storage
%                
% Syntax: pcb_rpt(p,t,s,ttle )
%
%   p(1) = a  = slope of the late time straight line
%   p(2) = t0 = intersept of late time straight line
%   t = measured time
%   s = measured drawdown
%   ttle = Title of the figure 
%
% Description:
%   Produces the final figure and results for the Papadopulos-Cooper model
%   with independent wellbore storage
%
% See also: pcb_dmo, pcb_pre, pcb_dim, pcb_gss
%



global PCB_RW PCB_RC PCB_RD PCB_R PCB_Q

if(  isempty(PCB_RD) )
    disp(' ERROR: pcb_rpt: You must run PCB_PRE before using the pcb model')
    return;
end
if(nargin==3) % Default value for ttle if not given by user
  ttle='';
end

% Rename the parameters for a more intuitive check of the formulas
rw=PCB_RW; rc=PCB_RC; r=PCB_R; rd=PCB_R; q=PCB_Q;
a=p(1); t0=p(2); cd=p(3);

T=0.1832339*q/a;     % Compute the transmissivity
S=2.25*T*t0/r.^2;    % Compute the aquifer storativity
S2=rc.^2/2/rw.^2/cd; % Calculation of local storativity S2

% Calls a internal script to compute drawdown, derivative, and residuals
func='pcb'; rpt_cmp

% Defines the text of the left side of the legend 
lgdl=char('Test data:');
lgdl=char(lgdl, sprintf(' Discharge rate: %3.2e m^3/s',q));
lgdl=char(lgdl, sprintf(' Well radius: %0.2g m',rw));
lgdl=char(lgdl, sprintf(' Casing radius: %0.2g m',rc));
lgdl=char(lgdl, sprintf(' Distance to pumping well: %0.2g m',r));
lgdl=char(lgdl, sprintf(' '));
lgdl=char(lgdl, 'Hydraulic parameters:');
lgdl=char(lgdl, sprintf(' Transmissivity T: %3.1e m^2/s',T));
lgdl=char(lgdl, sprintf(' Aquifer storativity S: %3.1e',S));
lgdl=char(lgdl, sprintf(' Wellbore storage C_D: %3.1e',cd));
lgdl=char(lgdl, sprintf(' Well surroundings storativity S: %3.1e',S2));

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

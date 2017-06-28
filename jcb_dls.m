function [s,d] = jcb_dls(td)
%JCB_DLS - Jacob dimensionless drawdown
%
% Syntax: [s,d] = jcb_dls(td)
%
% Description:
%   provides the dimensionless drawdown and derivative at reduced time td
%
% See also: jcb_dmo
%


s=0.5*(log(4*td)-0.5772);

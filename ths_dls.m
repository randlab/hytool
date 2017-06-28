function [sd,dd] = ths_dls(td)
%THS_DLS - Dimensionless drawdown of the Theis model
%
% Syntax: [sd,dd] = ths_dls(td)
%
% Description:
%   Calculates the dimensionless drawdown sd and the dimensionless 
%   derivative dd for a given dimensionless reduced time td/rd^2
%
% See also: ths_lap
%

td=.25./td;
sd=0.5*expint(td);
dd=0.5*exp(-td);

% Alternative calculation with Laplace inversion

%s=stefhest('ths_lap',[],t);
%d=stefhest('ths_der',[],t);

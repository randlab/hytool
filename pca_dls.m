function [s,ds] = pca_dls( x, t)
%PCA_DLS - Papadopulos-Cooper dimensionless solution in the aquifer
%
% Syntax: [s,ds] = pca_dls( x, t)
%
%   x(1) = Cd
%   x(2) = rd
%   t = time 
%
% Description:
%   Calculates the dimensionless drawdown s and the dimensionless 
%   derivative ds for a given dimensionless reduced time td/rd^2
%
% See also: pca_lap
%


s=stefhest('pca_lap',x,t,16);
ds=stefhest('pca_der',x,t,16);

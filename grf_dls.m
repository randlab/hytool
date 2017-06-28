function sd=grf_dls(x,td)
%GRF_DLS - Barker (1988) general radial flow model
%
% Syntax: sd=grf_dls(x,td)
%
%   Dimensionless solution :
%   x(1) = n is the fractional flow dimension
%   x(2) = rD is the dimensionless distance to the well
%   td is the dimensionless time
%
% Description:
%   This function computes the dimensionless drawdown as a function of
%   dimensionless time for a constant rate intereference test 
%   with the General Radial Flow model of Barker (1988). This solution is
%   a generalisation of flow equation in 1D, 2D, 3D and non integer flow
%   dimension.
%
%  Reference:
%   Barker, J.A. 1988. A Generalized radial flow model fro hydraulic tests
%   in fractured rock. Water Resources Research 24, no. 10: 1796-1804.  
%
%  WARNING: The function  grf_pre  must be used to initialize 
%   the pumping rate history before making any call to grf_dim or grf_rpt.
%
% See also: grw_drw, grf_lap

sd=stefhest('grf_lap',x,td);

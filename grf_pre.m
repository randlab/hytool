function grf_pre( r, rw)
%GRF_PRE - Calculates the input vector for grf
%
% Syntax: grf_pre( r, rw)
%
%   r  = distance between the observation well and the pumping well
%   rw = radius of the pumping well
%
% Description:
%   grf stands for Barker (1988) solution for a general radial flow
%   pumping test. The function  grf_pre  must be used to initialize 
%   the pumping rate history before making any call to grf_dim or grf_rpt.
%
% See also: grf_dmo, grf_dim, grf_rpt, grf_gss
%


global GRFRADIUS GRFWELLRADIUS GRFWELLDIMENSIONLESSRADIUS

GRFRADIUS=r;
GRFWELLRADIUS=rw;
GRFWELLDIMENSIONLESSRADIUS=r./rw;
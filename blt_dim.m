function [sd] = blt_dim( p, t)
%BLT_DIM(p,t) Boulton (1963) model for unconfined aquifer
%
%   Syntax: s = blt_dim(p,t)
%
%       p = vector of the parameters
%        
%       p(1) = a : slope of the late time Jacob's straight line in m
%       p(2) = t0 : intercept with the horizontal axis for s = 0
%       p(3) = t1
%       p(4) = phi
%       t    = dimensionless time 
%
%       t = time in seconds
%       s = drawdown in meters
%
%
%   Description:
%    Computes drawdon in the aquifer for a constant rate pumping test.
%    The aquifer is unconfined and homogeneous.
%
%   See also: blt_rpt, blt_gss
%

td=0.445268.*t./p(2);
sd=0.868589.*p(1).*blt_dls([p(2)./(p(2)+p(3)),2*p(4)*p(2)],td);

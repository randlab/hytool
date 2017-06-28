function s = nsl_dim( p, t)
%NSL_DIM - Neuzil (1982) solution for a slug test (pulse)
% 
% Syntax: s = nsl_dim( p, t)
%
%   p(1) = Cd = dimensionless well bore storage coefficient
%   p(2) = t0 = time such that t0 = rc^2 / ( 2T )
%
%   t = time 
%
% Description:
%   The aquifer is supposed to be confined, the well fully 
%   penetrating and the slug injection or withdrawal is 
%   supposed to be instantaneous.
%
%   NB: Modified from Cooper et al. (1967) solution for a slug test.
%   Note that in the original publication of Cooper et al.
%   The dimensionless parameter was alpha, it is related to 
%   Cd by: alpha = 1 / (2 Cd)
%
% Example:
%   s=nsl_dim(p,t);
%
% See also: nsl_dmo, nsl_rpt, nsl_gss

cd=p(1);
t0=p(2);

s=nsl_dls(cd,t./t0);         %calls dimensionless solution sd = nsl_dls( cd, t) 
                               %within s = nsl_dim( p, t): t = time
                               %within sd= nsl_dls(cd, t): t= dimensionless
                               %time (=t/t0)

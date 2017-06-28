function s = csl_dim( p, t)
%CSL_DIM - Cooper et al. (1967) solution for a slug test
% 
%   Syntax: s = csl_dim( p, t)
%    p(1) = Cd = dimensionless well bore storage coefficient
%    p(2) = t0 = time such that t0 = rc^2 / ( 2T )
%    t = time in s
%
%   Description:
%    Conputes the normalized drawdown (Delta h / Delta h0) as a function of
%    time with the Cooper et al. (1967) solution for a slug test in a
%    homogeneous confined aquifer. The well is fully penetrating and the
%    slug injection or withdrawal is instantaneous.   
%
%    The dimensionless well bore storage coefficient is:
%
%    Cd = rc^2/(2 rw^2 S) 
%
%    NB: Note that in the original publication of Cooper et al.
%    The dimensionless parameter was alpha, it is related to 
%    Cd by: alpha = 1 / (2 Cd)
%
%    Reference: Cooper, H.H.J., J.D. Bredehoeft, and I.S. Papadopulos.
%    1967. Response of a finite-diameter well to an instantaneous charge of
%    water. Water Resources Research 3, no. 1: 263-269. 
%
%   See also: csl_pre, csl_rpt, csl_gss, csl_dmo

cd=p(1);
t0=p(2);

s=csl_dls(cd,t./t0);

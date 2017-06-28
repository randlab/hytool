function sd = csl_dls( cd, t )
%CSL_DLS - Cooper et al. (1967) dimensionless solution for a slug test
%
% Syntax: sd = csl_dls( cd, t )
%
%   cd = Dimensionless well bore storage 
%   t  = Dimensionless time  = td / cd = 2 T t / rc^2
%
% Description:
%    Conputes the normalized drawdown (Delta h / Delta h0) as a function of
%    dimensionless time with the Cooper et al. (1967) solution for a slug test in a
%    homogeneous confined aquifer. The well is fully penetrating and the
%    slug injection or withdrawal is instantaneous.   
%
%    The dimensionless well bore storage coefficient is:
%
%    Cd = rc^2/(2 rw^2 S)
%
%    Reference: Cooper, H.H.J., J.D. Bredehoeft, and I.S. Papadopulos.
%    1967. Response of a finite-diameter well to an instantaneous charge of
%    water. Water Resources Research 3, no. 1: 263-269. 
%
% See also: csl_lap, csl_drw

td=t*cd;
sd=stefhest('csl_lap',cd,td,16);
%sd=dehoog('csl_lap',cd,td);

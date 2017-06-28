function sd = nsl_dls( cd, t )
%NSL_DLS - Neuzil (1982) dimensionless solution for a slug test (pulse)
%
% Syntax: sd = nsl_dls( cd, t )
%
%   cd = Dimensionless well bore storage 
%   t  = Dimensionless time  = td / cd = 2 T t / rc^2
%
% Description:
%   
%
% See also: nsl_lap
%


td=t*cd;
sd=stefhest('nsl_lap',cd,td);

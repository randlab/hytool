function q = jlq_dls( x, t)
%JLQ_DLS - Jacob & Lohman (1952) dimensionless solution in the well
%
% Syntax: q = jlq_dls( x, t)
%
%   t = time 
%
% Description:
%   Dimensionless solution at the pumping well
%
% See also: jlq_lap
%


q=stefhest('jlq_lap',x,t,16);

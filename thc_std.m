function q=thc_std( l, T, r0 )
%THC_STD - Computes discharge rate for a well close to a constant head boundary
%
% Syntax: q = thc_std( l, T, r0 )
%
%   l  = Distance to the hydraulic boundary
%   T  = Transmissivity
%   r0 = radius of the well
%
%   Nota : the head difference is supposed to be l
%
% Description:
%   The flow field is a half infinite space with a constant head boundary.
%   The aquifer is supposed to be confined, homogeneous and the well fully
%   penetrating the aquifer.
%
%   The calculation is based on the Dupuit's solution with an image well.
%   This equation is also known as the Goodman formula (1965).
%
% Reference:
%   Goodman, R., 1965. Groundwater inflows during tunnel driving.
%   Engineering Geology, 2(2): 39-56. 
%
% Example:
%   q=thc_std(100,1e-2,10)
%
% See also: lei_std, thn_std, thc_dim, thc_dmo


q=2*pi*T*l/(log(2*l/r0));
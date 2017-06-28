function [s,d] = pcw_dim( p, t)
%PCW_DIM - Papadopulos Cooper (1967) solution 
%
% Syntax: [s,d] = pcw_dim( p, t)
%
%   p(1) = a  = slope of late time straight line
%   p(2) = t0 = intercept of late time straight line
%   p(3) = Cd = dimensionless well-bore storage coefficient
%
%   t = time
%   s = drawdonw
%   d = derivative
%  
% Description:
%    Conputes the drawdown as a function of time with the Papadopulos and 
%    Cooper (1967) solution for a pumping test in a large diameter well.
%    The aquifer is confined and homogeneous. The well is fully penetrating 
%    and the pumping rate constant.   
% 
% 
%    The solution is parametrized as a function of a, to and Cd.
%
%    The dimensionless well bore storage coefficient is:
%
%     Cd = rc^2/(2 rw^2 S)
%
%    a and to are the slope and time intercept of the late time straight
%    line asymptotes.
%
%     a = 0.183 Q /T
%     t0 = 2.25 T t / r2 S
%
%    NB: Note that in the original publication of Cooper et al.
%    The dimensionless parameter was alpha, it is related to 
%    Cd by: alpha = 1 / (2 Cd)
% 
%    Reference: Papadopulos, I.S., and H.H.J. Cooper. 1967. Drawdown in a
%    well of large diameter. Water Resources Research 3, no. 1: 241-244. 
%
% Example:
%   s=pcw_dim(p,t)
%
% See also: pcw_dmo, pcw_rpt, pcw_gss
%



a=p(1);
t0=p(2);
cd=p(3);

[s,d]=pcw_dls(cd,0.445268.*t./t0);

s=0.868589.*a.*s;
d=0.868589.*a.*d;

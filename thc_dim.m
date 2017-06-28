function s = thc_dim(p,t)
%THC_DIM - Theis (1941) model with a constant head boundary.
%
% Syntax: s = thc_dim(p,t)
%
%   p(1) = a  = slope of Jacob Straight Line
%   p(2) = t0 = intercept of the first segment of straight line
%   p(3) = ti = time of intersection between the 2 straight lines
%
% Description:
%   Computes the drawdown at time t for a constant rate pumping test in 
%   a homogeneous confined aquifer bounded by a constant head boundary.
%
%  Reference: Theis, C.V., 1941. The effect of a well on the flow of a
%  nearby stream. Transactions of the American Geophysical Union, 22(3):
%  734-738.  
%
% Example:
%   s = thc_dim(p,t)
%
% See also: thc_dmo, thc_gss, thc_rpt

a=p(1);
s=ths_dim([a,p(2)],t) - ths_dim([a,p(3)],t);

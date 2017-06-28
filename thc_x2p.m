function x = thc_x2p(p)
%THC_X2P - Conversion of parameters for constant head case
%
% Syntax: p = thc_x2p(x)
%
%   p(1) = sl  = late time drawdown at the plateau
%   p(2) = du  = maximum derivative 
%   p(3) = tu  = time of the maximum
%
%   x(1) = a   = slope of Jacob straight line
%   x(2) = t0  = intercept of the first Jacob straight line
%   x(3) = t1  = intercept of the second Jacob straight line
%
% Description:
%
%
% See also:
%


sl=p(1);
du=p(2);
tu=p(3);

rd=thc_ird(sl./du);
x(1)=0.5.*sl./log10(rd);
x(2)=2./0.5626.*tu.*log(rd)./(rd.^2-1);
x(3)=rd.^2.*x(2);

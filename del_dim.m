function s = del_dim( p, t)
%DEL_DIM - Computes drawdown in the aquifer with Delay et al. (2004) solution.
%
% Syntax: s = del_dim( p, t)
%
%   p(1) = a = 0.183 Q / To
%   p(2) = t0 = r2 S / 2.25 To
%   p(3) = alpha
%   p(4) = gamma
%   t = time 
%   s = drawdown 
%
% Description:
%   The model of Delay et al. (2004) allows computing the drawdown in the 
%   aquifer (interference test) for a constant rate pumping test in a 
%   fractured aquifer that shows fractal behaviour. 
%
%  Reference: 
%  Delay, F., G. Porel, and S. Bernard. 2004. Analytical 2D model to invert
%  hydraulic pumping tests in fractured rocks with fractal behavior. Water
%  Resources Research 31, no. L16501: doi:10.1029/2004GL020500.  
%
% See also: del_dmo, del_rpt

a=p(1);
t0=p(2);
alpha=p(3);
gamma=p(4);

s=a.*power(t,alpha).*log10(power(t,1-alpha+gamma)./t0);

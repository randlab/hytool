function s = eha_dim( p, t)
%EHA_DIM - Computes drawdown for step-drawdown tests according to Eden-Hazel (1973) 
%
% Syntax: s = eha_dim( p, t)
%
%   p(1) = a  = slope of late time straight line in m
%   p(2) = A1 = intercept of the first straight line (at Hn=0) in m
%   p(3) = A2 = intercept of the second straight line (at Hn=0) in m
%   p(4) = A2 = intercept of the second straight line (at Hn=0) in m
%   etc.
%
%   t = measured time 
%   s = drawdown
%
% Description: 
%   Computes the drawdown for a step drawdown test with the Eden and Hazel
%   (1973) method. This solution consists in a series of straight lines
%   having all the same slope (a) and different intercepts for each steps
%   corresponding to a different pumping rate.
%
%   As opposed to the Jacob straight line, the intercepts corresponds to
%   the value of the drawdown obtained when the straight line toward is
%   extended and crosses the vertical axis at Hn=0.
%
%   Hn is a reduced time that accounts for all the variations of pumping
%   rates. Hn is calculated by the eha_pre function.
%
% WARNING: eha_dim can be used only if eha_pre has been called before, in
%    order to initialize the pumping rate history.
%
% See also: eha_dmo, eha_pre, eha_gss, eha_rpt

global EHA_MATRIX
if(  isempty(EHA_MATRIX) ) 
    disp(' ERROR: eha_dim: You must run EHA_PRE before using the eha model')
    return;
end

d=EHA_MATRIX;

s=eha_cmp(p,d);
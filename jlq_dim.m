function q = jlq_dim( p, t)
%JLQ_DIM - Jacob & Lohman (1952) discharge solution in the well
%
% Syntax: q = jlq_dim( p, t) 
%
%   p(1) = b  = slope of normalized Jacob Straight Line = (0.183 / (T s0) )
%   p(2) = t0 = intercept with the horizontal axis for s = 0
%
%   t = time
%   s = drawdown
%   d = derivative
%
% Description:
%   Calculate the discharge at time t with Jacob & Lohman (1952) solution
%
% Example:
%   q=jlq_dim(p,t);
%
% See also: jlq_dmo, jlq_rpt, jlq_gss

td=t./4./exp(-psi(1))./p(2);
q=log(10)/2.*jlq_dls(p,td)./p(1);

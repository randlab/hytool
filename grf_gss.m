function [p] = grf_gss( t, s )
%GRF_GSS - First guess for the Barker model
%
% Syntax: p = grf_gss(t,s)
%
%   p(1) = a  = slope of Jacob straight line for late time
%   p(2) = t0 = intercept with the horizontal axis for s = 0
%   p(3) = n  = flow dimension
%
%   t    = time
%   s    = drawdown
%
% Description:
%   First guess for the parameters of Barker solution.
%
%   WARNING: Before using grf_gss, use grf_pre to initialize the model
%
% See also: grf_dim, grf_dmo, grf_rpt, grf_pre
%


global GRFRADIUS GRFWELLRADIUS GRFWELLDIMENSIONLESSRADIUS

if(  GRFRADIUS == [] ) % NE MARCHE PAS - TROUVER UNE SOLUTION !
    disp(' ERROR: grf_gss: You must run GRF_PRE before using the grf model')
    p=[];
    return;
end

% L'étude des assymptotes doit être refaite avec la nouvelle normalisation.
% n=round(size(t,1)./3);
% [td,ds]=ldiffs(t(n:end),s(n:end),20); % Calculation of the log-derivative
% tmp=lin_fit(log(td),log(ds));         % A straight line derivative gives alpha and a
% v=tmp(1);
% n=2-2*v;
% 
% if( (n>0) && (n<2) )
%     te=td(end);
%     se=interp1(t,s,te);
%     B=log10(se./ds(end));
%     a=1;
%     t0=te*(a*2.^(1-n)./ds(end)./gamma(n./2)).^(-2./(n-2));
%     p(1)=a;
%     p(2)=t0;
%     p(3)=n;
% else
%     n=2;
%     p=ths_gss(t,s);
%     p(2)=p(2)*(GRFWELLRADIUS/GRFRADIUS).^2;
%     p(3)=n;
% end

n=2;
p=ths_gss(t,s);
p(2)=p(2)*(GRFWELLRADIUS/GRFRADIUS).^2;
p(3)=n;
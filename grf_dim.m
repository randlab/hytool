function s=grf_dim(p,t)
%GRF_DIM - Barker (1988) general radial flow model
%
% Syntax: s = grf_dim(p,d)
%   p(1) = a in [m] = equivalent of the slope of Jacob model 
%   p(2) = t0 in [s] = equivalent of the time of Jacob model
%   p(3) = n [-] = the fractional flow dimension
%
% Description:
%   This function computes drawdown for a constant rate intereference test
%   with the General Radial Flow model of Barker (1988). This solution is
%   a generalisation of flow equation in 1D, 2D, 3D and non integer flow
%   dimension.
%
%  Reference:
%   Barker, J.A. 1988. A Generalized radial flow model fro hydraulic tests
%   in fractured rock. Water Resources Research 24, no. 10: 1796-1804.  
%
%  WARNING: The function  grf_pre  must be used to initialize 
%   the pumping rate history before making any call to grf_dim or grf_rpt.
%
% Example:
%   s=grf_dls(p,d);
%
% See also: grf_dmo, grf_pre, grf_rpt, grf_gss


global GRFRADIUS GRFWELLRADIUS GRFWELLDIMENSIONLESSRADIUS

if(  isempty(GRFWELLDIMENSIONLESSRADIUS) ) % NE MARCHE PAS - TROUVER UNE SOLUTION !
    disp(' ERROR: grf_gdim: You must run GRF_PRE before using the grf model')
    return;
end

a=p(1);
t0=p(2);
n=p(3);

td=t./2.2458/t0;
s=0.868588963806504*a.*grf_dls([n,GRFWELLDIMENSIONLESSRADIUS],td);

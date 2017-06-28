function p = thc_gss( t, s )
%THC_GSS - First guess for the parameters of the Theis model with a constant head boundary.
%
% Syntax:  p = thc_gss(t,s)
%
%   p(1) = a  = slope of Jacob straight line 
%   p(2) = t0 = iintercept of the first segment of straight line 
%   p(3) = ti = time of intersection between the 2 straight lines
%
%   t    = time
%   s    = drawdown
%
% Description:
%   First guess for the parameters of theis solution with a constant head
%   boundary.
%
% See also: thc_dim, thc_dmo, thc_rpt
%



% Automatic identification of the "control" points
[td,d]=ldiffs(t,s);
sl=max(s);
[du,i]=max(d);
tu=td(i);
i=find(t>=tu);
ta=t(i(1));
sa=s(i(1));
ts=td(end);
ds=d(end);

% Graphical control for debugging
% plot(ts,sl,'dr',ta,sa,'dr',ts,ds,'dr',tu,du,'rd')

% Calculation of the parameters of the model

% Dimensionless distance
rd=thc_ird(sl./du);

% Slope of Jacob's straight line
a=sl./2./log10(rd);

% Origin of jacob straight line
if rd<50
    t0=2.*tu.*log(rd)./(0.5625.*(rd.^2-1));
else
    t0=ta.*10.^(-sa./a);
end
    
% Origin of the second line
t1=rd.^2.*t0;

% Time of intersection of the two lines
ti=t1.^2./t0;

p(1)=a;
p(2)=t0;
p(3)=ti;

%p(4)=rd;

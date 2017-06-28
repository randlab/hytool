function s = tcn_dls(p,t)
%TCN_DLS - Constant head and no-flow parallel boundaries
%
% Syntax: s = tcn_dls(p,t)
%
%   p(1) = xd
%   p(2) = yd
%   p(3) = dd
%
%  provides the dimensionless drawdown at reduced time t
%
% See also: tcn_drw, tcn_std

xd=p(1);
yd=p(2);
dd=p(3);

t=0.25./t;
rd2=1./(xd.^2+yd.^2);

s=expint(t)-expint(((xd-2.*dd).^2+yd.^2).*rd2.*t);
for n=1:100
    An=((xd-2.*n).^2 + yd^2).*rd2;
    Bn=((xd+2.*n).^2 + yd^2).*rd2;
    Cn=((xd-2.*(dd+n)).^2 + yd^2).*rd2;
    Dn=((xd-2.*(dd-n)).^2 + yd^2).*rd2;
    rn=(-1).^n.*( expint( An.*t ) + expint ( Bn.*t ) );
    rn=rn-(-1).^n.*expint( Cn.*t );
    rn=rn-(-1).^n.*expint( Dn.*t );
    s=s+rn;
    if abs(rn)< abs(0.0001.*s)
        break
    end
end

s=0.5.*s;
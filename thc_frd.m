function [frd] = thc_frd( rd )
%THC_FRD - Function f(rd)
%
% Syntax: frd = thc_frd(rd)
%
%   rd  = Dimensionless radius
%   frd = 2 ln(rd) / ( rd^2 -1 ) rd^(2 rd^2/(1-rd^2))
%
% Description:
%
%
% See also:
%


if rd==1
    rd=1.00001;
end
rd2=rd.^2;
rd21=rd2-1;
frd=log(rd2)./(rd21.*rd.^(-2.*rd2./rd21));

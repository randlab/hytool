function [rd] = thc_ird( frd )
%THC_IRD - Function inverse of f(rd)
%
% Syntax: rd = thc_ird(frd)
%
%   rd  = Dimensionless radius
%   frd = 2 ln(rd) / ( rd^2 -1 ) rd^(2 rd^2/(1-rd^2))
%
% Description:
%
%
% See also:
%


if frd < 2.71828182850322
    disp('Problem in the inversion of Rd: thc_ird')
    rd=1.000001;
else
    rd=exp(frd./2);
    if rd<50
        y=[1:0.05:60];
        y(1)=1.000001;
        x=thc_frd(y);
        rd=interp1(x,y,frd);
    end
end

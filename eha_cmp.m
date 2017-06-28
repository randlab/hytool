function s = eha_cmp( p, d)
%EHA_CMP - Intenal function that computes the drawdown for a variable rate pumping test using the Eden and Hazel (1973) method.
%
% Syntax: s = eha_cmp( p, d)
%
%   p(1) = a  = slope of late time straight line
%   p(2) = A1 = intercept of the first straight line
%   p(3) = A2 = intercept of the second straight line
%
%   d = three colums matrix containing for each time step:
%
%   column 1 = Hn = reduced time defined by Eden and Hazel 
%   column 2 = id. number of the pumping period
%   column 3 = flow rate at this time
%
% See also: eha_pre, eha_gss, eha_rpt
%


a=p(1);
p(1)=[];
if( size(p,1)== 1 )
    s=a.*d(:,1)+p(d(:,2))';
else
    s=a.*d(:,1)+p(d(:,2));
end
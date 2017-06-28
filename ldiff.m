function [xd,yd]=ldiff(x,y)
%LDIFF - Approximate logarithmic derivative with centered differences
%
% Syntax: [xd,yd]=ldiff(x,y)
%
% See also: ldf, ldiffs, ldiffb, ldiffh
%

is=find(x>0);
x=x(is);
y=y(is);

dx=diff(x);
dy=diff(y);
xd=sqrt(x(1:end-1).*x(2:end));
yd=xd.*dy./dx;

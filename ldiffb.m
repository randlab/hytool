function [xd,yd]=ldiffb(x,y,d)
%LDIFFB - Approximate logarithmic derivative with Bourdet's formula
%
% Syntax: [xd,yd]=ldiffb(x,y[,d])
%
%   d = optional argument allowing to adjust the distance between 
%       successive points to calculate the derivative.
%
% See also: ldf, ldiff, ldiffs, ldiffh
%


if(nargin==2) % Default value for d if not given by user
  d=2;
end

dx=diff(log(x));
dx1=dx(1:end-2*d+1);
dx2=dx(2*d:end);

dy=diff(y);
dy1=dy(1:end-2*d+1);
dy2=dy(2*d:end);

xd=x(1+d:end-d);

yd=(dx2.*dy1./dx1+dx1.*dy2./dx2)./(dx1+dx2);

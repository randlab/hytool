function p = lin_fit( x, y, xmin, xmax)
%LIN_FIT -  Linear Least Square 
%
% Syntax:  p = lin_fit( x, y)
%
%   p(1) = a = slope of the straight line
%   p(2) = b = intercept of the straight line
%
%   x    = time
%   y    = drawdown
%   xmin = optional argument: start of the fitting period
%   xmax = optional argument: end   of the fitting period
%
% Description:
%   Fit a straight line to set of points by linear least square.
%
% Example:
%   p = lin_fit(x,y)
%
% See Also: fit


if(nargin<=2)   % Default value
  xmin=x(1);
end
if(nargin<=3)   % Default value 
  xmax=x(end);
end

i=find(isnan(y));  % The inversion will crash if there are NaN
y(i)=[];
x(i)=[];

i=find(x<xmin);
x(i)=[];
y(i)=[];

i=find(x>xmax);
x(i)=[];
y(i)=[];

%%%%%%%%%%%%%%%% The vectors must be columns

if(size(x,1)==1)
    x=x';
end
if(size(y,1)==1)
    y=y';
end

%%%%%%%%%%%%%%%% This is the only calculation !

g=[x,ones(size(x,1),1)];
p=real(inv(g'*g)*g'*y);

%%%%%%%%%%%%%%%%% 


function [xd,yd] = ldiffs(x,y,d)
%LDIFFS - Approximate logarithmic derivative with Spline
%
% Syntax: [xd,yd] = ldiffs(x,y,[d])
% 
%   d = optional argument allowing to adjust the number of points 
%        used in the Spline
%
% See also: ldf, ldiff, ldiffb, ldiffh
%



if(nargin==2) % Default value for d if not given by user
  d=10;
end

is=find(x>0);
x=x(is);
y=y(is);

xi=logspace(log10(x(1)),log10(x(end)),d);
yi=spline(x,y,xi);

% dx=diff(xi);
% dy=diff(yi);
% xd=sqrt(xi(1:end-1).*xi(2:end));
% yd=xd.*dy./dx;

xd=xi(2:end-1);
yd=xd.*(yi(3:end)-yi(1:end-2))./(xi(3:end)-xi(1:end-2));


% pp=spline(xi,yi);
% [br,co,npy,nco]=unmkpp(pp);
% sf=nco-1:-1:1;
% dco=sf(ones(npy,1),:).*co(:,1:nco-1);
% xd=xi;
% ppd=mkpp(br,dco);
% yd=xd.*ppval(ppd,xd);

% yd1=xi(1).*(yi(2)-yi(1))./(xi(2)-xi(1));
% ydend=xi(end).*(yi(end)-yi(end-1))./(xi(end)-xi(end-1));
% 
% xd=xi;
% yd=[yd1,yd,ydend];
% 

%yd=(yi(3:end)-yi(1:end-2))./(xi(3:end)-xi(1:end-2));




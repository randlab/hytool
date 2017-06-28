function dh=thc_map(x,y,r)
%THC_MAP - Function to locate the image well interactivelly
%
% Syntax: dh = thc_map(x,y,r)
%
%   x  = vector containing the X coordinates of all observations wells
%   y  = vector containing the Y coordinates of all observations wells
%   r  = vector containing the radius to the imaginery well for
%        every observation well.
% 
%   dh = distance to the hydraulic boundary
%
% Description:
%   Draw the map with the observation wells and the circles centred on 
%   the observation wells.
% 
%   Ask to click on the map to locate and select the image well.
%   Calculate the distance to the boundary.
%
%   WARNING: The coordinates of the pumping well are supposed to be (0,0)
%
% Example:
%   d=thc_map([30.48,60.96,0],[0,0,-60.96],[112,139,153])
%
% See also:
%


nseg=50;
figure(1)
clf
hold on
n=size(x,2);
xlabel('x','FontSize',14)
ylabel('y','FontSize',14)
title('Location of the wells','FontSize',14)

plot(0,0,'sr')
for i=1:n
    plot (x(i),y(i),'o')
    
    for j=1:nseg
        xc(j)=cos(2*pi*(j-1)./nseg).*r(i)+x(i);
        yc(j)=sin(2*pi*(j-1)./nseg).*r(i)+y(i);
    end
    xc(nseg+1)=xc(1);
    yc(nseg+1)=yc(1);
    plot(xc,yc,':')
end

axis equal

disp(' ')
disp('Pick the location of the image well.')
[xi,yi] = ginput(1);
plot(xi,yi,'ro')

xd(1)=xi/2-yi;
xd(2)=xi/2+yi;
yd(1)=yi/2+xi;
yd(2)=yi/2-xi;

plot(xd,yd,'-.')

dh=sqrt(xi.^2+yi.^2)./2;

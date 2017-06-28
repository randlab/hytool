function q=lei_std(l,T,r0)
%LEI_STD  Computes steady discharge to a tunnel below a constant head boundary
%
%  Syntax: q = lei_std(  l, T, r0 )
%  
%     T  = Transmissivity
%     l  = Distance to the constant head boundary
%     r0 = radius of the tunnel (or well)
%
%  Description:
%
%    Computes the head field and discharge around a large diameter tunnel
%    located close to a constant head boundary with the solution of Lei
%    (1999). As compared with the more standard Dupuit's equation for a
%    source line, it is more accurate because it imposes the constant head
%    precisely on the face of the tunnel. The usual solution induce a
%    slight shift that is negligible if the well is sufficiently far away from the
%    boundary or if has a sufficiently small diameter.
%
%    The function plots the hydraulic head map.
%
%    Reference: Lei S. (1999) An analytical solution for steady flow into
%            a tunnel. Groundwater: Vol 37, No. 1, pp. 23-25
%
%  Example:
%    lei_std(100,1e-2,10)
%
%  See also: thc_std



% Map of the heads within the aquifer
nm=150;
dxm=(2*l)./nm;
dym=l./nm;
[xm,ym] = meshgrid(-l:dxm:l,0:dym:2*l);
rm=sqrt(xm.^2+(ym-l).^2);
c=l/log(l/r0+sqrt((l/r0).^2-1));
hm=-c/2*log((xm.^2+(ym+sqrt(l.^2-r0.^2)).^2)./(xm.^2+(ym-sqrt(l.^2-r0.^2)).^2))+l;
hm(find(rm<=r0))=0;
q=2*pi*T*c;

% draw the map of the boundaries and locate the pumping well
figure(1)
clf
hold on
contourf(xm,ym,hm)
axis image
colorbar
title('Hydraulic heads')
xlabel('x')
ylabel('z')



% draw the real boundaries
% xl1=[-3*l,3*l]; yl1=[l1,l1];
% xl2=[-3*l,3*l]; yl2=[-l2,-l2];
% hold on
% plot(xl1,yl1,'b',xl2,yl2,'r')

% % Plot the pumping wells
% i=find(S>0);
% plot(X(i),Y(i),'+') 
% % Plot the injection wells
% i=find(S<0);
% plot(X(i),Y(i),'o')

% Surface plot of the heads
figure(2)
clf
surf(xm,ym,hm)
shading interp

% Plot of the norm of the velocity in logscale
% figure(3)
% clf
% [px,py] = gradient(hm,dxm,dym);
% v=T*sqrt(px.^2+py.^2);
% contourf(xm,ym,log(v))
% colorbar

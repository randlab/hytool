function waw_drw()
%WAW_DRW - Draw a series of type curves of the WAW model
%
% Syntax: waw_drw()
%
% Description:
%   Draw a series of type curves of Warren and Root (1963)
%   with well bore storage effect
%
% See also: waw_dim, waw_dls


%%%  Type curves for different sigma
lambda=0.1;
cd=0.1;
t=logspace(-4,7,200);
s1=waw_dls([10,lambda,cd],t);
s2=waw_dls([100,lambda,cd],t);
s3=waw_dls([1000,lambda,cd],t);
[dt,ds1]=ldiff(t,s1);
[dt,ds2]=ldiff(t,s2);
[dt,ds3]=ldiff(t,s3);


clf
loglog(t,s1,'k-',t,s2,'k-.',t,s3,'k--',dt,ds1,'k:',dt,ds2,'k:',dt,ds3,'k:')
[objh,texth]=legend('\sigma=10','\sigma=10^2','\sigma=10^3',...
                    'Derivatives','Location','Northwest');
%set(texth,'FontSize',14);
axis([1e-4 1e7 1e-3 1e1])
ti=sprintf('\\lambda = %g, C_D = %g',lambda,cd);
title(ti,'FontSize',16)
xlabel('t_D/r_D^2','FontSize',16)
ylabel('s_{Df}','FontSize',16)


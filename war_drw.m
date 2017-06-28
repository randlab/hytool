function war_drw()
%WAR_DRW - Draw a series of type curves of Warren and Root (1963)
%
% Syntax: war_drw()
%
% Description:
%   Draw a series of type curves of Warren and Root (1963)
%
% See also: war_dim, war_dls



%%%  Type curves for different sigma
lambda=0.1;
t=logspace(-2,7,200);
s1=war_dls([10,lambda],t);
s2=war_dls([100,lambda],t);
s3=war_dls([1000,lambda],t);
[dt,ds1]=ldiff(t,s1);
[dt,ds2]=ldiff(t,s2);
[dt,ds3]=ldiff(t,s3);

figure(2)
clf
loglog(t,s1,'k-',t,s2,'k-.',t,s3,'k--',dt,ds1,'k:',dt,ds2,'k:',dt,ds3,'k:')
[objh,texth]=legend('\sigma=10','\sigma=10^2','\sigma=10^3','Derivatives',4);
set(texth(1),'FontSize',16);
axis([1e-1 1e6 1e-3 1e1])
ti=sprintf('\\lambda = %g',lambda);
title(ti,'FontSize',16)
xlabel('t_D/r_D^2','FontSize',16)
ylabel('s_{Df}','FontSize',16)

sigma=100;
t=logspace(-2,7);
s1=war_dls([sigma,1],t);
s2=war_dls([sigma,0.1],t);
s3=war_dls([sigma,0.01],t);
[dt,ds1]=ldiff(t,s1);
[dt,ds2]=ldiff(t,s2);
[dt,ds3]=ldiff(t,s3);


%%%  Type curves for different lambda in log-log

figure(1)
clf
loglog(t,s1,'k-',t,s2,'k-.',t,s3,'k--',dt,ds1,'k:',dt,ds2,'k:',dt,ds3,'k:')
axis([1e-1 1e6 1e-2 1e1])
[objh,texth]=legend('\lambda=1','\lambda=10^{-1}','\lambda=10^{-2}','Derivatives',4);
set(texth(1),'FontSize',16);
ti=sprintf('\\sigma = %g',sigma);
title(ti,'FontSize',16)
xlabel('t_D/r_D^2','FontSize',16)
ylabel('s_{Df}','FontSize',16)


%%%  Type curves for different lambda in semi-log

figure(3)
clf
semilogx(t,s1,'k-',t,s2,'k-.',t,s3,'k--',dt,ds1,'k:',dt,ds2,'k:',dt,ds3,'k:')
[objh,texth]=legend('\lambda=1','\lambda=10^{-1}','\lambda=10^{-2}','Derivatives',2);
set(texth(1),'FontSize',16);
axis([1e-1 1e5 0 4])
xlabel('t_D/r_D^2','FontSize',16)
ylabel('s_{Df}','FontSize',16)
title(ti,'FontSize',16)
figure(4)
clf

%%%  Comparison of one type curve and its asymptotes
%%%  Equations for the minimum and the plateau

sigma=10000;
omega=1/(1+sigma);
lambda=0.1;

t=logspace(-1,8,200);
s=war_dls([sigma,lambda],t);
[dt,ds]=ldiff(t,s);
as1=ths_dls(t);
as2=ths_dls(omega*t);

tmin=log(1+sigma)/lambda;
dsmin=(1+omega^(1/(1-omega))-omega^(omega/(1-omega)))/2;
smin=besselk(0,sqrt(lambda));

slmin=ones(1,100)*besselk(0,sqrt(lambda));

loglog(t,s,'k-',dt,ds,'k:',t,as1,'k--',t,as2,'k-.',tmin,dsmin,'ko',tmin,smin,'ks')
[objh,texth]=legend('Drawdown','Derivative','Early Theis','Late Theis',4);
set(texth(1),'FontSize',16);
ti=sprintf('\\lambda = %g, \\sigma = %g',lambda,sigma);
title(ti,'FontSize',16)

axis([1e-1 1e8 1e-4 10])
xlabel('t_D/r_D^2','FontSize',16)
ylabel('s_{Df}','FontSize',16)


%%%  Comparison of the true solution and its approximation

figure(5)
clf

sigma=10000;
omega=1/(1+sigma);
lambda=0.1;

t=logspace(0,10,100);
s=war_dls([sigma,lambda],t);
sp=besselk(0,sqrt(lambda));
t1=exp(2*besselk(0,sqrt(lambda))+0.577215)/4;
t2=t1*(1+sigma);
sap=0.5*(log(t*4/(1+sigma))-0.5772-expint(lambda*(1+sigma)*t/sigma)+expint(lambda*t/sigma));

loglog(t,s,'k-',t,sap,'k--',t1,sp,'r+',t2,sp,'r+')
ti=sprintf('\\lambda = %g, \\sigma = %g',lambda,sigma);
title(ti,'FontSize',16)


%axis([1e-1 1e8 1e-4 10])
xlabel('t_D/r_D^2','FontSize',16)
ylabel('s_{Df}','FontSize',16)
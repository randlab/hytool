function war_drw()
%WAR_DRW - Draw a series of type curves of Warren and Root (1963)
%
% Syntax: war_drw()
%
% Description:
%   Draw a series of type curves of Warren and Root (1963)
%
% See also: war_dim, war_dls

t = logspace(-2,7,500);

%%% FIGURE 1 - Type curves for different lambda in log-log
sigma=100;
lambda = [1,0.1,0.01];
figure(1); clf; 
for i = 1:3
    sl(:,i) = war_dls( [sigma, lambda(i)],t );
    loglog(t,sl(:,i),'LineWidth',2); hold on
end
axis([1e-1 1e6 1e-2 1e1])
for i = 1:3
    [dt,dsl] = ldiff(t,sl(:,i));
    loglog(dt,dsl,':k','LineWidth',2)
end
loglog(t,ths_dls(t),'k:','LineWidth',1) % Early asymptote
loglog(t,ths_dls(t./(1+sigma)),'k:','LineWidth',1);  % Late asymptote

texth = {'\lambda=1','\lambda=10^{-1}','\lambda=10^{-2}','Derivatives'} ;
legend(texth,'FontSize',16,'Location','SouthEast');
ti=sprintf('\\sigma = %g',sigma);
title(ti,'FontSize',16)
xlabel('t_D/r_D^2','FontSize',16)
ylabel('s_{D}','FontSize',16)

%%%  FIGURE 2 - Type curves for different lambda in semi-log
figure(2); clf
for i = 1:3
    semilogx(t,sl(:,i),'LineWidth',2); hold on
end
semilogx(t,ths_dls(t),':','LineWidth',2);
semilogx(t,ths_dls(t./(1+sigma)),':','LineWidth',2);
texth = {'\lambda=1','\lambda=10^{-1}','\lambda=10^{-2}'} ;
legend(texth,'FontSize',16,'Location','SouthEast');
axis([1e-1 1e5 0 4])
xlabel('t_D/r_D^2','FontSize',16)
ylabel('s_{D}','FontSize',16)
title(ti,'FontSize',16)
grid on

%%% FIGURE 3 - Type curves for different sigma in log log
lambda=0.1;
sigma=[10,100,1000];
figure(3); clf
for i = 1:3
    ss(:,i) = war_dls( [sigma(i), lambda],t );
    loglog(t,ss(:,i),'LineWidth',2); hold on
end
loglog(t,ths_dls(t),'k:','LineWidth',1); hold on % Early asymptote
for i = 1:3
    [dt,dss] = ldiff(t,ss(:,i));
    loglog(t,ths_dls(t./(1+sigma(i))),'k:','LineWidth',1);
    loglog(dt,dss,':k','LineWidth',2)
end
axis([1e-1 1e6 1e-3 1e1])
txt = {'\sigma=10','\sigma=10^2','\sigma=10^3','Derivatives'};
legend(txt,'FontSize',14,'Location','SouthEast')
ti=sprintf('\\lambda = %g',lambda);
title(ti,'FontSize',16)
xlabel('t_D/r_D^2','FontSize',16)
ylabel('s_{D}','FontSize',16)


%%%  FIGURE 4 - Comparison of one type curve and its asymptotes
%%%  Equations for the minimum and the plateau

% figure(4)
% clf
% sigma=10000;
% omega=1/(1+sigma);
% lambda=0.1;
% 
% t=logspace(-1,8,200);
% s=war_dls([sigma,lambda],t);
% [dt,ds]=ldiff(t,s);
% as1=ths_dls(t);
% as2=ths_dls(omega*t);
% 
% tmin=log(1+sigma)/lambda;
% dsmin=(1+omega^(1/(1-omega))-omega^(omega/(1-omega)))/2;
% smin=besselk(0,sqrt(lambda));
% 
% slmin=ones(1,100)*besselk(0,sqrt(lambda));
% 
% loglog(t,s,'k-',dt,ds,'k:',t,as1,'k--',t,as2,'k-.',tmin,dsmin,'ko',tmin,smin,'ks')
% legend({'Drawdown','Derivative','Early Theis','Late Theis'},...
%         'FontSize',16,'Location','SouthEast');
% ti=sprintf('\\lambda = %g, \\sigma = %g',lambda,sigma);
% title(ti,'FontSize',16)
% 
% axis([1e-1 1e8 1e-4 10])
% xlabel('t_D/r_D^2','FontSize',16)
% ylabel('s_{Df}','FontSize',16)


%%%  FIGURE 5 - Comparison of the true solution and its approximation

% figure(5); clf
% 
% sigma=10000;
% omega=1/(1+sigma);
% lambda=0.1;
% 
% t=logspace(0,10,100);
% s=war_dls([sigma,lambda],t);
% sp=besselk(0,sqrt(lambda));
% t1=exp(2*besselk(0,sqrt(lambda))+0.577215)/4;
% t2=t1*(1+sigma);
% sap=0.5*(log(t*4/(1+sigma))-0.5772-expint(lambda*(1+sigma)*t/sigma)+expint(lambda*t/sigma));
% 
% loglog(t,s,'k-',t,sap,'k--',t1,sp,'r+',t2,sp,'r+')
% ti=sprintf('\\lambda = %g, \\sigma = %g',lambda,sigma);
% title(ti,'FontSize',16)
% xlabel('t_D/r_D^2','FontSize',16)
% ylabel('s_{Df}','FontSize',16)
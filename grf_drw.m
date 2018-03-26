function grf_drw(rd)
%GRF_DRW - Draw the type curves of Barker
%
% Syntax: grf_drw( rd )
%
%   rd = dimensionless radius = r/rw
%
% Description:
%   Draw a series of type curves of Barker (1988).
%
% See also: grf_dim, grf_dls
%


if(nargin==0) % Default value for rd if not given by user
  rd=1;
end

figure(1)
clf
t=logspace(-1,4)*rd.^2;
clf
for n=1:.5:3
    s=grf_dls([n,rd],t);
    [x,d]=ldiff(t,s);
    loglog(t,s,'-','LineWidth',2)
    hold on
end
legend({'n=1','n=1.5','n=2','n=2.5','n=3'},...
    'FontSize',16,'Location','NorthWest')
title(sprintf('GRF model for r_D = %g',rd),'FontSize',16)
xlabel('t_D','FontSize',16)
ylabel('s_D','FontSize',16)

figure(2)
clf
n=[1.5,2,2.5,3];
for i=1:4
    subplot(2,2,i)
    s=grf_dls([n(i),rd],t);
    [x,y]=ldiff(t,s);
    loglog(t,s,'-','LineWidth',2); hold on
    loglog(x,y,'-.','LineWidth',2)
    xlabel('t_D')
    ylabel('s_D')
    title(sprintf('r_D=%g, n=%g',rd,n(i)))
    axis tight
    %axis([min(t) max(t) 1e-2 1e2])
end


figure(3)
clf

t=logspace(-1,6)*rd.^2;
subplot(1,2,1)
s=grf_dls([1.5,rd],t);
[x,y]=ldiff(t,s);
loglog(t,s,'k-','LineWidth',1.5)
grid on
hold on
loglog(x,y,'k-.','LineWidth',1.5)
grid on
%yticks([])
%xticks([])
axis([1e-1 1e6 1e-2 1e2])


subplot(1,2,2)
semilogx(t,s,'k-','LineWidth',1.5)
hold on
plot(x,y,'k-.','LineWidth',1.5)
axis([1e-1 1e6 1e-2 70])
grid on
%yticks([])
%xticks([])




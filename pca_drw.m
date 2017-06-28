function pca_drw()
%PCA_DRW - Draw the type curves of Papadopulos-Cooper (1967) in the aquifer
%
% Syntax: pca_drw()
%
% Description:
%   Draw a series of type curves of Papadopulos-Cooper (1967)
%   in the aquifer
%
% See also: pca_dim, pca_dls
%


figure(1)
clf
t=logspace(0,8);
rd=30;
for i = 1:5
  [s,ds]=pca_dls([10^i,rd],t);
  loglog(t,s,t,ds,'-.')
  hold on
end
[st,dt]=ths_dls(t./rd./rd);
loglog(t,st,'--',t,dt,'-.')
axis([1e0 1e8 1e-3 1e2])
xlabel('t_D','FontSize',14)
ylabel('s_D','FontSize',14)

figure(2)
clf;
t=logspace(-1,3);
for i = 1:5
  ti=t.*10^i;
  [s,ds]=pca_dls([10^i,100],ti);
  loglog(t,s,t,ds,'-.')
  hold on;
end
axis([1e-1 1e3 1e-1 1e1])
xlabel('t_D / C_D = T t / r_c^2','FontSize',14)
ylabel('s_D = 2 \pi T s / Q','FontSize',14)


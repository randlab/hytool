function pcw_drw()
%PCW_DRW - Draw the type curves of Papadopulos-Cooper (1967)
%
% Syntax: pcw_drw()
%
% Description:
%   Draw a series of type curves of Papadopulos-Cooper (1967)
%
%    Reference: Papadopulos, I.S., and H.H.J. Cooper. 1967. Drawdown in a
%    well of large diameter. Water Resources Research 3, no. 1: 241-244. 
%
% See also: pcw_dim, pcw_dls
%


figure(1)
clf
t=logspace(-2,8);
for i = 1:5
  [s,ds]=pcw_dls([10^i],t);
  loglog(t,s,t,ds,'-.')
  hold on
end
st=ths_dls(t);
loglog(t,st,'--')
axis([1e-2 1e8 1e-3 1e2])
xlabel('t_D','FontSize',14)
ylabel('s_D','FontSize',14)

figure(2)
clf;
t=logspace(-1,3);
for i = 1:5
  ti=t.*10^i;
  [s,ds]=pcw_dls([10^i],ti);
  loglog(t,s,t,ds,'-.')
  hold on;
end
axis([1e-1 1e3 1e-1 1e1])
xlabel('t_D / C_D = T t / r_c^2','FontSize',14)
ylabel('s_D = 2 \pi T s / Q','FontSize',14)


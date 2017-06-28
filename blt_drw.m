function blt_drw()
%BLT_DRW - Draw the type curves of Boulton (1963)
%
% Syntax: blt_drw()
%
% Description:
%   Draw a series of type curves of Boulton (1963).
%
% See also: blt_dim, blt_dls
%


figure(1)
clf
sigma=0.01;
t=logspace(-2,6);
for i = 1:4
  s=blt_dls([sigma,10^(-i)],t);
%  [td,sd]=differentiate(t,s);
  loglog(t,s)
  hold on
end
st1=ths_dls(t);
loglog(t,st1,':')
st2=0.5*expint((1+sigma)./(4.*t.*sigma));
loglog(t,st2,':')

axis([1e-2 1e6 1e-3 1e2])
xlabel('t_D','FontSize',14)
ylabel('s_D','FontSize',14)

figure(2)
clf
phi=0.01;
t=logspace(-2,6);
for i = 1:3
  sigma=10^(-i);
  s=blt_dls([sigma,phi],t);
  loglog(t,s)
  hold on
  st2=0.5*expint((1+sigma)./(4.*t.*sigma));
  loglog(t,st2,':')
end
st1=ths_dls(t);
loglog(t,st1,':')

axis([1e-2 1e6 1e-3 1e2])
xlabel('t_D','FontSize',14)
ylabel('s_D','FontSize',14)

figure(3)
clf
sigma=0.1;
t=logspace(-2,6);
for i = 2:2
  s=blt_dls([sigma,10^(-i)],t);
  [td,sd]=ldiff(t,s);
  loglog(t,s,td,sd,'-.')
  hold on
end

axis([1e-2 1e6 1e-3 1e2])
xlabel('t_D','FontSize',14)
ylabel('s_D','FontSize',14)

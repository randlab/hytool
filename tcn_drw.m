function tcn_drw()
%TCN_DRW - Draw type curves with two boundaries
%
% Syntax: tcn_drw()
%
% Description:
%   Draw a series of type curves for the steady state discharge for a well
%   located between a constant head and a no flow boundaries
%
% See also: tcn_dls
%

tmin=-2;
tmax=2;
td=logspace(tmin,tmax);

figure(1)
clf

R=[1.5,3,10,30];

xd=-0.25;
yd=0.25;

dd=[0.02,0.1,0.3,0.5,0.7,0.9,0.98];
for i=1:7
  s=tcn_dls([xd,yd,dd(i)],td);
  [x,y]=ldiff(td,s);
  loglog(td,s,x,y,'-.')
  hold on
end
s=ths_dls(td);
[x,y]=ldiff(td,s);
loglog(td,s,'--',x,y,'-.')


xlabel('t_D / r_D^2','FontSize',14)
ylabel('s_D','FontSize',14)
axis([10^tmin 10^tmax 1e-2 10])

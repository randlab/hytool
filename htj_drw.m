function htj_drw()
%HTJ_DRW - Draw the type curves of Hantush and Jacob (1955)
%
% Syntax: htj_drw()
%
% Description:
%   Draw a series of type curves of Hantush (1955)
%
% See also: htj_dim, htj_dls
%


figure(1)
clf
t=logspace(-2,5);
rb=[2,1,0.3,.1,0.03,0.01];
for i = 1:5
  s=htj_dls(rb(i),t);
  [td,ds]=ldiff(t,s);
  loglog(t,s,td,ds,'-.')
  hold on
end
st=ths_dls(t);
loglog(t,st,'--')

axis([1e-2 1e5 1e-3 1e1])
xlabel('t_D','Fontsize',14)
ylabel('s_D','Fontsize',14)



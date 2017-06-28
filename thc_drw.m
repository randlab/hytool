function thc_drw()
%THC_DRW - Type curves of the Theis model with a constant head boundary
%
% Syntax: thc_drw()
%
% Description:
%   Draw a series of type curves of Theis (1935)
%
% See also: thc_dim, thc_dls
%


td=logspace(-2,5);

figure(1)
clf

R=[1.5,3,10,30];

for i=1:4
  s=thc_dls(R(i),td);
  [xd,yd]=ldiff(td,s);
  loglog(td,s,xd,yd,'-.')
  hold on
end
loglog(td,ths_dls(td),'--');

%y=log(30)*ones(size(td,1),1);
%loglog(td,y,'r')

xlabel('t_D / r_D^2','FontSize',14)
ylabel('s_D','FontSize',14)
axis([1e-2 1e5 1e-3 10])

figure(2)
clf

Rd=33;

s=thc_dls(Rd,td);
[xd,yd]=ldiff(td,s);
semilogx(td,s,'d',xd,yd,'d')
hold on

semilogx(td,jcb_dls(td),'--')
semilogx(td,ones(size(td,2),1)*log(Rd),'--')

xlabel('t','FontSize',14)
ylabel('s','FontSize',14)
axis([1e-2 1e5 1e-2 9])

    function thn_drw()
%THN_DRW - Type curves of the Theis model with a no-flow boundary
%
% Syntax: thn_drw()
%
% Description:
%   Draw a series of type curves of Theis (1935) model with a no-flow 
%   boundary
%
% See also: thn_dim, thn_dls
%

td=logspace(-2,5);

figure(1)
clf

R=[1.3,3.3,10,33];

for i=1:4
  s=thn_dls(R(i),td);
  [xd,yd]=ldiff(td,s);
  loglog(td,s,xd,yd,'-.')
  hold on
end
loglog(td,ths_dls(td),'--');

%y=log(30)*ones(size(td,1),1);
%loglog(td,y,'r')

xlabel('t_D / r_D^2','FontSize',14)
ylabel('s_D','FontSize',14)
axis([1e-2 1e5 1e-2 20])


figure(2)
clf
Rd=33;

s=thn_dls(Rd,td);
[xd,yd]=ldiff(td,s);
semilogx(td,s,'s',xd,yd,'s')
hold on

semilogx(td,jcb_dls(td),'--')
semilogx(td,2*jcb_dls(td)-log(Rd),'--')

xlabel('t','FontSize',14)
ylabel('s','FontSize',14)
axis([1e-2 1e5 1e-2 9])

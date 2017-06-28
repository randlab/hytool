function csl_drw()
%CSL_DRW - Draw the slug test type curves of Cooper et al. (1967)
%
% Syntax: csl_drw()
%
% Description:
%   Draw the type curves of Cooper et al. (1967)
%
%    Reference: Cooper, H.H.J., J.D. Bredehoeft, and I.S. Papadopulos.
%    1967. Response of a finite-diameter well to an instantaneous charge of
%    water. Water Resources Research 3, no. 1: 263-269. 
%
% See also: csl_dim, csl_dls
%


figure(1)
clf
t=logspace(-3,3);
e=[0,log10(5),log10(50),5,12,40];
e=[0,1,2,3,4,5,6];
for i = 1:6
  s=csl_dls(10^e(i),t);
  %sap1=1-2/sqrt(pi)/sqrt(10^e(i)).*sqrt(t) % Sageev (1986) assymptotes
  %sap2=1/2./t;
  [td,ds]=ldiff(t,s);
  semilogx(t,s,'-')
  hold on
  semilogx(td,-ds,'--')
end   
text(2e-1,0.4,'C_D=1')
text(1.3,0.45,'5')
text(2.1,0.5,'50')
text(4.5,0.55,'10^5')
text(1e1,0.6,'10^{12}')
text(3e1,0.65,'10^{40}')

legend('drawdown','derivative')
xlabel('t_D/C_D = 2Tt/r_C^2','Fontsize',14)
ylabel('s_D','Fontsize',14)
hold off


figure(2)
clf
t=logspace(-3,3);
for i = 1:6
  s=csl_dls([10^e(i)],t);
  [td,ds]=ldiff(t,s);
  loglog(t,s,'-')
  hold on
  loglog(td,-ds,'--')
end   
text(3e-1,0.3,'C_D=1')
text(1.3,0.45,'5')
text(2.1,0.5,'50')
text(4.5,0.55,'10^5')
text(1e1,0.6,'10^{12}')
text(3e1,0.65,'10^{40}')

legend('drawdown','derivative')
axis([1e-2 1e3 1e-3 1])
xlabel('t_D/C_D = 2Tt/r_C^2','Fontsize',14)
ylabel('s_D','Fontsize',14)

hold off

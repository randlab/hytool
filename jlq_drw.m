function jlq_drw()
%JLQ_DRW - Draw the dimensionless Jacob and Lohman solution
%
% Syntax: jlq_drw()
%
% Description:
%   Draw a series of type curves of Jacob and Lohman (1952)
%
% See also: jlq_dim, jlq_dls
%


t=logspace(-4,20);
g=.57721566;         % Euler constant Gamma
figure(1)
clf
q  = jlq_dls([1],t);     % Jacob and Lohman
q1 = 0.5+1./sqrt(pi.*t); % Jacob and Lohman assymptote
q2 = 2./expint(0.25./t); % Jacob and Lohman assymptote
q11 = 0.5+1./sqrt(pi.*t)-0.25*sqrt(t./pi)+t./8;  % Carslaw and Jaeger
q21 = 2./(log(4*t)-2*g)-2.*g./(log(4*t)-2*g).^2; % Carslaw and Jaeger
q3 = 1./log(1+sqrt(pi.*t)); % Perrochet

[ts,ds]=ldiff(t,1./q);
ds=ds;
figure(1)
%loglog(t,q,ts,ds,'-.')
loglog(t,q,ts,ds,'-.')
xlabel('t_D','FontSize',14)
ylabel('q_D','FontSize',14)
title('Jacob and Lohman (1952) solution')
axis([1e-3 1e10 1e-2 1e2])
legend('q','der. 1/q')

figure(2)
clf
loglog(t,q,t,q1,'-.',t,q2,'--',t,q11,'-.b',t,q21,'--b',t,q3,'+')
xlabel('t_D','FontSize',14)
ylabel('q_D','FontSize',14)
axis([1e-3 1e10 1e-2 1e2])
legend('Jacob and Lohman','Jacob early assymptote','Jacob late assymptote','Carslaw early assymptote','Carslaw late assymptote','Perrochet aproximation')
title('Assymptotes of the Jacob and Lohman(1952) solution')

figure(3)
clf
[td,ds]=ldiff(t,1./q);
hd=ones(size(td))*0.5482;
%semilogx(t,1./q,'k-',t,jcb_dls(t),'--k')
loglog(td,ds,td,hd)
xlabel('t_D','FontSize',14)
ylabel('1./q_D','FontSize',14)
axis([1e-1 1e7 0.1 1])
grid on

%legend('Jacob and Lohman','Jacob late assymptote')
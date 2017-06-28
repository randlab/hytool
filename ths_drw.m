function ths_drw()
%THS_DRW - Type curves of the Theis model.
%
% Syntax: ths_drw()
%
% Description:
%   Draw a series of type curves of Theis (1935)
%
% See also: ths_dim, ths_dls
%

td=10.^([-1:0.05:4]);

figure(1)
clf
[s,ds]=ths_dls(td);
loglog(td,s,td,ds,'-.')
legend('Theis','Derivative','Location','Northwest')
xlabel('t_D / r_D^2 = T t / S r^2','FontSize',14)
ylabel('s_D = 2 \pi s  / Q','FontSize',14)
axis([1e-1 1e4 1e-2 10])

figure(2)
clf
sj=jcb_dls(td);
semilogx(td,s,'--',td,sj);
xlabel('t_D / r_D^2','FontSize',14)
ylabel('s_D','FontSize',14)
axis([1e-1 1e2 0 3])
legend('Theis','Jacob','Location','Northwest')


% Draw examples of sensitivity of Theis response

% td=10.^([-1:0.05:1]);
% a=2;
% b=0.7;
% 
% figure(3)
% clf
% yt1=ths_dim([a,b],td);
% yt2=ths_dim([2*a,2*b],td);
% semilogx(td,yt1,'-',td,yt2,'--');
% xlabel('t / r^2','FontSize',14)
% ylabel('s','FontSize',14)
% grid on
% legend('T','2T')
% 
% figure(4)
% clf
% yt1=ths_dim([a,b],td);
% yt2=ths_dim([2*a,b],td);
% semilogx(td,yt1,'-',td,yt2,'--');
% xlabel('t / r^2','FontSize',14)
% ylabel('s','FontSize',14)
% grid on
% legend('Q','2Q')
% 
% figure(5)
% clf
% yt1=ths_dim([a,b],td);
% yt2=ths_dim([a,2*b],td);
% semilogx(td,yt1,'-',td,yt2,'--');
% xlabel('t / r^2','FontSize',14)
% ylabel('s','FontSize',14)
% grid on
% legend('S','2S')



function grg_drw()
%GRG_DRW - Draw the type curves of Gringarten and Ramey
%
% Syntax: grg_drw( rd )
%
% Description:
%   Draw a series of type curves of Gringarten and Ramey (1974).
%
% See also: grg_dim
%


t=logspace(-2,2);

s=grg_dim([1,1],t);
[ud,ds]=ldiff(t,s);
clf
loglog(t,s,ud,ds,'-.') 
xlabel('t_D')
ylabel('s_D')
legend('Drawdown','Derivative')
title('Type curve of Gringarten and Ramey (1974)')

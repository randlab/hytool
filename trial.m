function trial( func, x, t, s)
%TRIAL Display data and calculated solution together
%
%   Syntax:
%      trial( func, x, t, s )          
%   
%      func = name of the solution
%      x    = vector of parameters
%      t,s  = data set
%
%   Description:
%      The function trial allows to produce a graph that superposes data
%      and a model. This can be used to test graphically the quality of a
%      fit, or to adjust manually the parameters of a model until a
%      satisfactory fit is obtained.
%
%   Example:
%      trial('ths',p,t,s)
%      trial('csl',[0.1,1e-3],t,s)
%
%   See also: ldf, diagnostic, fit, ths_dmo
%


func=[func,'_dim'];
[t,s]=hyclean(t,s);    % Remove negative time and NaN

[td,sd]=ldiffs(t,s,40);

tplot=logspace(log10(t(1)),log10(t(end)));
sc=feval(func,x,tplot);
[tdc,dsc]=ldiff(tplot,sc);

if( mean(sd)<0 )
    sd=-sd;
    dsc=-dsc;
end
td=td(sd>0); sd=sd(sd>0);
tdc=tdc(dsc>0);dsc=dsc(dsc>0);

clf
subplot(2,1,1)
loglog(t,s,'o',td,sd,'+',tplot,sc,tdc,dsc,'-.') 
xlabel('t','FontSize',14)
ylabel('s','FontSize',14)
title('Log Log diagnostic plot')
grid on

subplot(2,1,2)
semilogx(t,s,'o',td,sd,'+',tplot,sc,tdc,dsc,'-.')    
xlabel('t','FontSize',14)
ylabel('s','FontSize',14)
title('Semi Log diagnostic plot')
axis([min(t) max(t) 0 max(s)])
grid  on
%CSL_BGS - Build type curve to estimate cd and t0
%
% Syntax: 
%   csl_bgs
%
% Description:
%   Internal script used to construct the type curve allowing to estimate
%   cd and t0 from the maximum of the derivative
%


Cd=logspace(-2,40,100);
n=size(Cd,2);
sm=zeros(n,1);
t=logspace(-3,2,300);

figure(1)
clf
for i=1:n
    s=csl_dls(Cd(i),t);
    [td,ds]=ldiff(t,s);
    ds=-ds;
    semilogx(t,s,td,ds,'-.')
    [dsm(i),itm]=max(ds);
    tm(i)=td(itm);
    hold on
    %plot(tm(i),dsm(i),'+')
    sm(i)=csl_dls(Cd(i),tm(i));
    %plot(tm(i),sm(i),'o')
    jj=find((s>0.45)&(s<0.55));
    t0(i)=interp1(s(jj),t(jj),0.5);
    plot(t0(i),0.5,'or')
end

figure(2)
clf
semilogy(dsm,tm,'-')
xlabel('Maximum value of the derivative')
ylabel('Corresponding t_D/C_D')
axis([0.13 0.36 1e-3 1e2])

figure(3)
clf

semilogy(dsm,Cd,'-')
xlabel('Maximum value of the derivative')
ylabel('C_D')
axis([0.13 0.36 1e-5 1e20])


figure(4)
clf

semilogy(Cd,t0,'-')
xlabel('Maximum value of the derivative')
ylabel('t_D/C_D for s_{wD}=0.5')
%axis([0.13 0.36 1e-5 1e20])

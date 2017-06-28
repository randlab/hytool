function [xd,yd]=ldiffh(t,s)
%LDIFFH - Approximate logarithmic derivative with Horne formula
%
% Syntax: [xd,yd]=ldiffh(t,s)
%
% See also: ldf, ldiff, ldiffb, ldiffs
%


    t1 = t(1:end-2);      %t(i-1)
    t2 = t(2:end-1);      %t(i)
    t3 = t(3:end);        %t(i+1)
    s1 = s(1:end-2);      %s(i-1)
    s2 = s(2:end-1);      %s(i)
    s3 = s(3:end);        %s(i+1)
    d1 = (log(t2./t1).*s3)./       (log(t3./t2).*log(t3./t1));
    d2 = (log(t3.*t1./t2.^2).*s2)./(log(t3./t2).*log(t2./t1));
    d3 = (log(t3./t2).*s1)./       (log(t2./t1).*log(t3./t1));
    yd = d1+d2-d3;
    xd = t2;

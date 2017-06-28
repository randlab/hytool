function qf = simplify_rate( qs, tol )
%SIMPLIFY_RATE - Group time periods having the same flow rate
%
% Syntax: qm = simplify_rate( qs, tol )
%
%   qs  = initial flow rate matrix = [t,q]
%   tol = tolerance
%   qf  = final flow rate matrix
%
% Description:
%   Simplify pumping rate history for variable rate test
%
% See also: hyselect, hyfilter, hysampling, hyclean, hyplot
%


nq=size(qs,1);
tstep=qs(1,1);
qprev=qs(1,2);
qstep=qs(1,2);
c=1;
ns=1;
for i=2:nq;
    qi=qs(i,2);
    if( abs( qi-qprev ) < tol )
        qstep=qstep+qi;
        tstep=qs(i,1);
        c=c+1;
    else
        qstep=qstep./c;
        qf(ns,1)=tstep;
        qf(ns,2)=qstep;
        ns=ns+1;
        tstep=qs(i,1);
        qprev=qs(i,2);
        qstep=qs(i,2);
        c=1;
    end
end
qstep=qstep./c;
qf(ns,1)=tstep;
qf(ns,2)=qstep;

        
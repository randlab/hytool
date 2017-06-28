function p = pca_gss(t,s)
%PCA_GSS  - First guess for the parameters of the Papadopulos Cooper solution
%
% Syntax: p = pca_gss(t,s)
%
%   p(1) = a   = slope of Jacob straight line for late time
%   p(2) = t0  = intercept of the Jacob straight line for late time
%   t    = time
%   s    = drawdown
%
% Description:
%   First guess for the parameters of the Papadopulos Cooper solution in 
%   the aquifer
%
% See also: pca_dmo, pca_pre, pca_rpt, pca_dim
%



global PCA_RW PCA_RC PCA_R PCA_Q

if(  isempty(PCA_RW) )
    disp(' ERROR: pca_gss: You must run PCA_PRE before using the pca model')
    p=[];
    return;
end

rw=PCA_RW;
rc=PCA_RC;
r=PCA_R;
q=PCA_Q;

[td,d]=ldiffs(t,s);
a=log(10)*d(end);
t0=t(end)*exp(-s(end)/d(end));

p(1)=a;
p(2)=t0;
function s = pca_dim(p,t)
%PCA_DIM - Papadopulos-Cooper (1967) solution in the aquifer
%
% Syntax: s = pca_dim(p,t)
%
%   p(1) = a  = slope of late time straight line
%   p(2) = t0 = intercept of late time straight line
%
%   t = time
%   s = drawdown
%
% Description:
%   Computes the drawdown for a constant rate pumping test in a 
%   large diameter. The aquifer is confined and homogeneous.
%   It is assumed that there is no skin effect and that there
%   is a single and constant storativity coefficient for the aquifer.
%
% Example:
%   s=pca_dim(p,t);
%
% See also: pca_dmo, pca_pre, pca_rpt, pca_gss
%



global PCA_RW PCA_RC PCA_R PCA_Q

if(  isempty(PCA_RW) )
    disp(' ERROR: pca_dim: You must run PCA_PRE before using the pca model')
    s=[];
    return;
end

a=p(1);
t0=p(2);

rw=PCA_RW;
rc=PCA_RC;
r=PCA_R;
q=PCA_Q;

rd=r/rw;

T=0.183*q/a;
S=2.25*T*t0/r.^2;
cd=rc.^2/2/rw.^2/S;

td=0.445268.*t./t0.*rd.^2;

[sd]=pca_dls([cd,rd],td);

s=0.868589.*a.*sd;
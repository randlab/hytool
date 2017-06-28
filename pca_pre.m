function pca_pre(rw,rc,r,q)
%PCA_PRE - Initialize the data required for pca_dim and pca_rpt 
%
% Syntax: d = pca_pre(rw,rc,r,q)
%
%   rw = radius of the well in meters
%   rc = radius of the casing in meters
%   r  = distance [m] between the observation well and well pumping well 
%   q  = pumping rate in m3/s
%
% Description:
%   pca stands for Papadopulos-Cooper (1967) solution for a constant rate 
%   pumping test in a large diameter well. The function  pca_pre  must be 
%   used to initialize the pumping rate history before making any call to 
%   pca_dim or pca_rpt.
%
% See also: pca_dmo, pca_dim, pca_rpt, pca_gss
%


global PCA_RW PCA_RC PCA_R PCA_Q

PCA_RW=rw;
PCA_RC=rc;
PCA_R=r;
PCA_Q=q;

function s = pcb_dim(p,t)
%PCB_DIM - Papadopulos-Cooper (1967) solution 
%
% Syntax: s = pcb_dim(p,t)
%
%    p(1) = a  = slope of late time straight line
%    p(2) = t0 = intercept of late time straight line
%    p(3) = Cd = Well-bore storage coefficient
% 
%    t = time
%    s = drawdown
%
% Description: 
%   Computes the drawdown for a constant rate pumping test in a large 
%   diameter. The aquifer is confined and homogeneous.
%
%   It is assumed that there is no skin effect. However the storativity 
%   coefficient and the wellbore storage coefficient are assumed 
%   independent. This the difference with pca_dim. It is equivalent to say
%   that the storativity near the well is different from those of the 
%   aquifer.
%
% Example:
%   s=pcb_dim(p,t)
%
% See also: pcb_dmo, pcb_pre, pcb_rpt, pcb_gss, pca_dim
%


global PCB_RD 
if(  isempty(PCB_RD) )
    disp(' ERROR: pcb_dim: You must run PCB_PRE before using the pcb model')
    s=[];
    return;
end

a=p(1);
t0=p(2);
cd=p(3);

rd=PCB_RD;
td=0.445268.*t./t0;
sd=pcb_dls([cd,rd],td.*rd.*rd);

s=0.868589.*a.*sd;
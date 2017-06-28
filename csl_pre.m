function csl_pre(rw,rc)
%CSL_PRE - Initialize the data required for csl_rpt
%
% Syntax: csl_pre(rw,rc)
%
%   rw  = radius of the well screen in meter 
%   rc  = radius of the well casing in meter 
% 
% Description:
%   csl stands for Papadopulos-Cooper (1967) solution for a slug test 
%   The function  csl_pre  must be used to initialize the slug test
%   history before making any call to csl_dim or csl_rpt.
%
% See also: csl_dmo, csl_dim, csl_rpt, csl_gss
%


global CSL_RW CSL_RC
CSL_RW=rw;
CSL_RC=rc;

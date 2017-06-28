function [s,d] = ths_dim( p, t)
%THS_DIM - Compute drawdown with the Theis (1935) solution
%
% Syntax: s = ths_dim( p, t) 
%
%   p(1) = a  = slope of Jacob Straight Line in meters
%   p(2) = t0 = intercept with the horizontal axis for s = 0
%   t = measured time
%   s = measured drawdown
%
% Description:
%   The Theis (1935) solution assumes that the aquifer is confined,
%   homogeneous, isotropic, and infinite. The well as radius that is
%   negligible. It is pumped at a constant rate Q and is 100 percent
%   efficient.   
%
%   Under these assumptions, Theis solution can be expressed as: 
%
%       s(r,t) = Q/(4 pi T) E1( r2S / 4Tt)
%
%   where Q is the pumping rate, T the transmissivity, r the radial 
%   distance between the pumping well and the observation well, 
%   S the storativity coefficient and t the time.  
%
%   To interpret field data with the Theis solution, it is expressed as a
%   function of two fitting parameters a and to which are defined as:   
%
%   a = 0.183 Q /T
%   t0 =  r2 S / 2.25 T 
%
% Example:
%   s = ths_dim( p,t )
%
% See also: ths_dmo, ths_gss, ths_rpt


td=0.5625.*p(2)./t;
s=p(1)./log(10).*expint(td);
d=p(1)./log(10).*exp(-td);

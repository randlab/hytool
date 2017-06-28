function [t,s]=ldf( fname )
%LDF Load a data file and remove points such that t<=0
%
% Syntax: [t,s] = ldf( 'fname.dat' )
%
%   fname = filename
%   t     = time vector
%   s     = drawdown vector
%
% Description: 
%   ldf('filename.dat')is a hytool function designed for loading of data.
%   It imports the first and the second column of the file “filename.dat” 
%   into the variables t and s (p.e. time and drawdown).
%
% Example: 
%   [t1,s1]=ldf('ths_ds1.dat')
%
% See also: trial, diagnostic, fit, ths_dmo
%


% Loading the data set
s=load(fname);
t=s(:,1);
s=s(:,2);

isp=find(t>0);
t=t(isp);
s=s(isp);


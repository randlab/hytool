function [xf,yf,y2s]=hyselect(x,y,xstart,xend,y2)
%HYSELECT - Select a part of a dataset strictly between xstart and xend
%                
% Syntax: 
%       [xs,ys]     = hyselect(x,y,xstart,xend)
%   or  [xs,ys,y2s] = hyselect(x,y,xstart,xend,y2)
%
%   x,y         = data points
%   y2          = optional series of points that need to be selected
%   xstart,xend = period that must be selected
%   xs,ys,y2s   = selected points    
%
% Description: 
%   The hytool function hyselect allows to select the part 
%   of a data set x,y such that x is strictly greater than xstart and 
%   lower or equal than xend.
%
% Example:
%   [tf,hf]=hyselect(t,h,tstart,tend)
%
% See also: hyfilter, hysampling, hyclean, hyplot


i=find(x>xstart & x<=xend);
xf=x(i);
yf=y(i);


if(nargin==5)         % If five arguments. 
    y2s=y2(i);
else
    y2s=0;
end

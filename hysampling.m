function [xs,ys]=hysampling(x,y,nval,idlog,option)
%HYSAMPLING - Sample a signal at regular intervals.
%      
% Syntax: [xs,ys] = hysampling( x, y, nval [,idlog [,option]] )
%
%   x,y   = vectors containing the input signal
%   nval  = number of values of the output signal
%   xs,ys = sampled signal
%
%   OPTIONAL ARGUMENT
%
%   idlog : allows to select the type of spacing of the samples
%
%       idlog  = 'linear' = Default value = linear scale  
%       idlog  = 'log'    = logarithmic scale 
%
%   option : allows to define if the points must be interpolated  
%
%       option = 'sample' = Default value 
%                         = only points from the data set are taken
%       option = 'interp' = creates points by interpolation
%
% Description: 
%   The hytool function hysampling samples a data set x,y at regular
%   intervals and displays the sampled data set as xs,ys. The input signal
%   is interpolated at a given number of points (nval) that are regularly 
%   spaced either in linear (idlog=’linear’) or in logartihmic (idlog=’log’)
%   scale. By option 'sample' (Default value) the data set is simply 
%   sampled, i.e. points from the data set are taken, sampled points are 
%   created by interpolation by the option = 'interp' in contrast.
%
% Example:
%   [ts,hs] = hysampling(t,s,10) 
%   [ts,hs] = hysampling(t,s,30,'log')
%   [ts,hs] = hysampling(t,s,10,'linear','interp')
%   [ts,qs] = hysampling(tf,qf,30,'log','interp')
%
% See also:   hyfilter, hyplot, hyclean, hyselect

xs=NaN;
ys=NaN;

if(nargin<3) % Is there at least two input arguments ?
    disp(' ');
    disp(' ERROR: The function hysampling needs at list three input argument.')
    disp(' ');
    return
end

if(nval<3) % Is there at least two input arguments ?
    disp(' ');
    disp(' ERROR: nval must be greater than 3.')
    disp(' ');
    return
end

if(nval>size(x,1)) % Is there at least two input arguments ?
    disp(' ');
    disp(' WARNING: nval is larger than the number of data points.')
    disp(' ');
end

if(nargin==3)         % If only three arguments. 
    idlog='linear';
    option='sample';
end

if(nargin==4)         % If only three arguments. 
    option='sample';
end

if( strcmp(idlog,'log') )
    j=find(x>0); % This is to avoid calculating the log of zero
    xs=logspace(log10(x(j(1))),log10(x(end)), nval);
elseif( strcmp(idlog,'linear') )
    xs=linspace(x(1),x(end),nval);
else
    disp(' ');
    disp(' SYNTAX ERROR: hysampling: the 4th parameter (idlog) is incorrect.')
    disp(' ');
    return
end

if( strcmp(option,'sample') )
    for i=1:nval
        dist=sqrt((x-xs(i)).^2);
        mn=min(dist);
        j=find(dist==mn);
        xs(i)=x(j);
        ys(i)=y(j);
    end
    % When there are not enough data point, the sampling technique
    % creates duplicates. They have to be removed.
    [xsi,i]=unique(xs);
    ys=ys(i);
    if(length(xsi)~=length(xs))
        disp(' WARNING:  hysampling - the number of selected values is smaller than requested');
        disp('           because there is not enough data points to sample regularly the signal.');
    end
    xs=xsi;
elseif( strcmp(option,'interp') )
    ys=interp1(x,y,xs);
else
    disp(' ');
    disp(' SYNTAX ERROR: hysampling: the 5th parameter (option) is incorrect.')
    disp(' ');
    return
end
xs=xs';                %transpose xs
ys=ys';

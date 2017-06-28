function yf = hyfilter(x,y,typef, p)
%HYFILTER - Filter a signal in order to reduce the noise.
%
% Syntax: yf = hyfilter( x, y, [typef, [p]] )
%   x,y = two vectors describing the input signal
%
%   OPTIONAL ARGUMENTS:
%
%   typef = allows to select the type of filter
%
%       typef = 'moving' for the moving average = Default option
%       typef = 'butter' for the Butterworth filter
%
%   p = parameter that depends on the type of filter that has been chosen.
%
%   Two methods are proposed: a moving average and a Butterworth digital
%   filter. The Butterworth tool filters high frequency components in 
%   the signal.
%
%     for the moving average  
%           p = size of the moving window in number of points
%               by default it is equal to 10
%
%     for the Butterworth filter  
%           p = period of the cutoff frequency in number of measurements
%               by default it is equal to 10
%
% Description:
%   The hytool function hyfilter filters a data set x,y in order to reduce
%   the noise.
%
%   The Butterworth tool filters high frequency components in the signal.
%   It is very sensitive of outliers.Therefore the Butterworth filter is 
%   more appropriate for noisy signals without outliers, the moving average
%   is recommended to filter very irregular signals.The Butterworth filter
%   requires the signal processing toolbox.
%
%   The moving average is less sensitive of outliers but at the same time
%   less smooth. 
%
% Example:
%   hf  = hyfilter( t,s )
%   hf  = hyfilter( t,s,'butter' )
%   hf  = hyfilter( t,s,'moving',30 ) 
%   hf  = hyfilter( t,s,'butter',3 ) 
%   qfi = hyfilter( tf,qf,'butter')
%
% See also: hyselect, hysampling, hyclean, hyplot


xf=zeros(size(x));
yf=zeros(size(x));

if(nargin<2) % Is there at least two input arguments ?
    disp(' ');
    disp(' ERROR: The function hyfilter needs at list two input argument.')
    disp(' ');
    return
end

if(nargin==2)         % If only three arguments. 
    typef='moving';
    p=10;
end

if(nargin==3)         % If only three arguments. 
    p=10;
end

if( strcmp(typef,'moving') )
    np=p;
    a=1;
    b=ones(np,1)./np;

    % Part that needs the signal processing toolbox
    yf=filtfilt(b,a,y);
    nf=max(size(yf));
    ny=max(size(y));
    dn=(nf-ny)./2;
    
    % Part that may be used if the signal processing
    % toolbox is not available
    %yf=conv(y,b);        
    %xf=x(1+dn:end-dn);
    %yf=yf(1+2*dn:end-2*dn);
    
elseif( strcmp(typef,'butter') )
    ts=x(2)-x(1);
    fs=1./ts;
    fs=1./ts;
    fc=0.5*fs/p;
    [b,a]=butter(2,fc,'low');
    yf=filtfilt(b,a,y);
    
else
    disp(' ');
    disp(' SYNTAX ERROR: hyfilter: the 3rd parameter (idfilt) is incorrect.')
    disp(' ');
    return
end


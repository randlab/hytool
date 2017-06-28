function [p,cip]=fit( func, p0, t, s, option )
%FIT - Fit the model parameter of a given model.
%
% Syntax: p = fit( func, p0, t, s, option )          
%   
%      func   = name of the solution
%      p0     = vector of initial guess for the parameters
%      t,s    = data set
%      option = fitting option allowing to force the fit to all the data
%               By default, the fit function is sampling the data set if it
%               contains more than 150 data points.
%
%      p    = vector of the optimum set of parameters
%
% Description: 
%   The function optimizes the value of the parameters of the model so that
%   the model fits the observations. The fit is obtained by an iterative
%   non linear least square procedure. This is why the function requires an
%   initial guess of the parameters, that will then be iterativly modified
%   until a local minimum is obtained.
%   
% Example:
%   p=fit('ths',p0,t,s)
%
% See also: ldf, diagnostic, trial

if(nargin==4) % Default value for all
  option='no';
end
if( strcmp(func,'eha') )
  option='all';
end

func=[func,'_dim'];

% This part is used to sample the signal if it contains too much  points

if( length(t)>150 && ~strcmp(option,'all') )
    disp(' HYTOOL WARNING : Due to the large number of data, the non linear fit')
    disp('                  function may be very slow. To avoid such inconvenience')
    disp('                  hytool has resampled the signal to keep only 150 points.')
    disp('')
    disp('                  If you want to force hytool to use all the data, please')
    disp('                  use the following syntax: p=fit(''model'',t,s,''all'')')
    [t,s]=hysampling(t,s,150,'log');
end

% This part of the function allows to make
% the interface between hytool and the various implementations
% of non linear optimization within matlab. It allows to change
% only this file to make hytool compatible with different versions
% of matlab.

%ot=license('checkout','Optimization_Toolbox');
st=license('checkout','Statistics_Toolbox');
ot=license('checkout','Optimization_Toolbox');
%st=0;

if( st==1 )
    % This is used if the statistics toolbox is available
    
    myopt=statset('nlinfit');
    myopt=statset(myopt,'Display','iter');
    %myopt=statset(myopt,'Robust','on');
    [p,residual,jacobian]=nlinfit(t,s,func,p0,myopt);
    % To compute confidence interval
    cip=nlparci(p,residual,'jacobian',jacobian);
    
% elseif( ot==1 )
%     % This is when the statistis toolbox is not available but the
%     % optimization toolbox is available
%     p=lsqcurvefit(func,p0,x,y); % requires optimization toolbox
    
else
    % Petit patch écrit en 2017 pour utiliset optim toolbox dans salle de
    % cours E003 avec matlab classroom 
    
    global FNAME T S
    FNAME = func;
    T=t;
    S=s;
    p=fminsearch('hyerr',p0);
    clear global FNAME T S
    
%else
    % Here an internal function should be provided but it needs to be
    % written ...
    %disp(' ERROR : The hytool function fit() requires either the statistics')
    %disp('         or optimization toolbox for running non linear fits')
    %p=nan(size(p0));
end

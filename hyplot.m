function hyplot(input, ttle, idlog)
%HYPLOT - Creates a plot of the selected/filtered/sampled data. 
%
% Syntax: hyplot(input, ttle, idlog)
%
% MANDATORY ARGUMENT: input = input variables: [t, h] or [t, h, q]
%                                        
% OPTIONAL ARGUMENTS: ttle  = title of the figure 
%                     idlog = scale of x-axis: 'linear' or 'log'
%                                  
% Description: 
%  Creates a plot of the selected/filtered/sampled data. 
%
% Example:  
%   hyplot([t, h])
%   hyplot([t, h, q])
%   hyplot([t, h, q],'Cadalso de los Vidrios') 
%   hyplot([t, h, q],'log') 
%   hyplot([t, h, q],'Cadalso de los Vidrios','log')
%
% See also:  hyfilter, hysampling, hyclean, hyselect



% define t and h from input vector
t = input(:,1);
h = input(:,2);

% q is only displayed, when size of input = 3
if size(input,2)==3     
     plotq = 1;
     q = input(:,3);
else plotq = 0;
end   

%Plot option is specified, but no title
if (nargin==2) & strcmp(ttle,'log')
    idlog=ttle;
    clear ttle
elseif (nargin==2) & strcmp(ttle,'linear')
    idlog=ttle;
    clear ttle
end
% Default: no title (if only one input argument)
checkttle = exist('ttle','var');
if checkttle==0
     ttle='';                
end
% Default plot x axis in linear scale
checkidlog = exist('idlog','var');
if checkidlog==0
     idlog='linear';          
end

% plot of the data
clf
%plot of h,t       
    if plotq==0 
        if( strcmp(idlog,'linear') )
            plot(t,h,'.r')
        elseif ( strcmp(idlog,'log') )
            semilogx(t,h,'.r')
        end     
        xlabel('Time in seconds')
        ylabel('Head in m')
        legend('processed data')
        title(ttle)
    end
    
%plot of h,q,t    
    if plotq==1
        
       subplot(2,1,1)          %subplot of t,h
        if( strcmp(idlog,'linear') )
            plot(t,h,'.r')
        elseif ( strcmp(idlog,'log') )
            semilogx(t,h,'.r')
        end     
            ylabel('Head in m')
            legend('processed data')
            title(ttle)
        
        subplot(2,1,2)          %subplot of t,q
        if( strcmp(idlog,'linear') )
            plot(t,q,'.r')
        elseif ( strcmp(idlog,'log') )
            semilogx(t,q,'.r')
        end     
        xlabel('Time in seconds')
        ylabel('Flow rate in m^3/s')
        legend('processed data')
              
    end






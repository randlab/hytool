function eha_pre( t, q)
%EHA_PRE - Initialize the Eden Hazel method
%
% Syntax: eha_pre( t, q)
%
%   t = vector containing the time steps
%
%   q = matrix describing the pumping periods
%       size = nb of lines = nb of pumping periods
%
%              two colums
%  
%       column 1 = time (since the begining of the test) 
%                    at which the period ends
%       column 2 = flow rate during the period
%
% Description:
%   The function eha_pre computes the reduced time Hn and store it so that
%   the function eha_gss, eha_dim, .. can use it.
%
% See also: eha_dmo, eha_dim, eha_gss, eha_rpt
%

  
global EHA_MATRIX EHA_TIME EHA_Q

if size( q,2) ~= 2
    disp('Hytool Error - eha_pre function : the q matrix must contain 3 columns.')
    return
end

if size(q,1) < 2
    disp('Hytool Warnig - eha_pre function')
    disp('  The q matrix contains only 1 line !')
    disp('  A step drawdown test must have several pumping steps')
end

pe=ones(size(t)); 
l=size(q,1);
for i=l:-1:1
  j=find((t<=q(i,1)));
  pe(j)=i;
end
lq=q(pe,2);

% dq = vector of the pumping rate increments for each period
 
dq=diff(q(:,2));     
dq=[q(1,2);dq];

% st = starting time of the pumping periods

st=[0;q(:,1)];        
st(end)=[];

% Calculation of Hn : the vector h
%
% a = matrix 
%     size: ( nb time step ) X ( nb pumping periods )
%     every column correspond to the respective pumping period
%     The values in the column are the logarithm of the time since 
%     the pumping period in question started

a=(t*ones(size(st))')-(ones(size(t))*st') ;
a(find(a<=0))=NaN;
a=log10(a);
a(find(isnan(a)))=0;
h=a*dq;

% Assembling the results

EHA_TIME = t;
EHA_Q = q;
EHA_MATRIX = [h,pe,lq];

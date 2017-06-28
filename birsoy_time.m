function [tb,sb]=birsoy_time(t,s,q)
%BIRSOY_TIME - Calculates the equivalent time of Birsoy and Summers
%
% Syntax: [tb, sb] = birsoy_time( t, s, q)
%
%   t = vector containing the time steps
%   s = vector containing the drawdowns
%   q = matrix describing the pumping periods
%       size = nb of lines = nb of pumping periods
%              two colums
%  
%   column 1 = time (since the begining of the test)at which the period
%              ends
%   column 2 = flow rate during the period
%
%   tb = equivalent Birsoy and Summers (1980) time
%   sb = reduced time = s/qn
%
% Description:
%   Calculates the equivalent time of Birsoy and Summers solution.
%
% See also: birsoy_dmo
%

if size( q,2) ~= 2
    disp('Hytool Error - birsoy_time function : the q matrix must contain 2 columns.')
    return
end

if size(q,1) < 2
    disp('Hytool Warnig - birsoy_time function')
    disp('  The q matrix contains only 1 line !')
    disp('  A variable rate test should have several rates.')
end

% pe is a vector that contains for each
% time step the identification number of the
% pumping period

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

% tb = Birsoy and Summers equivalent time

tb=ones(size(t));
nq=size(q,1);
nt=size(t,1);
for j=1:nt
    n=pe(j);
    for i=1:n
      tb(j)=tb(j).*(t(j)-st(i)).^(dq(i)./q(n,2));
    end
end
[tb,i]=sort(tb);

% Reduced drawdown

sb=s(i)./lq(i);
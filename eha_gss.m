function p = eha_gss( t, s)
%EHA_GSS - Find a first guess for the parameters of the Eden and Hazel model
%
% Syntax: p = eha_gss( t, s)
%
%   t = measured time
%   s = measured drawdown
%   p = first guess for the parameters
%
% Description:
%   First guess for the parameters of Eden and Hazel solution
%
% See also: eha_dmo, eha_pre, eha_dim, eha_rpt
%


global EHA_MATRIX
if(  isempty(EHA_MATRIX) ) % NE MARCHE PAS - TROUVER UNE SOLUTION !
    disp(' ERROR: eha_dim: You must run EHA_PRE before using the eha model')
    return;
end
d=EHA_MATRIX;

% Principle: a straight line is fitted to the last step
%            for the other steps, we take the same slope
%            and adjust the Ai so that we pass through the
%            last point of the step

% Number of steps (pumping periods)

ns=d(end,2);

% Finding the points of the last period
l=find(d(:,2)==ns);

X=d(l(4:end),1);
Y=s(l(4:end));

% Linear least-squares fit

g=[X,ones(size(X,1),1)];
r=inv(g'*g)*g'*Y;
a=r(1);

% Values at the origin for all the steps

for i=1:ns
  l=find(d(:,2)==i);
  A(i)=s(l(end))-a.*d(l(end));
end

% Assembling the results

p=[a,A];

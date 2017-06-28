function j=ths_jac( p, t)
%THS_JAC - Jacobian matrix of the Theis function
%
% Syntax: j = ths_jac( p, t)
%
%    j(1,:) = ds / dp(1) 
%    j(2,:) = ds / dp(2)
%
% See also: ths_lap


td=0.5625.*p(2)./t;
j1=expint(td)./log(10);
j2=p(1).*exp(-td)./log(10)./p(2);

j=[j1,j2];

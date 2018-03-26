function e=hyer(p)

global FNAME T S
e=feval(FNAME,p,T)-S;
e=e'*e;

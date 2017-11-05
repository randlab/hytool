%% Constant head test
% This demonstrates the interpretation of discharge rate in the test well
% with the Jacob and Lohman (1952) solution
%
% MIT License
% Copyright (c) 2017 Philippe Renard - University of Neuchâtel (CHYN)

%%
% The data set for this example comes from the following reference: 
% Lohman (1965) Geology and artesian water supply of the Grand
% Junction area, Colorado: U.S. Geol. Survey Prof. Paper 451, 149p. 
% Tables 6 and 7, well 28
%
% Let us first load the data and plot them.

[t,q]=ldf('jlq_ds1.dat');

%%
% Once the data have been loaded , we can interpret the data. We do that
% as usually in two steps. First the parameters p of the model are 
% estimated with the function jlq_gss. Then we find an optimum fit.

p=jlq_gss(t,q);
p=fit('jlq',p,t,q); 

%%
% We can then display the result of the interpretation.
% Hytool find that the folowing values fort the transmissivity and
% storativity:
%
% T = 1.3 e-5 m2/s and S = 1.6 e-5
%

jlq_rpt(p,t,q,[28.142,0.084],'Glover (1978) example - automatic fit')

%%
% The results are in reasonable agreement with the values found by this 
% differents authors:  
% Swamee et al (2000) : S = 3.88 e-5 and T = 1.16 e-5 m2/s
% Glover (1978)       : S = 4.14 e-5 and T = 1.18 e-5 m2/s
% Batu (1998)         : S = 1.58 e-4 and T = 9.3  e-6 m2/s


% Nota Bene: If required, one can use trial and error
% trial('jlq',p,t,q)
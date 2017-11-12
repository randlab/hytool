% Interpretation of Hydraulic Tests
% Version 2.06 12-nov-2017
%
% by Philippe Renard and Co.
%
%   Hytool is a matlab toolbox that provides an open environement for the 
%   interpretation of hydraulic tests.    
% 
%   The toolbox contains some of the most usual analytical solutions used 
%   to describe groundwater flow around wells, as well as functions for 
%   importing, displaying the data, and fitting a model to the data.
%
%   One of the main interest of hytool is that it can be extended by the 
%   user to include additional solutions when they are required. 
%
%   Help and Demos are availble through the Help browser
%

%   aga_dim       - - Computes drawdown with Agarwal et al. (1970) solution in the aquifer
%   aga_dls       - - Dimensionless Agarwal solution in the aquifer
%   aga_dmo       - Agarwal et al. solution in the aquifer
%   aga_drw       - Draw the type curves of Agarwal et al. (1970)
%   aga_gss       - - First guess for the parameters of the Agarwal solution
%   aga_lap       - - Agarwal et al solution in  Laplace domain
%   aga_pre       - - Initialize the data required for aga_dim and aga_rpt
%   aga_rpt       - - Produces the final figure and results for the Agarwal model
%   agarwal_dmo   - Demo example for the agarwal time 
%   agarwal_time  - - Computes equivalent Agarwal (1980) time for recovery tests.
%   birsoy_dmo    - Reduced time for multiple rate tests
%   birsoy_time   - - Calculates the equivalent time of Birsoy and Summers
%   blt_dim       - BLT_DIM(p,t) Boulton (1963) model for unconfined aquifer
%   blt_dls       - - Dimensionless drawdown of the Boulton model for an unconfined aquifer. 
%   blt_dmo       - Boulton interpretation.  
%   blt_drw       - - Draw the type curves of Boulton (1963)
%   blt_gss       - - First guess for the parameters of the Boulton model
%   blt_lap       - - Boulton (1963) Laplace dimensionless domain solution 
%   blt_rpt       - - Reports the results of the interpretation with the Boulton model
%   csl_bgs       - - Build type curve to estimate cd and t0
%   csl_dim       - - Cooper et al. (1967) solution for a slug test
%   csl_dls       - - Cooper et al. (1967) dimensionless solution for a slug test
%   csl_dmo       - Interpretation of a slug test
%   csl_drw       - - Draw the slug test type curves of Cooper et al. (1967)
%   csl_gss       - - Calculates a first first set of parameters for the Cooper et al. (1967) solution for slug tests
%   csl_lap       - - Cooper et al. (1967) Laplace domain solution for slug test
%   csl_pre       - - Initialize the data required for csl_rpt
%   csl_rpt       - - Produces the final figure and results for the Papadopulos Cooper model
%   dehoog        - - numerical inverse Laplace transform
%   del_dim       - - Computes drawdown in the aquifer with Delay et al. (2004) solution.
%   del_dmo       - Fractal solution in 2 dimensions
%   del_rpt       - - Produces the final figure and results for the Delay et al. (2004) model 
%   diagnostic    - Creates a diagnostic plot of the data
%   eha_cmp       - - Intenal function that computes the drawdown for a variable rate pumping test using the Eden and Hazel (1973) method.
%   eha_dim       - - Computes drawdown for step-drawdown tests according to Eden-Hazel (1973) 
%   eha_dmo       - Eden Hazel interpretation.  
%   eha_gss       - - Find a first guess for the parameters of the Eden and Hazel model
%   eha_pre       - - Initialize the Eden Hazel method
%   eha_rpt       - - Produces the final figure and results for the Eden-Hazel model
%   fit           - - Fit the model parameter of a given model.
%   grf_dim       - - Barker (1988) general radial flow model
%   grf_dls       - - Barker (1988) general radial flow model
%   grf_dmo       - General Radial Flow model interpretation
%   grf_drw       - - Draw the type curves of Barker
%   grf_gss       - - First guess for the Barker model
%   grf_lap       - - Laplace Dimensionless solution : Barker (1988) general radial flow model
%   grf_pre       - - Calculates the input vector for grf
%   grf_rpt       - - Produces the final figure and results for the Barker model 
%   grg_dim       - - Gringarten and Ramey (1974) solution 
%   grg_dmo       - Single fracture in a confined aquifer.
%   grg_drw       - - Draw the type curves of Gringarten and Ramey
%   grg_gss       - - First guess for the parameters of the Gringarten model.
%   grg_rpt       - - Produces the final figure and results for the Gringarten & Ramey model
%   htj_dim       - - Hantush and Jacob (1955) solution
%   htj_dls       - - Hantush dimensionless solution
%   htj_dmo       - Confined aquifer with leakage
%   htj_drw       - - Draw the type curves of Hantush and Jacob (1955)
%   htj_gss       - HTJ-GSS - First guess for the parameters of the Hantush and Jacob (1955) solution
%   htj_lap       - - Hantush-Jacob (1955) Function in Laplace domain 
%   htj_rpt       - - Produces the final figure and results for the Hantush and Jacob (1955) model
%   hvs_dim       - - Hvorslev (1951) Solution for a slug test
%   hvs_gss       - - Estimate the parameters of the Hvorslev Model
%   hvs_rpt       - HSV_RPT - Produces the final figure and results for the Hvorslev (1951) model
%   hyclean       - - Take only the values that are finite and strictly positive time
%   hycoop        - - Hytool Copyright 
%   hyerr         - 
%   hyfilter      - - Filter a signal in order to reduce the noise.
%   hyplot        - - Creates a plot of the selected/filtered/sampled data. 
%   hysampling    - - Sample a signal at regular intervals.
%   hyselect      - - Select a part of a dataset strictly between xstart and xend
%   hyver         - - Hytool Version 
%   igmeread      - - Import IGME csv file from the low permeability testing unit.
%   jcb_dim       - - Compute drawdwon with the Cooper and Jacob (1946) approximation 
%   jcb_dls       - - Jacob dimensionless drawdown
%   jcb_dmo       - Cooper-Jacob (1946) straight line method
%   jcb_gss       - - Linear Least Square fitting of Jacob solution
%   jcb_rpt       - - Reports graphically the results of a pumping test interpreted with the Cooper-Jacob (1946) model. 
%   jlq_dim       - - Jacob & Lohman (1952) discharge solution in the well
%   jlq_dls       - - Jacob & Lohman (1952) dimensionless solution in the well
%   jlq_dmo       - Constant head test
%   jlq_drw       - - Draw the dimensionless Jacob and Lohman solution
%   jlq_gss       - - First guess for the parameters of the Jacob and Lohman model
%   jlq_lap       - - Jacob-Lohman Laplace domain solution in the well
%   jlq_rpt       - - Produces the final figure and results for the Jacob and Lohman (1952) model 
%   ldf           - Load a data file and remove points such that t<=0
%   ldiff         - - Approximate logarithmic derivative with centered differences
%   ldiffb        - - Approximate logarithmic derivative with Bourdet's formula
%   ldiffh        - - Approximate logarithmic derivative with Horne formula
%   ldiffs        - - Approximate logarithmic derivative with Spline
%   lei_std       - Computes steady discharge to a tunnel below a constant head boundary
%   lin_fit       - -  Linear Least Square 
%   mkdemo        - Internal function used to create the html demo files
%   mkhelp        - Internal script used to generate the help files for hytool.
%   mkhtml        - Create individual HTML help file from a matlab file
%   moy_std       - THIEM - Calculate the transmissivity with Moye (1967) formula
%   nsl_dim       - - Neuzil (1982) solution for a slug test (pulse)
%   nsl_dls       - - Neuzil (1982) dimensionless solution for a slug test (pulse)
%   nsl_dmo       - Shut-in slug test (pulse)
%   nsl_drw       - - Draw the slug test (pulse) type curves of Neuzil (1982)
%   nsl_gss       - - Calculates a first set of parameters for the Neuzil (1982) solution for slug tests (pulse)
%   nsl_lap       - - Neuzil (1982) Laplace domain solution for slug test (pulse)
%   nsl_rpt       - - Produces the final figure and results for the Neuzil model
%   pca_der       - - Papadopulos-Cooper Derivative in Laplace domain in the aquifer
%   pca_dim       - - Papadopulos-Cooper (1967) solution in the aquifer
%   pca_dls       - - Papadopulos-Cooper dimensionless solution in the aquifer
%   pca_dmo       - Dradown in the aquifer - one single storativity.
%   pca_drw       - - Draw the type curves of Papadopulos-Cooper (1967) in the aquifer
%   pca_gss       - - First guess for the parameters of the Papadopulos Cooper solution
%   pca_lap       - - Papadopulos-Cooper Function in Laplace domain in the aquifer.
%   pca_pre       - - Initialize the data required for pca_dim and pca_rpt 
%   pca_rpt       - - Produces the final figure and results for the Papadopulos Cooper model
%   pcb_der       - - Papadopulos Cooper Derivative in Laplace domain in the aquifer with two storativities
%   pcb_dim       - - Papadopulos-Cooper (1967) solution 
%   pcb_dls       - - Papadopulos- -Cooper dimensionless solution in the aquifer with two storativities
%   pcb_dmo       - Dradown in the aquifer - two storativities.
%   pcb_drw       - - Draw the type curves of Papadopulos-Cooper (1967) in the aquifer with two storativities
%   pcb_gss       - - First guess for the parameters of the Papadopulos Cooper solution in the aquifer with two storativities
%   pcb_lap       - - Papadopulos Cooper Function in Laplace domain in the aquifer solution in the aquifer
%   pcb_pre       - - Initialize the data required for pcb_dim and pcb_rpt 
%   pcb_rpt       - - Produces the final figure and results for the Papadopulos Cooper model with independent wellbore storage
%   pcw_der       - - Papadopulos-Cooper solution the well : Log derivative of the solution in Laplace domain
%   pcw_dim       - - Papadopulos Cooper (1967) solution 
%   pcw_dls       - - Papadopulos Cooper dimensionless solution in the well
%   pcw_dmo       - Drawdown in the well.
%   pcw_drw       - - Draw the type curves of Papadopulos-Cooper (1967)
%   pcw_gss       - - First guess for the parameters of the Papadopulos Cooper solution
%   pcw_lap       - - Papadopulos Cooper Laplace domain solution in the well
%   pcw_rpt       - - Produces the final figure and results for the Papadopulos Cooper model
%   rpt_cmp       - RPT_CMP
%   rpt_lgd       - RPT_LGD
%   rpt_lgd_slug  - RPT_LGD
%   rpt_llt       - RPT_LLT
%   rpt_llt_slug  - RPT_LLT
%   rpt_plt       - RPT_PLT
%   simplify_rate - - Group time periods having the same flow rate
%   stefhest      - - Numerical Laplace inversion with the Stefhest method
%   tcn_dls       - - Constant head and no-flow parallel boundaries
%   tcn_drw       - - Draw type curves with two boundaries
%   tcn_std       - - Calculate the steady state discharge for a well located between a constant head and a no flow boundaries
%   thc_dim       - - Theis (1941) model with a constant head boundary.
%   thc_dls       - - Theis dimensionless drawdown with a constant head boundary
%   thc_dmo       - Theis (1941) interpretation.  
%   thc_drw       - - Type curves of the Theis model with a constant head boundary
%   thc_frd       - - Function f(rd)
%   thc_gss       - - First guess for the parameters of the Theis model with a constant head boundary.
%   thc_ird       - - Function inverse of f(rd)
%   thc_map       - - Function to locate the image well interactivelly
%   thc_p2x       - - Conversion of parameters for constant head case
%   thc_rpt       - - Report the results of an interpretation with Theis (1941)
%   thc_std       - - Computes discharge rate for a well close to a constant head boundary
%   thc_x2p       - - Conversion of parameters for constant head case
%   thiem         - - Calculate the transmissivity with Thiem formula
%   thiem_dmo     - Thiem method
%   thn_dim       - - Theis model with a no-flow boundary
%   thn_dls       - - Dimensionless drawdown of the Theis model with a no-flow boundary
%   thn_dmo       - Theis no-flow boundary interpretation.  
%   thn_drw       - - Type curves of the Theis model with a no-flow boundary
%   thn_gss       - - First guess for the parameters of the Theis model with a no-flow boundary
%   thn_rpt       - - Produces the final figure and results for the Theis model with a no flow boundary
%   ths_der       - - Derivative of the Theis Function in Laplace domain
%   ths_dim       - - Compute drawdown with the Theis (1935) solution
%   ths_dls       - - Dimensionless drawdown of the Theis model
%   ths_dmo       - Theis (1935) interpretation.  
%   ths_drw       - - Type curves of the Theis model.
%   ths_gss       - - First guess for the parameters of the Theis model.
%   ths_jac       - - Jacobian matrix of the Theis function
%   ths_lap       - - Theis Function in Laplace domain
%   ths_rpt       - - Reports graphically the results of a pumping test interpreted with the Theis (1935) model. 
%   tmc_dim       - - Theis model with a constant head boundary for multiple rate
%   tmc_dmo       - Theis solution with a constant head boundary for Multiple rate tests 
%   tmc_gss       - - First guess for the parameters of the Theis model with a constant head boundary for multiple rate tests
%   tmc_pre       - -  Pre-processing : initialize the multiple rate Theis drawdown function
%   tmc_rpt       - - Final graphical output with numerical results. 
%   tmr_dim       - - Theis model for multiple rate tests (1935)
%   tmr_dmo       - Theis solution for Multiple rate tests.
%   tmr_gss       - - First guess for the parameters of the Theis model for multiple rate tests
%   tmr_pre       - -  Pre-processing : initialize the multiple rate Theis drawdown function
%   tmr_rpt       - - Final graphical output with numerical results
%   trial         - Display data and calculated solution together
%   war_dim       - - Warren and Root (1965) solution
%   war_dls       - - Dimensionless drawdown of Warren and Root (1963) solution
%   war_dmo       - Pumping test in a double porosity aquifer
%   war_drw       - - Draw a series of type curves of Warren and Root (1963)
%   war_gss       - - First guess for the parameters of the Warren and Root solution
%   war_lap       - - Warren and Root (1963) solution in  Laplace domain
%   war_rpt       - - Produces the final figure and results for the Warren and Root model
%   waw_dim       - - Warren and Root (1965) with Well Bore storage
%   waw_dls       - - Warren and Root with Well bore storage dimensionless solution in the well
%   waw_drw       - - Draw a series of type curves of the WAW model
%   waw_gss       - - First guess for the parameters of the WAW model
%   waw_lap       - - Warren and Root with Well bore storage dimensionless solution
%   waw_rpt       - - Produces the final figure and results for the WAW model


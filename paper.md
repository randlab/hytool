---
title: 'Hytool: an open source matlab toolbox for the interpretation of hydraulic tests using analytical solutions'
tags:
  - hydraulic tests
  - pumping tests
  - well tests
  - hydrogeology
  - matlab
authors:
 - name: Philippe Renard
   orcid: 0000-0003-4504-435X
   affiliation: 1
affiliations:
 - name: University of Neuchâtel
   index: 1
date: 6 July 2017
bibliography: paper.bib
---

# Summary

Hytool is a matlab toolbox for the interpretation of hydraulic tests in wells.
The core ot the toolbox is an ensemble of classical analytical solutions that can be used to describe and analyze groundwater flow around wells in geological formations or aquifers.

Those solutions correspond to rather simple boundary conditions (constant pumping rate or instantaneous slug injection for example), assume that the aquifer is homogeneous and include different types of models corresponding to different solutions (confined aquifers, unconfined aquifers, double-porosity media, general radial flow, single fracture, fractal media). Some solutions include the effect of a lateral or can be use to integrate multiple pumping rates or fixed injection rate. The structure of the code is modular to allow adding easily new solutions when needed. Often those analytical solutions are much more simple to express as dimensionless equations in the Laplace domain. Therefore, the code structure includes an implementation of the Stefhest and de Hoog techniques to invert numerically the Laplace transform.


 and functions for importing, displaying, and fitting a model to the data. Most of the analytical solutions available in hytool a

The Wiki page of this repository explains how to install hytool on your machine.

To learn how to use hytool, a series of detailed examples and manuals are provided within the Matlab help.
This is a proof of concept integration between a GitHub [@GitHub] repo and figshare [@figshare] in an effort to get a DOI for a GitHub repository. When a repository is tagged for release on GitHub, Fidgit [@Fidgit] will import the release into figshare thus giving the code bundle a DOI. In a somewhat meta fashion, Fidgit is publishing itself to figshare with DOI 'http://dx.doi.org/10.6084/m9.figshare.828487' [@figshare_archive].

-![Fidgit deposited in figshare.](figshare_article.png)

# References

---
title: 'Hytool: an open source matlab toolbox for the interpretation of hydraulic tests using analytical solutions'
tags:
  - hydraulic tests
  - pumping tests
  - well tests
  - hydrogeology

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

Hydraulic tests are hydrogeological field experiments allowing to identify aquifer types and physical parameters. Many types of tests and analytical solutions have been developed in the past to interpret such experiments [@raghavan1993] [@renard2006].

Hytool is a matlab toolbox providing a catalog of classical analytical solutions for the interpretation of hydraulic tests. It includes models corresponding to different flow conditions and aquifer types (confined aquifers, unconfined aquifers, double-porosity media, general radial flow, single fracture, fractal media). Some solutions for multiple pumping rates, constant head test, or slug tests are available as well as bounded aquifers.

The structure of the code is modular and allows adding easily new solutions when needed. Often the solutions are expressed as dimensionless equations in the Laplace domain. Therefore, the code structure includes an implementation of the Stefhest [@stefhest1970] and de Hoog techniques to invert numerically the Laplace transform.

In addition to the analytical solution, hytool contains a set of functions to help the user load and manipulate the hydraulic test data, construct diagnostic plots [@renard2009], fit automatically a model, and report the results.

The user documentation is included within the toolbox and available as internal help within matlab. The help contains a description of each individual function plus a series of examples including data sets that are used to demonstrate how hytool can be used in practice. This toolbox has been used in several research [@mejias2009] project as well as for teaching purposes in the University of Neuchâtel.  

# References

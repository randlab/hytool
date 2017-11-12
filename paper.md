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

Hydraulic tests are hydrogeological field experiments used to identify aquifer types and physical parameters. They consist in applying a hydraulic perturbation such as pumping groundwater in a well and observing the variations of the groundwater levels in the same well or in other observation wells. Many types of tests involving different types of hydraulic perturbations, and many analytical solutions have been developed in the past to interpret such experiments [@raghavan1993] [@renard2006].

Hytool is a Matlab toolbox that provides a catalog of classical analytical solutions for interpreting hydraulic tests. It includes models corresponding to different flow conditions and aquifer types (confined aquifers, unconfined aquifers, double-porosity media, general radial flow, single fracture, fractal media). Some solutions for multiple pumping rates, constant head test, or slug tests are available as well as bounded aquifers.

The structure of the code is modular and allows a user to easily add new solutions when needed. Often the solutions are expressed as dimensionless equations in the Laplace domain. Therefore, the code structure includes an implementation of the Stefhest [@stefhest1970] and de Hoog techniques to invert numerically the Laplace transform.

In addition to the analytical solution, hytool contains a set of functions to help the user load and manipulate the hydraulic test data, construct diagnostic plots [@renard2009], fit automatically a model, and report the results as illustrated in the following figure. In this example, a data set (measurements of groundwater drawdown as a function of time during a constant rate pumping experiment) is interpreted using the Theis analytical model. The graph shows the superposition of the data and the model and includes the logarithmic derivative of the data and signal. Below the graph, hytool provides information about the parameters that were obtained by the least-square procedure, the quality of the fit and the values of the hydraulic properties of the aquifer (transmissivity and specific storage).

![Example of Data interpretation with Hytool](https://github.com/UniNE-CHYN/hytool/blob/master/html/ths_dmo_09.png)

The user documentation is included within the toolbox and available as internal help within Matlab. The help contains a description of each individual function plus a series of examples including data sets that are used to demonstrate how hytool can be used in practice.

Hytool is employed for teaching purposes in the University of Neuchâtel. It is also  used in several research projects for determining the hydraulic properties of porous or fractured [@mejias2009]  aquifers. This often constitutes a preliminary step for many hydrogeological applications. Hytool was for example used in the context of estimating groundwater inflows in tunnels [@dematteis2003] or groundwater modeling study [@alcolea2009]. Recently, Hytool was used in a research project devoted to the development of a new geophysical monitoring method [@desroches2016monitoring]. 

# References

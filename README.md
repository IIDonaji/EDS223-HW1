## Map Making Practice

Geospatial Analysis & Remote Sensing (EDS223) Homework Assignment 1:

This repsoitory contains the code and data used to create geospatial maps for Homework Assignment 1 in EDS 223. THe assignment focuses on visualizing environmental justice data using R, including creating multilayer maps and practicing the `tmap` package.

#### Learning outcomes 
- Create an  accessible and aesthetically-pleasing maps that illustrate environmental and demographic data across the Untied States. This includes practicing multi-layer mapping techniques and working with a vector and raster geospatial data in R. 

#### The following files are housed in this repository: 
- README.md 
- ej_screen.qmd - Quarto file contain code and map generated workflow
- ej_screen.pdf - rendered PDF output of the assignmet 
- Rmd/Proj files 
- data - folder contain raw processed dta
  - ejscreen - block group-level EJScreen data 
  
#### Data Access

The data used in this assignment comes from the United States Environmental Protection Agency’s EJScreen: Environmental Justice Screening and Mapping Tool:

- The original tool is no longer available, but an unofficial version exists [here](https://pedp-ejscreen.azurewebsites.net/)

Note: The repository contains only a subset of block group-level data used for the assignment.

#### Installation & Dependencies

The following R packages where installed to complete this assignment

```         
- install.packages("sf")
- install.packages("stars")
- install.packages("tmap")
```
#### Data Citations

United States Environmental Protection Agency. 2015. EJSCREEN. Retrieved: October, 06, 2025, from [HERE](www.epa.gov/ejscreen) 
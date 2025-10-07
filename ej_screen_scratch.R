#### Load packages and read in geodatabase

library(tidyverse)
library(sf)
library(stars)
library(tmap)
library(here)
library(tinytex)


# read in geodatabase of EJScreen data at the Census Block Group level
ejscreen <- sf::st_read(here::here("data", "ejscreen","EJSCREEN_2023_BG_StatePct_with_AS_CNMI_GU_VI.gdb")) 

# filter to a state you are interested in
california <- ejscreen %>%
  dplyr::filter(ST_ABBREV == "CA") 

# filter to a county you are interested in
Los_Angeles <- ejscreen %>%
  dplyr::filter(CNTY_NAME %in% c("Los Angeles County"))

# find the average values for all variables within counties
california_counties <- aggregate(california, by = list(california$CNTY_NAME), FUN = mean)


### Visualize data 

Creating two maps that visualize environmental injustice by showing the distribution of air toxins 

tm_shape(california_counties) +
  tm_polygons(fill = "PEOPCOLORPCT", 
              fill.legend = tm_legend("Precentage (%) People of Color"),
              fill.scale = tm_scale(values = c("yellow", "darkgreen"))) +
  tm_compass(type = "4star", size = 2, position = c("right", "top")) +
  
  tm_scalebar(position = c("left", "bottom")) +
  
  tm_title("Where the Air is Most Toxic: Cancer Risk Across California", size = 1) +   
  tm_layout(component.autoscale = FALSE) # to avoid auto scaling to graph. 



tm_shape(california_counties) +
  tm_symbols("P_D2_RSEI_AIR", shape = 22, size.legend = tm_legend("Toxic Relsease to Air EJ Index Precential (%)")) +
  
  # tm_dots() +
  tm_text(text = "Group.1", size = 0.5) +
  
  tm_shape(california_counties) +
  tm_symbols(fill = "P_D2_CANCER", size = 0.5, 
             fill.scale = tm_scale(values = c("purple", "darkblue")), 
             fill.legend = tm_legend(title = "Presence of Cancer Risk Precential")) + 
  
  tm_compass(type = "4star", size = 2, position = c("right", "top")) +
  
  tm_scalebar(position = c("left", "bottom")) +
  
  tm_title("Where the Air is Most Toxic: Cancer Risk Across California", size = 1) +   
  tm_layout(component.autoscale = FALSE) # to avoid auto scaling to graph. 

## Map two

tm_shape(california_counties) +
  tm_symbols("P_D2_RSEI_AIR", shape = 22, size.legend = tm_legend("Toxic Relsease to Air EJ Index Precential (%)")) +
  
  # tm_dots() +
  tm_text(text = "Group.1", size = 0.5) +
  
  tm_shape(california_counties) +
  tm_symbols(fill = "P_D2_CANCER", size = 0.5, 
             fill.scale = tm_scale(values = c("purple", "darkblue")), 
             fill.legend = tm_legend(title = "Presence of Cancer Risk Precential")) + 
  
  tm_compass(type = "4star", size = 2, position = c("right", "top")) +
  
  tm_scalebar(position = c("left", "bottom")) 

# Map1 
tm_shape(california_counties) +
  tm_graticules() +
  tm_polygons(fill = "PEOPCOLORPCT", 
              fill.legend = tm_legend("Precentage (%) People of Color"),
              fill.scale = tm_scale(values = c("yellow", "darkgreen"))) +
  
  tm_shape(california_counties) +
  tm_symbols("P_D2_RSEI_AIR", shape = 22, 
             size.legend = tm_legend("Toxic Release to Air\nEJ Index Precentile (%)")) +
  
  #tm_dots() +
  tm_text(text = "Group.1", size = 0.5) +
  
  tm_shape(california_counties) +
  tm_symbols(fill = "P_D2_CANCER", size = 0.5, 
             fill.scale = tm_scale(values = c("purple", "darkblue")), 
             
             fill.legend = tm_legend("Presence of Cancer Risk Precentile")) + 
  
  tm_compass(type = "4star", size = 2, position = c("right", "top")) +
  
  tm_scalebar(position = c("left", "bottom")) +
  
  tm_title("Where the Air is Most Toxic: In relation to people of color", 
           size = 1) +   
  tm_layout(component.autoscale = TRUE, frame = TRUE) # to avoid auto scaling to graph.
  


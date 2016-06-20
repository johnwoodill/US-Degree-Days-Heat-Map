########################################################################################################
#-------------------------------------------------------------------------------------------------------
# Author    : A. John Woodill
# Date      : 06/17/2016
# Filename  : us_degree_days_heat_map.R
# Code      : Builds a heat map for degree days >= 30C from 1900-2013 in US
# Sections  : NA
#-------------------------------------------------------------------------------------------------------
########################################################################################################

library(dplyr)
library(ggplot2)
library(viridis)
library(ggthemes)

dd <- readRDS("/run/media/john/1TB/Projects/US-Degree-Days-Heat-Map/Data/fips_degree_days_1900-2013.rds")
dd <- as.data.frame(dd)
dd <- select(dd, fips, year, month, dday30C)

 dd <- dd %>% 
   group_by(month) %>% 
   mutate(dm30 = (dday30C - mean(dday30C))/sd(dday30C))

 dd_temp <- dd %>% 
   group_by(year, month) %>% 
   summarise(dm30 = mean(dm30))
             


# plot heatmap
gg <- ggplot(dd_temp, aes(month, year, fill = dm30)) + geom_tile(color = "white", size = .10) + 
  scale_fill_viridis(name="Diff. from \nAverage ",option="A")

gg <- gg +
        coord_cartesian(ylim = c(1900,2013)) +
        scale_y_continuous(breaks = seq(1900,2013, by=10)) +
        scale_x_continuous(expand = c(0, 0), 
                           breaks = c(1,2,3,4,5,6,7,8,9,10,11,12),
                           labels = c("Jan", "Feb", "Mar", "Apr",
                                      "May", "Jun", "Jul", "Aug", "Sep",
                                      "Oct", "Nov", "Dec"))
gg + theme_classic() + 
  ggtitle("Continental United States (Degree Days >= 30C)") + 
  xlab(NULL) + ylab(NULL) + 
  theme_tufte(base_family="Helvetica")


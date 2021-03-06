## US-Degree-Days-Heat-Map

![](https://github.com/johnwoodill/US-Degree-Days-Heat-Map/blob/master/dd30.png?raw=true)

**Interesting Aspects**

* May - Sept contain the most degree days above 30C
* The Dust Bowl Era of the 1930's shows up as the hottest time period during this century
  * Hottest years were 1934 and 1936 
* Early 1950's heat wave also shows up
* Appears to be cooling period in the 80's and 90's
* Earliest years appear to have hot late summers
* Recent years > 2010 appear to be warmer in the early parts of the summer

*Takeway:* The main takeaway from this graphic is that there are many ways to think about temperature changes and it is important to not assume changes are occuring uniformly throughout the world. In fact, there is research suggesting the U.S. is not warming as fast as the rest of the world and stands to be a major player in agriculture.  This graphic provides another way to look at temperature changes.

----------------------------

**Introduction**

Inspired by a beautiful plot of [Average World Temperature since 1850](https://www.reddit.com/r/dataisbeautiful/comments/4o6if2/the_temperature_of_the_world_since_1850_oc/) I just happened to finish processing some data on degree days for the continental United States and thought it would be nice to visualize some of the data with `geom_tile()` in the `ggplot2` package.  

While mean temperatures tell a story about how we perceive temperatures on average throughout the day it misses how long throughout the day it was hot.  For example, suppose you wake up in the morning and it's rainy and a bit cool with a minimum temperature of 20C. By noon it is much warmer and the daily max temperature has been reached at 30C; therefore, the average temperature for the day is 25C and a 10 degree difference.  Now, the next day is much less variable and it's a bit warmer in the morning at 23C and by noon it has only warmed to the max temperature for the day of 27C; therefore, the average temperature for this day is now also 25C and a 4 degree difference.  These two days are distinguishable to a person observing the environmental conditions, but by reading the average temperatures for the day out of the newspaper you wouldn't be able to tell.  This concept is identified by degree days and is used in agronomy for understand crop development.

**Degree Days**

Degree days can be defined as the amount of time during a day that the environment is exposed to a certain threshold of temperature. (e.g. degree days above 30C).  In the example above, the first day would have 0.1356 degree days >= 30C and the second day would have zero.  This type of calculation can provide a metric for understanding if it is getting hotter over a time interval and not just a mean temperature, which masks a lot of information about temperature changes.  

Here is another simple example to illustrate. Suppose for half of the day it is 30C. A simple calculation of degree days above 25C would involve 5 degrees for half of a day, so for that particular day the degree days above 25C would be 2.5. The exposure during the day becomes longer as it becomes warmer or shorter if it is cooler.

**Technical Concepts**

The mathematics behind this concept take a bit of trigonomtry to develop, but can be represented in a simple plot:

![](https://github.com/johnwoodill/US-Degree-Days-Heat-Map/blob/master/degreedaysexplanation.jpeg?raw=true)

Taking the min and max temperature for a given day, a sine function is fit, then intergrated over the time interval.  

![](https://github.com/johnwoodill/US-Degree-Days-Heat-Map/blob/master/eq.jpg?raw=true)



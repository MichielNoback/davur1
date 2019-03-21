## load dplyr library for grouping and summary
library(dplyr)

## group by Diet and Time
by_diet_time <- group_by(ChickWeight, Diet, Time)

## summarize on weight
avg_by_diet_time <- as.data.frame(
    summarise(
        by_diet_time, 
        meanWght = mean(weight, na.rm = TRUE)))

## store timepoints for plotting
timepoints <- avg_by_diet_time[1:12, "Time"]

## convert to clean dataframe
cleaned <- data.frame(
    diet1 = avg_by_diet_time[1:12, "meanWght"],
    diet2 = avg_by_diet_time[13:24, "meanWght"],
    diet3 = avg_by_diet_time[25:36, "meanWght"],
    diet4 = avg_by_diet_time[37:48, "meanWght"])

## matrix plot
matplot(timepoints,
        cleaned,
        type = "o",
        pch = 1:4,
        main = "Average weight of mice on different diets",
        xlab = "time (days)",
        ylab = "average weight (grams)",
        col = rainbow(4))

## place legend
legend(
    x=0, 
    y=265, 
    c("diet 1", "diet 2", "diet 3", "diet 4"),
    lwd=c(2.5, 2.5),
    col = rainbow(4))

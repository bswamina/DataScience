###

library(ggplot2)
library(datasets)

###

str(mpg)
qplot(displ, hwy, data = mpg)
qplot(displ, hwy, data = mpg, color = drv)
qplot(displ, hwy, data = mpg, geom = c('point', 'smooth'))
qplot(hwy, data = mpg, fill = drv)

### facets = rows ~ cols ; use . (dot) when you dont want to specify anything

qplot(displ, hwy, data = mpg, facets = .~drv)
qplot(hwy, data = mpg, facets = drv~., binwidth = 2)

qplot(displ, hwy, data = mpg, facets = .~drv, geom=c("point", "smooth"), method="lm")

### --------------------------------------------------------------

g <- ggplot(mpg, aes(displ, hwy)) ### aesthetics - aes - takes x and y params
summary(g)
p <- g + geom_point()
print(p)
### Auto print
g + geom_point()

### --------------------------------------------------------------

g + geom_point() + geom_smooth()
g + geom_point() + geom_smooth(method = "lm")
g + geom_point() + facet_grid(drv ~ .) + geom_smooth(method = "lm")

### --------------------------------------------------------------

g + geom_point(color = 'steelblue', size = 3)
g + geom_point(color = 'steelblue', size = 3, alpha = 0.4)
g + geom_point(aes(color = drv), size = 3)
g + geom_point(aes(color = drv), size = 3) + 
    labs(x = 'Displacement', y = 'Highway Mileage') +
    labs(title = 'Mileage Graph')
g + geom_point(color = 'red', size = 3) + geom_smooth(size = 2, method = "lm")
### Turn confidence intervals off - se = FALSE
g + geom_point(color = 'red', size = 3) + geom_smooth(size = 2, method = "lm", se = FALSE)
### Theme
g + geom_point() + geom_smooth() + theme_bw(base_family = 'Times')

### --------------------------------------------------------------

g + geom_line()

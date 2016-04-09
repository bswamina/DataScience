
pal1 <- colorRamp(c('red', 'blue'))
pal1(0)
pal1(1)
pal1(0.5)

### -------------------------------------------------

pal2 <- colorRampPalette(c('red', 'blue'))
pal2(1)
pal2(2)
pal2(5)

### -------------------------------------------------

library(RColorBrewer)

cols <- brewer.pal(3, "BuGn")
print(cols)
pal3 <- colorRampPalette(cols)
image(volcano, col = pal3(20))

#load the dataset (assumed it is in working directory!)
data <- read.csv("R_data_set.csv")

#load ggplot2, which we'll use to plot some analyses - you may need to install it first!
library(ggplot2)

#take a quick peek, make sure the data loaded ok
head(data)

#creating some test plots

p <- ggplot(data = data, aes(x = in_degree, y = score)) +
        geom_smooth(method = "lm", se=FALSE, color="black", formula = y ~ x) +
        geom_point()
p

p1 <- ggplot(data = data[data$in_degree<500,], aes(x = in_degree, y = score)) +
        geom_smooth(method = "lm", se=FALSE, color="black", formula = y ~ x) +
        geom_point()
p1

#open the png device to output the final plot
png("plot.png",width = 960, height = 480)

p2 <- ggplot(data = data[data$in_degree<100,], aes(x = in_degree, y = score)) +
        geom_smooth(method = "lm", se=FALSE, color="red", formula = y ~ x) +
        geom_point()
p2

#close the device
dev.off()
city <- read.csv(file.choose(), header = TRUE, check.names = FALSE)
city5 <- as.data.frame(cbind(city$Population,city$Ave_temp_July,city$Ave_temp_Jan,city$Ave_alt,
                             city$Parks,city$Radio_station,city$TV_station,city$Labor,city$Unemployed,city$Ave_income,
                             city$Church))
colnames(city5) <- c("Population", "Ave_temp_July", "Ave_temp_Jan", "Ave_alt","Parks","Radio_station","TV_station","Labor","Unemployed","Ave_income","Church")
plot(city5)
city.pca <- prcomp(city[,c(2:12)], center = TRUE, scale. = TRUE)
summary(city.pca)
str(city.pca)
library(devtools)
library(ggbiplot)
city_groups <- c(rep("Coastal",9), rep("Non-coastal",11))
ggbiplot(city.pca)
ggbiplot(city.pca, choices = c(3,4))
ggbiplot(city.pca, choices = c(5,6))
ggbiplot(city.pca, ellipse = TRUE, groups = city_groups)


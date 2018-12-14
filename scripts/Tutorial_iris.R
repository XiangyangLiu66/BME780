#prepare the dataset
iris5 <- as.data.frame(cbind(iris$Sepal.Length,iris$Sepal.Width,iris$Petal.Length,iris$Petal.Width))
colnames(iris5) <- c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")
plot(iris5)
# Load `devtools` and `ggbiplot` libraries 
library(devtools)
library(ggbiplot)
#plot PC1 and 2
iris.pca <- prcomp(iris[, c(1:4)], center = TRUE, scale. = TRUE)
summary(iris.pca)
str(iris.pca)
ggbiplot(iris.pca)
iris_species <- c(rep("setosa", 50), rep("versicolor", 50), rep("virginica", 50))
ggbiplot(iris.pca, ellipse = TRUE, groups = iris_species)


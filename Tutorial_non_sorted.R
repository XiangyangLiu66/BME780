#Part 1: Data generation
set.seed(99)
x_raw <- sample(1:100, 50, replace=TRUE)
set.seed(50)
y_raw <- sample(1:100, 50, replace=TRUE)
x <- x_raw
y <- y_raw
plot(x, y)
abline(lm(y ~ x), col="red")
x_mean = mean(x)
y_mean = mean(y)
x_normalized = x - x_mean
y_normalized = y - y_mean
plot(x_normalized, y_normalized)
abline(lm(y_normalized ~ x_normalized), col="red")
#Part 2: Calculating covariance and eigenvector/eigenvalues
a = cov(x,x)
b = cov(x,y)
c = cov(y,x)
d = cov(y,y)
cov_matrix <- matrix(c(a,b,c,d),2,2, byrow = TRUE)
ev <- eigen(cov_matrix)
values <- ev$values
vectors <- ev$vectors
#Part 3: deriving the new dataset and calculating PCs
v1 <- matrix(vectors[,1], 1,2, byrow = FALSE)
v2 <- matrix(vectors[,2], 1,2, byrow = FALSE)
v1_v2 <- t(vectors)
normalized_matrix <- matrix(c(x_normalized,y_normalized),2,50, byrow = FALSE)
PC_v1 <- v1 %*% normalized_matrix
PC_v2 <- v2 %*% normalized_matrix
PC_v1_v2 <- v1_v2 %*% normalized_matrix
PC_v1_proportion = signif(values[1]/(values[1] + values[2]), digits = 3)
PC_v2_proportion = signif(values[2]/(values[1] + values[2]), digits = 3)
plot(PC_v1_v2[1,], PC_v1_v2[2,], xlab = paste0("PC1 (proportion=", PC_v1_proportion, ")"),
     ylab = paste0("PC2 (proportion=", PC_v2_proportion, ")"))
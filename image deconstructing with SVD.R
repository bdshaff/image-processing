library(imager)

aston = load.image("images/aston-db5.jpg")
aston_mat = aston[,,2]
aston_decomp = svd(aston_mat)

par(mfrow = c(4,4), mar = c(1,1,1,1))
plot(aston, axes = FALSE, main = "original image")
for(i in seq(2, 30, by = 2)){
  n = i
  reduced_img = as.cimg(aston_decomp$u[,1:n] %*% diag(aston_decomp$d[1:n]) %*% t(aston_decomp$v[,1:n]))
  plot(reduced_img, axes = FALSE, main = paste(i))
}


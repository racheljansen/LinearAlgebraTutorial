#------------------------------------------------------------
#                 Basics of Linear Algebra
#                 QuACK Workshop, 10.13.16
#------------------------------------------------------------

# 1. What is a vector? An example or a drawing will suffice.
x <- c(1,1)
x

plot(c(0,1),c(0,1))
arrows(0,0,1,1,col="blue")


# 2. Please give an example of a matrix. What are they used for?
M <- matrix(rnorm(4),2,2)
M


# 3. Let v be the vector (2,5,7). What is 3 * v?
v <- c(2,5,7)
v
3*v


# 4. Let w be the vector (3,4,1). What is the dot product v∙w  ?
w  <-  c(3,4,1)
w
v*w # careful, this does element-wise multiplication, which is not the same as a dot product!

v %*% w
w %*% v


# 5. If you multiply a 2 x 3 matrix with a 3 x 7 matrix, what is the size of the matrix you will end up with? 
# What about if you multiply a 4 x 4 with a 3 x 4?

# 2x3 times 3x7
M1 <- matrix(rnorm(6),2,3) # generates 6 numbers from a normal distribution and arranges them in a 2x3 matrix
M2 <- matrix(rnorm(21),3,7) 
dim(M1)
dim(M2)
dim(M1 %*% M2)

# 4x4 times 3x4
M1 <- matrix(rnorm(16),4,4)  
M2 <- matrix(rnorm(12),3,4)  
dim(M1)
dim(M2)
dim(M1 %*% M2) # you should get an error!


# 6. Let A = [(2 1;5 0)]  and B = [(1 1;4 2)]. Calculate A + B, AB, and 2A – B.
A = matrix(c(2,5,1,0),nrow=2,ncol=2)
B = matrix(c(1,1,4,2),nrow=2,ncol=2,byrow=T)
A
B
dim(A)
dim(B)
A+B
A*B # careful, this does element-wise multiplication! 
A %*% B # this is the appropriate operation in R for matrix multiplication!
2 * A - B


# 7. What is the norm of the vector (3,1,2,4)?
x  <- c(3,1,2,4)
length(x) # careful, this just tells you how many elements are in a vector!

norm(x, type="2") # this gives the euclidean norm
sqrt(sum(x*x)) # this is the mathematical version


# 8. What is a unit vector? 
unitx <- x/(norm(x, type="2"))
norm(unitx, type="2") # this show us that x is of length 1! The definition of a unit vector


# 9. What is the transpose of B?
t(B)


# 10. What is an eigenvector? An eigenvalue? 
M = matrix(c(4,-1,2,1),nrow=2,ncol=2) 
M
eigen(M)


### Defining Matrices ###
W <- matrix(c(rep(1, 3), rep(2, 3)), 2, byrow = T)
W
X <- matrix(c(3, 3, 3), nrow=3, ncol=1)
X
Y <- rbind(W,t(X))
Y
Z <- cbind(t(W),X)
Z
c(Z) # deconstructs a matrix


### Uses of the inner product ###

# cosine example
x <-  c(1,0)
y <-  c(-1,0)
normx <- norm(x, type="2")
normy <- norm(y, type="2")
cospi <- cos(pi)
cosxy <- (x%*%y)/(normx*normy)
sprintf("cos(pi): %s", cospi)
sprintf("cos(x,y): %s", cosxy)

#cor(x, use=all.obs, method=pearson) # how you could calculate a pearson correlation in R



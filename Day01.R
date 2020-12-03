# read input convert to vector
day1_in <- scan("~/AdventOfCode2020/inputs/day1.txt")
#use combn to find all possible pairs
day1_mat <- combn(day1_in, 2)
#find which pairs sum to 2020
n <- which(colSums(day1_mat) == 2020)
# store col values in vector
s <- day1_mat[,n]
# multiply vector elements against each other
s[1]*s[2]
#[1] 158916

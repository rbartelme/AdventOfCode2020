library(stringr)

#read in as character vector with each line being an element of the vector
day3_in <- readLines(con = "~/AdventOfCode2020/inputs/day3.txt", warn = FALSE)

#string split into matrix, convert to dataframe for logical indexing
day3_mat <- as.data.frame(str_split(string = day3_in,
                                    pattern = "", simplify = TRUE))
#make vector to catch output
traveled <- vector(mode = "character", length = nrow(day3_mat))
#collumn bind to walk across the width
day3_cat <- cbind(day3_mat, day3_mat, day3_mat, day3_mat, day3_mat,
      day3_mat, day3_mat, day3_mat, day3_mat, day3_mat, day3_mat,
      day3_mat, day3_mat, day3_mat, day3_mat, day3_mat, day3_mat,
      day3_mat, day3_mat, day3_mat, day3_mat, day3_mat, day3_mat,
      day3_mat, day3_mat, day3_mat, day3_mat, day3_mat, day3_mat,
      day3_mat, day3_mat, day3_mat, day3_mat, day3_mat, day3_mat)
#add initial starting position values
#column
y <- 1
#row
x <- 1
#for loop to walk through text & catch output in character vector
for(n in 1:nrow(day3_cat)){
  traveled[n] <- day3_cat[x, y]
  #walk to the right 3
  y <- y + 3
  #walk down 1 row
  x <- x + 1
}
#loop ended on last column, so this next line will count trees
length(which(traveled == "#"))
# [1] 5

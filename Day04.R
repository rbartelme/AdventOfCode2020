library(stringr)
#part1
#-------
#input modified with gnu awk
# gawk -v RS= -v ORS="\n\n" '{gsub("\n"," "); print}' ~/AdventOfCode2020/inputs/day4.txt > ~/AdventOfCode2020/inputs/day4mod.txt

#read in character file that was modified
day4_in <- as.data.frame(readLines("~/AdventOfCode2020/inputs/day4mod.txt"), stringsAsFactors = FALSE)

#remove blank rows
day4_no_blanks <- as.data.frame(day4_in[!apply(day4_in == "", 1, all),])

#cid: is optional, so not counted
pass_fields <- c("ecl:", "pid:", "eyr:", "hcl:", "byr:", "iyr:", "hgt:")

#make empty dataframe to catch results
day4_counts <- data.frame(matrix(NA, nrow = nrow(day4_no_blanks),
                  ncol = length(pass_fields)))

#name columns after passport fields
colnames(day4_counts) <- pass_fields

#populate dataframe with boolean for presence/absence 
for(i in 1:length(pass_fields)){
  for(j in 1:nrow(day4_no_blanks)){
  day4_counts[j,i] <- grepl(pattern = pass_fields[i], x = day4_no_blanks[j,]) 
  }
}

#check if all 7 mandatory fields are present
fields_present <- vector(mode = "numeric", length = nrow(day4_counts))
for(i in 1:length(fields_present)){
fields_present[i] <- length(which(day4_counts[i,] == TRUE))
}
#find number of passports with appropriate number of fields answer to part 1
length(which(fields_present == 7))
#[1] 235
#--------------------
#part 2
#---------------------

fields_index <- which(fields_present == 7)


day4_first_pass <- as.data.frame(day4_no_blanks[fields_index,])
colnames(day4_first_pass) <- "raw"
day4_first_pass$raw <- gsub(pattern = "cid:[0-9].* ", replacement = "",
                                 x = day4_first_pass$raw, perl = TRUE)

colnames(day4_pass2) <- "raw"
foo <- data.frame(do.call('rbind',
              strsplit(as.character(day4_pass2$raw),' ',fixed=TRUE)),)

foo2 <- t(apply(foo, 1, sort))

df <- data.frame(matrix(unlist(foo2), nrow=length(foo2), byrow=T))

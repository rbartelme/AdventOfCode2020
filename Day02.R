#load stringr library
library(stringr)

#read in file
day2_in <- read.table(file = "~/AdventOfCode2020/inputs/day2.txt", sep = c(" ", "-"))

#fix issues with range rules with character string split
rules_range <- data.frame(do.call('rbind', 
                      strsplit(as.character(day2_in$V1), '-', fixed=TRUE)))
colnames(rules_range) <- c("lower", "upper")

#combine in new dataframe
cleaner <- cbind(rules_range, day2_in[,2:3])

#name last two columns of the new data frame
colnames(cleaner)[3:4] <- c("rule", "password")

#get rid of colon in column 3 with global substitution
cleaner$rule <- gsub(":", "", cleaner$rule)

#numeric vector to catch output
rule_counts <- vector(mode = "numeric", length = 1000)

#use stringr's string count the rule ex. str_count(string, "a")
for(i in 1:length(cleaner$rule)){
  rule_counts[i] <- str_count(cleaner$password[i], cleaner$rule[i])
}

#bind in new dataframe
rule_df <- cbind(cleaner, rule_counts)
#fix character coercion from lines 8 & 9
rule_df[,1:2] <- lapply(rule_df[,1:2], as.numeric)

#make a vector to catch output
rules_met <- vector(mode = "logical", length = 1000)

#check if rules are met using indexing of the data frame
for(i in 1:1000){
  if(rule_df[i,5] <= rule_df[i,2] && rule_df[i,5] >= rule_df[i,1]){
    rules_met[i] <- TRUE
  }else{
    rules_met[i] <- FALSE
  }
}
#find number of passwords that meet the rules criteria
length(which(rules_met == TRUE))
# [1] 580

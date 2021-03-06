#!/usr/bin/Rscript

# apparently kallisto is a program for quantifying RNA-seq experiments ... cool!
# https://pachterlab.github.io/kallisto/starting 
# Abundances are reported in “estimated counts” (est_counts) and in Transcripts Per Million (TPM).
# goal of code is to print out a list of est_counts that are 3 times above the standard deviation

# reading in the table. there's a way to get row 1 as the column headers, but I can't remember ... it doesn't matter
abundance_table = read.table("abundance.tsv")

# I'm only interested in est_counts and data labels here
# it's simpler to just be working with columns 1 and 4
est_counts <- abundance_table$V4
target_id <- abundance_table$V1
# row 1 is text and the rest are #s, so we gotta remove row 1 cause #math
est_counts[1]
# list slicing index position 2 (R indexes start at 1, not 0) and going to length of est_counts
est_count_numbers <- est_counts[2:length(est_counts)]
target_id_labels <- target_id[2:length(target_id)]
# est_count_numbers should be 1 less than est_counts ... yup, the math checks out
print("the number of data rows of your file is: ")
print(length(target_id))
#length(target_id_labels)
#length(est_counts)
length(est_count_numbers)



#est_count_numbers
length <- length(est_count_numbers)
sum <- 0
# did I mess up the lists? I should get ENST00000461467.1 1.13596; yup :)
# print(est_count_numbers[6])
# print(target_id_labels[6])
highest_number <- 0
for (number in est_count_numbers) {
  # print(number)
  sum <- as.integer(number) + sum
  if(as.integer(number) > highest_number) {
    highest_number <- as.integer(number)
  }
}
# est_count_numbers
print("The sum of the est_counts is: ")
print(sum)
print("The highest est_count is: ")
print(highest_number)

average <- sum/length
print("The average est_count is: ")
print(average)
#standard_deviation <- sqrt(sum((x - mean(x))^2) / (n - 1))
#sd(est_count_numbers)
#est_count_numbers <- as.integer(est_count_numbers)
standard_deviation <- sqrt(sum((as.integer(est_count_numbers) - mean(as.integer(est_count_numbers)))^2) / (length - 1))
print("The standard deviation of the st_counts is: ")
print(standard_deviation)
# using the R standard deviation to make sure that I did the formula right
#print(sd(as.integer(est_count_numbers)))



# how many est_counts are above 3Xstandard_deviation + average?
counter <- 0
for (number in est_count_numbers) {
  if (number > (3*standard_deviation+average)) {
    counter <- counter + 1
  }
}
# this is the number that are above 3Xstandarddev + average
print("The number of est_counts that are above 3*stdev + average is: ")
print(counter)
# this is the percentage that are 3Xstandarddev + average
# AWESOME! It follows the 68-95-99.7 rule :D
print("The total percentage of est_counts that are 3*stdev + average is")
print(counter)
print(length)
print(100*counter/length(est_count_numbers))


# Let's print some of the highest #s
# I fiddled a bit and found that 5.4*sd + average filters down to a set of numbers that we can manually check the tsv file for
i <- 1
print("Here are some of the highest numbers: ")
for (number in est_count_numbers) {
  if (as.integer(number) > (5.40*standard_deviation+average)) {
    print(paste0("The sample titled ", target_id_labels[i], " has a value of ", est_count_numbers[i]))
  }
  i <- i + 1
}
# print(i)
# SOLID!!! LibreOffice's sort function agrees w/ my math :D

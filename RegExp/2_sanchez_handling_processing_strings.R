library(stringr)
library(wordcloud)

# Chapter 1
# Calculate and plot the frequency of vowels in US state names
state_names <- tolower(rownames(USArrests))
vowels <- c("a", "e", "i", "o", "u", "y")
vowels_count <- sapply(vowels, function(x) sum(str_count(state_names, pattern = x)))
names(vowels_count) <- vowels
barplot(sort(vowels_count, decreasing = TRUE))

#############################################################

# Chapter 7
# Example 1: Reversing strings

test <- "This is a test string"

# String reversed by character
rev_char <- function(x){
  split <- str_split(x, pattern = "")
  split_rev <- rev(split[[1]])
  combine_rev <- str_c(split_rev, collapse="")
  return(combine_rev)
}

# String reversed by word 
rev_word <- function(x){
  split <- str_split(x, pattern = " ")
  split_rev <- rev(split[[1]])
  combine_rev <- str_c(split_rev, collapse=" ")
  return(combine_rev)
}

rev_char(test)
rev_word(test)

#################################################################

# Example 2: Matching email addresses

emails <- c(
  "simple@example.com",
  "johnsmith@email.gov",
  "marie.curie@college.edu",
  "very.common@example.com",
  "a.little.lengthy.but.ok@dept.example.com",
  "disposable.style.email.with+symbol@example.com",
  "not_good@email.address")

str_detect(emails, pattern = "^[\\w\\.-]+@[\\w\\.-]+\\.[a-z]{2,6}$")

#############################################################

# Example 3: Matching HTML elements

url1 <- "http://www.r-project.org/mail.html"
links <- readLines(url1)
hrefs_match <- str_match(links, '^.*<a href="(https.*sig.*)">.*$')

# Print non-empty output from matching group
print(hrefs_match[!is.na(hrefs_match[, 2]), 2])

############################################################

# Example 4: 

url2 <- "http://www.biomedcentral.com/info/journals/biomedcentraljournallist.txt"
journ <- read.table(url2, header = TRUE, sep = ",", stringsAsFactors = FALSE)

# Remove punctuation, multiple spaces and padding
titles_nopunct <- str_replace_all(journ$Journal.name, pattern = "[^\\w\\s]", replacement = "")
titles_nopunct <- str_replace_all(titles_nopunct, "\\s+", " ")
titles_nopunct <- str_trim(titles_nopunct, side = "both")

# Split strings into words
words_split <- str_split(titles_nopunct, "\\s")
words_length <- unlist(lapply(words_split, length))
table(words_length)
titles_nopunct[words_length == 9]

# Compile dictionary, calculate frequencies of each word, construct barplot and wordcloud
dict <- unique(unlist(words_split))
dict_count <- sapply(dict, function(x) sum(str_detect(words_split, x)))
dict_count <- sort(dict_count, decreasing = TRUE)
barplot(dict_count[1:30], names.arg = rownames(dict_count)[1:30], las = 2)
wordcloud(names(dict_count), dict_count, min.freq = 10)

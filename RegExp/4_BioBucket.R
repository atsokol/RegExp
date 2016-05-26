# Keep only the first word in a string
# Use str_match to capture the relevant group in ()
str0 <- c("  George W. Bush", "&9Lyndon B. Johnson")
str_match(str0, "\\b[^A-Za-z]*([A-Za-z]+)\\b")

# Keep only last word in a string
# Replace with first group
str1 <- c("George W. Bush", "Lyndon B. Johnson")
str_replace(str1, "^.*\\b(\\w+)\\b$", "\\1")


# Splits string only at the first occurence of separator
x <- "I want to split here, though I don't want to split elsewhere, even here."
y <- c("Here's comma 1, and 2, see?", "Here's 2nd sting, like it, not a lot.")
XX <- "SoMeThInGrIdIcUlOuS"
str_split_fixed(x, pattern = ",", n = 2)
str_split_fixed(y, pattern = ",", n = 2)
str_split_fixed(XX, pattern = ",", n = 2)

# Remove punctuation signs
str2 <- c("&George W. Bush", "Lyndon B. Johnson?")
str_replace_all(str2, "[^A-Za-z0-9\\s\\.]", "")

# Note the "greedy" extraction
str3 <- "[question(37), question_pipe(\"Person10\")]"
str_match_all(str3, "\\(.*?([A-Za-z0-9]+).*?\\)")

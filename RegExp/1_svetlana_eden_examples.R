library(stringr)

# Replace $ with .
s <- "stringr$uses$regular$expressions"
s1 <- str_replace(s, "$", ".")
s2 <- str_replace_all(s, "\\$", ".")

##=======================================

# Define data frame, select strings consisting only of alphanumericals
d <- data.frame(
  id = c(11, 22, 33, 44, 55, 66, 77, 88),
  drug = c(
    "vitamin E",
    "vitamin ESTER-C",
    " vitamin E ",
    "vitamin E(ointment)",
    "",
    "vitamin E ",
    "provitamin E\n",
    "vit E"
  ),
  text = c(
    "",
    " ",
    "3 times a day after meal",
    "once a day",
    " ",
    " one per day ",
    "\t",
    "\n "
  ),
  stringsAsFactors = FALSE)
print(d$text)
d$text[!str_detect(d$text, "[\\w\\d]")] <- NA
str_trim(d$text, side = "both")

##=======================================

# Select 'vitamin E' strings in various spellings
print(d$drug)
d$drug <- str_trim(d$drug, side = "both")
d$drug[str_detect(d$drug, "^vit(amin)? E($|\\W)")]

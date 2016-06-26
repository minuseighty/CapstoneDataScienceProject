## TRANSFORMATION

conn.3 <- file("profanity.txt", open = "rb") ## load profanity words
profanity <- readLines(conn.3, encoding = "UTF-8", skipNul = TRUE)
close(conn.3)

# All instances of a special character should be replaced by spaces.
spacer <- content_transformer(function(x, pattern)
    {return (gsub(pattern, " ", x))})

corpus <- tm_map(corpus, spacer, ":") ## remove ":"
corpus <- tm_map(corpus, spacer, "/") ## remove "/"
corpus <- tm_map(corpus, spacer, "@") ## remove "@"
corpus <- tm_map(corpus, spacer, "-") ## remove "-"
corpus <- tm_map(corpus, spacer, "#") ## remove "#"
corpus <- tm_map(corpus, content_transformer(tolower)) #transform to lowercase
corpus <- tm_map(corpus, removeWords, profanity) #remove bad words
corpus <- tm_map(corpus, removePunctuation) # remove punctuation
corpus <- tm_map(corpus, removeNumbers) # remove numbers
corpus <- tm_map(corpus, stripWhitespace) # get rid of whitespace
## DOCUMENT TERM MATRIX

tdm <- TermDocumentMatrix(corpus) ## document term matrix
tdm <- removeSparseTerms(tdm, 0.8) ## sparse
freq <- colSums(t(as.matrix(tdm))) ## word frequency
ord <- order(freq, decreasing = TRUE)  ## order by decreasing
freq <- freq[head(ord, n = 100)] ## top 50 words
df <- data.frame(word =names(freq), freq = freq) ## store in data frame
rm(tdm, freq, ord)

##N-GRAMS (2,3,4-GRAMS)

bitokenizer <- function(x) unlist(lapply(ngrams(words(x),2),paste,collapse=" "), use.names = FALSE)
bigram <- TermDocumentMatrix(corpus, control = list(tokenize = bitokenizer))
bigram <- removeSparseTerms(bigram, 0.8)
bi.freq <- colSums(t(as.matrix(bigram)))
bi.ord <- order(bi.freq, decreasing = TRUE)
bi.freq <- bi.freq[head(bi.ord, n =100)]
bi.df <- data.frame(word =names(bi.freq), freq = bi.freq)
rm(bitokenizer, bigram, bi.freq, bi.ord)

tritokenizer <- function(x) unlist(lapply(ngrams(words(x),3),paste,collapse=" "), use.names = FALSE)
trigram <- TermDocumentMatrix(corpus, control = list(tokenize = tritokenizer))
trigram <- removeSparseTerms(trigram, 0.8)
tri.freq <- colSums(t(as.matrix(trigram)))
tri.ord <- order(tri.freq, decreasing = TRUE)
tri.freq <- tri.freq[head(tri.ord, n =100)]
tri.df <- data.frame(word =names(tri.freq), freq = tri.freq)
rm(tritokenizer, trigram, tri.freq, tri.ord)

quadtokenizer <- function(x) unlist(lapply(ngrams(words(x),4),paste,collapse=" "), use.names = FALSE)
quadgram <- TermDocumentMatrix(corpus, control = list(tokenize = quadtokenizer))
quadgram <- removeSparseTerms(quadgram, 0.8)
quad.freq <- colSums(t(as.matrix(quadgram)))
quad.ord <- order(quad.freq, decreasing = TRUE)
quad.freq <- quad.freq[head(quad.ord, n =100)]
quad.df <- data.frame(word =names(quad.freq), freq = quad.freq)
rm(quadtokenizer, quadgram, quad.freq, quad.ord)


## SAVE
save(df, file = "df.RData")
save(bi.df, file = "bidf.RData")
save(tri.df, file = "tridf.RData")
save(quad.df, file = "quaddf.RData")
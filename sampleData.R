## DESCRIBE ORIGINAL DATA


## word counts, file size, and line counts were done using Terminal on Mac
## Zainil-Jessanis-MacBook-Pro:en_US Zainil$ wc  *.txt
## 899288 37334690 210160014 en_US.blogs.txt
## 1010242 34372720 205811889 en_US.news.txt
## 2360148 30374206 167105338 en_US.twitter.txt


## DATA SAMPLE 

sample.data <- function(input, output, probability) {
    conn <- file(input, "r")
    set.seed(967)
    all.sample <- readLines(conn, encoding = "UTF-8", skipNul = TRUE)
    subset.input <- all.sample[rbinom(n = length(all.sample), size = 1, 
                                      prob = probability) == 1]
    close(conn)
    
    conn.2 <- file(output, "w")
    writeLines(subset.input, conn.2)
    close(conn.2)
}


sample.data("en_US.blogs.txt", "sample/sample.en_US.blogs.txt", 0.1)
sample.data("en_US.news.txt", "sample/sample.en_US.news.txt", 0.1)
sample.data("en_US.twitter.txt", "sample/sample.en_US.twitter.txt", 0.1)


## CORPUS

library(tm)
docs <- DirSource("sample/") ##source object
corpus <- VCorpus(docs)  ##volatile corpus is stored in memory
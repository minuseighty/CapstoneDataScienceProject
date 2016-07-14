library(hash)

## Split the data frames into user inputs plus next word
df$word <- as.character(df$word)

bi.df$word <- as.character(bi.df$word)
bi.split <- data.frame(t(data.frame(strsplit(bi.df$word, ' '))))
pred.bi <- data.frame(as.character(bi.split$X1), 
                      as.character(bi.split$X2), 
                      bi.df$freq) 
colnames(pred.bi) <- c("first", 
                       "second", 
                       "freq")
pred.bi$first <- as.character(pred.bi$first)
pred.bi$second <- as.character(pred.bi$second)
rm(bi.df, bi.split)

tri.df$word <- as.character(tri.df$word)
tri.split <- data.frame(t(data.frame(strsplit(tri.df$word, ' '))))
pred.tri <- data.frame(paste(as.character(tri.split$X1), 
                       as.character(tri.split$X2)), 
                       as.character(tri.split$X3), 
                       tri.df$freq) 
colnames(pred.tri) <- c("second", 
                        "third", 
                        "freq")
pred.tri$second <- as.character(pred.tri$second)
pred.tri$third <- as.character(pred.tri$third)
rm(tri.df, tri.split)

quad.df$word <- as.character(quad.df$word)
quad.split <- data.frame(t(data.frame(strsplit(quad.df$word, ' '))))
pred.quad <- data.frame(paste(as.character(quad.split$X1), 
                        as.character(quad.split$X2), 
                        as.character(quad.split$X3)), 
                        as.character(quad.split$X4), 
                        quad.df$freq) 
colnames(pred.quad) <- c("third", 
                        "fourth", 
                        "freq")
pred.quad$third <- as.character(pred.quad$third)
pred.quad$fourth <- as.character(pred.quad$fourth)
rm(quad.df, quad.split)

## for unigram try Maximum Likelihood Estimator based on frequency
## for trigram try Stupid Backoff to bigram/unigram
## Due to relatively small sample size underfitting problem
## hard to solve given computing restraints

predict.word <- function(user, 
                         unigram = df, 
                         bigram = pred.bi, 
                         trigram = pred.tri,
                         quadgram = pred.quad,
                         results = 3) {
    
    user <- removePunctuation(user)
    user <- removeNumbers(user)
    user <- tolower(user)
    
    if (user == "") {
        return("Please enter a valid input.")
    }
    
    quad.user <- paste(unlist(strsplit(user," "))[length(unlist(strsplit(user, " "))) - 2], 
                       unlist(strsplit(user," "))[length(unlist(strsplit(user, " "))) - 1],
                       unlist(strsplit(user," "))[length(unlist(strsplit(user, " ")))])
    find.quad <- grepl(paste0("^", quad.user, "$"), quadgram$third)
    sub.quad <- quadgram[find.quad, ]
    tri.user <- paste(unlist(strsplit(user," "))[length(unlist(strsplit(user, " "))) - 1], 
                      unlist(strsplit(user," "))[length(unlist(strsplit(user, " ")))])
    find.tri <- grepl(paste0("^", tri.user, "$"), trigram$second)
    sub.tri <- trigram[find.tri, ]
    bi.user <-unlist(strsplit(user, " "))[length(unlist(strsplit(user, " ")))]
    find.bi <- grepl(paste0("^", bi.user, "$"), bigram$first)
    sub.bi <- bigram[find.bi, ]
    
    if (sum(find.quad) == 0) {
        if (sum(find.tri) == 0) {
            if (sum(find.bi) == 0) {
                print(head(unigram[,1], results))
            } else {
                output.bi <- head(sub.bi[ ,2], results)
                if (length(output.bi) < results) {
                    names <- c(sub.bi$second,
                               unigram$word)
                    output.bi2 <- data.frame(names = names,
                                             stringsAsFactors = FALSE)
                    print(head(unique(output.bi2[ ,1]), results))
                } else {
                    print(output.bi)
                }
                
            }
            
        } else {
            output.tri <- head(sub.tri[ ,2], results)
            if (length(output.tri) < results) {
                names <- c(sub.tri$third, 
                           sub.bi$second)
                output.tri2 <- data.frame(names = names,
                                          stringsAsFactors = FALSE)
                if (length(output.tri2) < results) {
                    names <- c(sub.tri$third,
                               sub.bi$second,
                               unigram$word)
                    output.tri3 <- data.frame(names = names,
                                              stringsAsFactors = FALSE)
                    print(head(unique(output.tri3[ ,1]), results))
                } else {
                    print(head(unique(output.tri2[ ,1]), results))
                }
            } else {
                print(output.tri)
            }
            
        }
        
    } else {
        output.quad <- head(sub.quad[,2], results)
        if (length(output.quad) < results) {
            names <- c(sub.quad$fourth, 
                       sub.tri$third)
            output.quad2 <- data.frame(names = names,
                                       stringsAsFactors = FALSE)
            if (length(output.quad2) < results) {
                names <- c(sub.quad$fourth, 
                           sub.tri$third, 
                           sub.bi$second)
                output.quad3 <- data.frame(names = names, 
                                           stringsAsFactors = FALSE)
                print(head(unique(output.quad3[ ,1]), results))
         } else {
             print(head(unique(output.quad2[ ,1]), results))
          }
          
         } else {
            print(output.quad)
        }
    }
    
    
}    
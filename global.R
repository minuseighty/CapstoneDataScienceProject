library(tm)
load("preduni.RData")
load("predbi.Rdata")
load("predtri.Rdata")
load("predquad.Rdata")


##prediction function
predict.word <- function(user, 
                         unigram = df, 
                         bigram = pred.bi, 
                         trigram = pred.tri,
                         quadgram = pred.quad,
                         results = 5) {
    
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
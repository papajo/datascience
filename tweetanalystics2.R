library(twitteR)
df <- do.call("rbind",lapply(tweets, as.data.frame))
dim(df)
library(tm)
review_text <- paste(df$text, collapse=" ")
review_source <- VectorSource(review_text)
corpus <- Corpus(review_source)
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, stripWhitespace)
myStopwords <- c(stopwords('english'), 'available', 'via')
corpus <- tm_map(corpus, removeWords, myStopwords)


# Now we create the document-term matrix.
dtm <- DocumentTermMatrix(corpus)
dtm2 <- as.matrix(dtm)
wordFreq <- colSums(dtm2)
wordFreq <- sort(wordFreq, decreasing=TRUE)

# wordcloud
library(wordcloud)
set.seed(375) #to make it repeatable
wordcloud(words=names(wordFreq), freq=wordFreq)
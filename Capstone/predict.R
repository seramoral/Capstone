library(stringr) 
library(tm)

unigrams <- readRDS("unigrams.RData")
bigrams <- readRDS("bigrams.RData")
trigrams <- readRDS("trigrams.RData")

predict_words_length <- function(set_words){
	l = length(set_words)

	if(l == 0){
		single_words <- as.vector(unigrams$words)
		frequencies <- as.vector(unigrams$frequency)
		index <- order(frequencies, decreasing = T)
		order_prediction <- single_words[index]
		predicted_words <- as.character(order_prediction[1:3])
	}

	else if(l == 1){
		first_word <- set_words[1]
		first_word_bigrams <- as.vector(bigrams$word1) 
		associated_bigrams <- bigrams[first_word_bigrams==first_word,]
		num_bigrams <- dim(associated_bigrams)[1]
		
		if(num_bigrams == 0)
			predicted_words <- "Not Found"

		else{
			associated_frequencies <- as.vector(associated_bigrams$freq)
			associated_words <- as.vector(associated_bigrams$word2) 
			index <- order(associated_frequencies, decreasing = TRUE)
			ordered_words <- associated_words[index]
			predicted_words <- as.character(ordered_words[1:3])
		}
	}

	else{
		first_word <- set_words[l-1]
		second_word <- set_words[l]
		first_word_trigrams <- as.vector(trigrams$word1) 
		second_word_trigrams <- as.vector(trigrams$word2)
		associated_trigrams <- trigrams[first_word_trigrams==first_word && second_word_trigrams == second_word,]
		num_trigrams <- dim(associated_trigrams)[1]
		
		if(num_trigrams == 0)
			predicted_words <- "Not Found"

		else{
			associated_frequencies <- as.vector(associated_trigrams$freq)
			associated_words <- as.vector(associated_trigrams$word3) 
			index <- order(associated_frequencies, decreasing = TRUE)
			ordered_words <- associated_words[index]
			predicted_words <- as.character(ordered_words[1:3])
		}

	}

	return(predicted_words)
}

predict_next_words <- function(sentence){
	sentence <- tolower(sentence)
	sentence <- removePunctuation(sentence,preserve_intra_word_dashes = TRUE)
	sentence <- stripWhitespace(sentence)

	words <- strsplit(sentence," ")[[1]]
	words2 <- words
	finish <- FALSE

	while(!finish){
		predicted_words <- predict_words_length(words2)

		if(predicted_words[1] == "Not Found")
			words2 <- words2[-1]

		else
			finish = TRUE
	}

	return (predicted_words)
}
# Coursera Data Science Capstone Project

This is my shiny application corresponding to the final project of this course. We will explain the details about it. 

## Utility of this application

The main aim of this application is to predict in each moment the most probable word that the user want to write. We show the three most probable words.  

## Procedures

In order to predict the three most probable words we first obtain the unigrams bigrams and trigrams, ordered by the frecuency of ocurrence. For this previous step we load the data and clean it. Once we have cleaned the data we obtain the n-grams for n = 1,2,3. We save the n-grams in files. 

We have done this previous task in the Millestone Report. In this way, we have to load these files only once and we do not have to do the preproccesing that each time that the user enter a new word. 

For predict the next word:

1. If the user has not entered any word the predicted words are the three most frecuent unigrams.    

2. If the user has entered only one word, we select the bigrams whose first word is the word that the user has entered. The three predicted words are the second words of the three most frecuent bigrams. If there is not bigrams with these feature we go to 1.

3. If the user has entered two or more words, we select the trigrams whose first word is the word that the user has entered, and the same with the second words. If there is not trigrams we go to 2. 
The three predicted words are the third words of the three most frecuent trigrams. 

## Usage of this application

The two main steps carried out in this application are the following:

1. You enter a word. Recall that only English words are allowed
2. After a few seconds the three predicted words are showed, in decreasing order
   of frecuences
3. The predicted word is the most frequent word, it is to say, the word of the left.

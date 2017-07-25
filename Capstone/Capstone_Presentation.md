Data Science Capstone. Final Project
========================================================
author: Serafin Moral Garcia
date: 24th July 2017
autosize: true

![SwiftKey and Coursera Logo](coursera_logo.png)

The main objective of this application is predict the most probable next word that a person wants to write.  

Basic steps
========================================================

The basic steps that we have done in order to make the application are the following 

- Download the data
- Clean the data
- Build the n-grams for $n = 1,2,3$. (Recall that a n-gram is a contiguos sequence 
of n words)
- Build a predictive model 
- Develop the data product

Predictive algorithm
========================================================

The steps of our algorithm are the following:

1. If there are no entered word, the most frequent word (unigram) is predicted

2. If there is only one word entered, the predicted word is the second word of the most frequent bigram between the bigrams whose first word is the same as the word entered. If there are no coincident bigrams go to step 1.

3. If there are two or more words entered, we only consider the two last. We consider the trigrams whose first word is the same as the first last word and the second word is the same as the second last word. If there are no trigrams go to 2. Else, the predicted word is the third word of the most frequent trigram. 

Usage of the application 
========================================================

We describe below the main issues when you use our application:

- In the left side you find the instructions to follow to using the application. 
- At the bottom of that panel there is a gap where you enter your text.
- No english words are not allowed.
- Once you have entered a text, after few seconds the three more probable predicted words are shown, in decreasing order of frequencies.
- It is undertood that the predicted word is the one that is the one that is more at the left
- Finally, all the time, you can see in a text of red color the text that you have entered.

For more information
========================================================

- You can find the application here [] ()
- The whole code and documents required for the application can be found in this link []()

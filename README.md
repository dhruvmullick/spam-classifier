spam-classifier
======

A Machine Learning based spam classifier

Dataset is composed of :  
  1. Training Set : ham 900, spam 2700
  2. Test Set : ham 300, spam 900
  3. Cross Validation set : ham 300, spam 900

First a list of the words present in the training set is made. After this, we find the count of these words in every set. We take the 1000 most frequently occurring words, and create a feature vector. This is stored in a csv file.

Note that for the words:
  1. Stop Words : We have omitted the most commonly used words (a, the etc).
  2. Stemming : We have used stemming.
  3. Non alphabet characters have been removed.

------

Now Logistic regression is applied taking the 1000 most frequently used words as features.

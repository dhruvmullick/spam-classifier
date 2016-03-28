"""
Open the ham and spam files, generate the list of distinct words
For each file, find the count of those distinct words. Create a csv file and the feature vector of each file as a row
"""

import os
import wordList
import countWords
import dictionaryCount
import operator
import csv
from collections import Counter

hamTrainRoot="/Users/dhruvmullick/CS/Project Work/spam-classifier/Dataset/training/ham"
spamTrainRoot="/Users/dhruvmullick/CS/Project Work/spam-classifier/Dataset/training/spam"
hamCVRoot="/Users/dhruvmullick/CS/Project Work/spam-classifier/Dataset/cv/ham"
spamCVRoot="/Users/dhruvmullick/CS/Project Work/spam-classifier/Dataset/cv/spam"
hamTestRoot="/Users/dhruvmullick/CS/Project Work/spam-classifier/Dataset/test/ham"
spamTestRoot="/Users/dhruvmullick/CS/Project Work/spam-classifier/Dataset/test/spam"


Words = wordList.genWordsConsidered(hamTrainRoot,spamTrainRoot)
# print len(Words)
# print Words

## generate count of words for train
D1=countWords.getCountDict(hamTrainRoot,Words)
# D1 = sorted(D1.items(), key=operator.itemgetter(1),reverse=True)
D2=countWords.getCountDict(spamTrainRoot,Words)
# D2 = sorted(D2.items(), key=operator.itemgetter(1),reverse=True)

#merge the contents of the two dictionaries to get the frequency dictionary.
a1=Counter(D1)
a2=Counter(D2)
D = a1+a2
D = sorted(D.items(), key=operator.itemgetter(1),reverse=True)
# print D

#1000 highest frequency words

os.chdir("/Users/dhruvmullick/CS/Project Work/spam-classifier/")
f = open('1000words.txt','w')
c=1
for t in D:
    w=t[0]
    f.write(w)
    f.write('\n')
    c=c+1
    if c>1000:
        break
f.close()
"""
Open the ham and spam files, generate the list of distinct words
For each file, find the count of those distinct words. Create a csv file and the feature vector of each file as a row
"""

import pandas
import os
import glob
import re

hamTrainRoot="/Users/dhruvmullick/CS/Project Work/spam-classifier/Dataset/training/ham"
spamTrainRoot="/Users/dhruvmullick/CS/Project Work/spam-classifier/Dataset/training/spam"
trainwords={}

### Generate the words which are to be considered (using train)
os.chdir(hamTrainRoot)
L=glob.glob("*.txt")

for file in L:
    f=open(file,'r')
    for line in f:
        match=re.search(r'^Subject',line)
        if not match:   #not subject
            matchword=re.findall(r'[\w]+',line)
            if matchword:
                for word in matchword:
                    if not (word[0]>='0' and word[0]<='9'):
                        trainwords[word]=1

os.chdir(spamTrainRoot)
L=glob.glob("*.txt")

for file in L:
    f=open(file,'r')
    for line in f:
        match=re.search(r'^Subject',line)
        if not match:   #not subject
            matchword=re.findall(r'[\w]+',line)
            if matchword:
                for word in matchword:
                    if not (word[0]>='0' and word[0]<='9'):
                        trainwords[word]=1


wordsConsidered=trainwords.keys()

# print len(wordsConsidered)
wordsConsidered.sort()
print wordsConsidered
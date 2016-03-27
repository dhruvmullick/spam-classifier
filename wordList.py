import pandas
import os
import glob
import re
from stemming.porter2 import stem
import nltk
from nltk.corpus import stopwords

stopWordDict={}

def processWord(word):
    global stopWordDict
    word = word.lower() #convert to lowercase
    if not word.isalpha() :     #keep only words, not numbers, etc
        return None
    if stopWordDict.has_key(word):  #remove stop words
        return None
    word = stem(word)   #take stem
    return word


### Generate the words which are to be considered (using train)
def genWordsConsidered(hamTrainRoot,spamTrainRoot):

    global stopWordDict
    stopWordDict={k:1 for k in stopwords.words('english')}

    trainwords={}
    os.chdir(hamTrainRoot)
    L=glob.glob("*.txt")

    for file in L:
        f=open(file,'r')
        for line in f:
            w=line.split(' ',1)
            if(w[0]=='Subject:'):   #skip the subject line
                continue
            matchword=re.findall(r'[\w]+',line)
            if matchword:
                for word in matchword:
                    word = processWord(word)
                    if(word==None):
                        continue
                    trainwords[word]=1

    os.chdir(spamTrainRoot)
    L=glob.glob("*.txt")

    for file in L:
        f=open(file,'r')
        for line in f:
            w=line.split(' ',1)
            if(w[0]=='Subject:'):   #skip the subject line
                continue
            matchword=re.findall(r'[\w]+',line)
            if matchword:
                for word in matchword:
                    word = processWord(word)
                    if(word==None):
                        continue
                    trainwords[word]=1

    wordsConsidered=trainwords.keys()
    return wordsConsidered

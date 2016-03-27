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

def getCountDict(Path,Words):

    global stopWordDict
    wordDict = {w:0 for w in Words}
    stopWordDict={k:1 for k in stopwords.words('english')}

    os.chdir(Path)
    L=glob.glob("*.txt")

    for file in L:
        f=open(file,'r')
        for line in f:
            w=line.split(' ',1)
            if(w[0]=='Subject:'):   #skip the subject line
                continue
            matchword=re.findall(r'[\w]+',line)         #keep only words
            if matchword:
                for word in matchword:   #remove stopwords
                    word = processWord(word)
                    if word==None:
                        continue
                    if(wordDict.has_key(word)):
                      wordDict[word]=wordDict[word]+1

    return wordDict


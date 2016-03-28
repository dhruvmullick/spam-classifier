import os
import wordList
import countWords
import re
import glob
import csv
import nltk
from nltk.corpus import stopwords


stopWordDict={}
dictionary={}
def getfeatureCount(Path,Words):
    global dictionary
    global stopWordDict
    #wordDict = {w:0 for w in Words}
    stopWordDict={k:1 for k in stopwords.words('english')}
    d = {w:0 for w in dictionary}

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
                    word = countWords.processWord(word)
                    if word==None:
                        continue
                    if(d.has_key(word)):
                          d[word]=d[word]+1


    return d



hamTrainRoot="/Users/anishajauhari/Documents/git/spam-classifier/Dataset/training/ham"
spamTrainRoot="/Users/anishajauhari/Documents/git/spam-classifier/Dataset/training/spam"
hamCVRoot="/Users/anishajauhari/Documents/git/spam-classifier/Dataset/cv/ham"
spamCVRoot="/Users/anishajauhari/Documents/git/spam-classifier/Dataset/cv/spam"
hamTestRoot="/Users/anishajauhari/Documents/git/spam-classifier/Dataset/test/ham"
spamTestRoot="/Users/anishajauhari/Documents/git/spam-classifier/Dataset/test/spam"


with open("1000words.txt","r") as f:
    for line in f:
       c=len(line)-1
       line=line[0:c]
       dictionary[line] = line.split()

#print(dictionary)
x=len(dictionary)


Words = wordList.genWordsConsidered(hamTrainRoot,spamTrainRoot)
p=getfeatureCount(hamTrainRoot,Words)
q=getfeatureCount(spamTrainRoot,Words)

print p
print q





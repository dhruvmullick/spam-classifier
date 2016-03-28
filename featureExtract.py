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
csvtrainpath="/Users/dhruvmullick/CS/Project Work/spam-classifier/mycsvtrain.csv"
csvcvpath="/Users/dhruvmullick/CS/Project Work/spam-classifier/mycsvcv.csv"
csvtestpath="/Users/dhruvmullick/CS/Project Work/spam-classifier/mycsvtest.csv"

def extractAndWriteFeature(dir,csvpath, v):

    global dictionary, stopWordDict
    stopWordDict={k:1 for k in stopwords.words('english')}
    os.chdir(dir)
    List = glob.glob("*.txt")

    # print len(List)

    for file in List:
        d = {w:0 for w in dictionary}
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
                        d[word]=1

        L=d.values()
        L+=[v]
        # print L
        out = csv.writer(open(csvpath,"ab"), delimiter=',',quoting=csv.QUOTE_ALL)
        out.writerow(L)





hamTrainRoot="/Users/dhruvmullick/CS/Project Work/spam-classifier/Dataset/training/ham"
spamTrainRoot="/Users/dhruvmullick/CS/Project Work/spam-classifier/Dataset/training/spam"
hamCVRoot="/Users/dhruvmullick/CS/Project Work/spam-classifier/Dataset/cv/ham"
spamCVRoot="/Users/dhruvmullick/CS/Project Work/spam-classifier/Dataset/cv/spam"
hamTestRoot="/Users/dhruvmullick/CS/Project Work/spam-classifier/Dataset/test/ham"
spamTestRoot="/Users/dhruvmullick/CS/Project Work/spam-classifier/Dataset/test/spam"


with open("1000words.txt","r") as f:
    for line in f:
       c=len(line)-1
       line=line[0:c]
       dictionary[line] = 1

#feature vector for all txt files in hamtrainroot,spamtrainroot,hamcvroot,spamcvroot
extractAndWriteFeature(hamTrainRoot,csvtrainpath,0)
extractAndWriteFeature(spamTrainRoot,csvtrainpath,1)

extractAndWriteFeature(hamCVRoot,csvcvpath,0)
extractAndWriteFeature(spamCVRoot,csvcvpath,1)

extractAndWriteFeature(hamTestRoot,csvtestpath,0)
extractAndWriteFeature(spamTestRoot,csvtestpath,1)




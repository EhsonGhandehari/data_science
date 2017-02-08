import sys
import json
    

def lines(fp):
    print str(len(fp.readlines()))

def main():
    sent_file = open(sys.argv[1])
    tweet_file = open(sys.argv[2])
    scores={} # initialize an empty dictionary
    tweets=[]
    
    for line1 in sent_file:      # In this section the given pattern is parsed into dictionary
        term,score=line1.split("\t")
        score=int(score)
        scores[term]=score
    
    for line2 in tweet_file:     # The out file is saved into Json list
        try:
            tweets.append(json.loads(line2))
        except:
            pass
            
    for line3 in tweets:
        print line3[text].value()
        
if __name__ == '__main__':
    main()
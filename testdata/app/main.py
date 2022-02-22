import sys
from nltk import tokenize

input = sys.stdin.readlines()[0]
sentences = tokenize.sent_tokenize(text=input)
print(sentences)

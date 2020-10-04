# Basic

```python
"""
Tokenize a sentence and remove stopwords.

Based on
  https://stackoverflow.com/questions/17390326/getting-rid-of-stop-words-and-document-tokenization-using-nltk

See
  http://www.nltk.org/data.html

Required:
  - nltk
"""
import string

from nltk import word_tokenize
from nltk.corpus import stopwords

STOP_WORDS = stopwords.words('english') + list(string.punctuation)

message = "this is a foo bar, bar black sheep."
tokens = word_tokenize(message.lower())

print([i for i in tokens if i not in STOP_WORDS])
# => ['foo', 'bar', 'bar', 'black', 'sheep']
```

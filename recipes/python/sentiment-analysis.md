# Sentiment analysis


## Movie reviews

Based on [Tutorial](https://pythonspot.com/python-sentiment-analysis/) on Python Spot site. The original tutorial handles features incorrectly (as letters instead of words) but I corrected it.

In Natural Language Processing, you can perform Sentiment Analysis such as to classify text into categories like positive, neutral or negative.

This requires NLTK to be installed.

```sh
$ pip install nltk
```

- `classify.py`
    ```python
    """
    Classifier application.

    Sentiment Analysis demo.
    """
    from nltk.classify import NaiveBayesClassifier


    VOCAB = {
        "positive": [
            "awesome",
            "outstanding",
            "fantastic",
            "terrific",
            "good",
            "nice",
            "great",
            ":)",
        ],
        "negative": ["bad", "terrible", "useless", "hate", ":("],
        "neutral": [
            "movie",
            "the",
            "sound",
            "was",
            "is",
            "actors",
            "did",
            "know",
            "words",
            "not",
        ],
    }


    def feats(words):
        return {word: True for word in words}


    def train(vocab):
        positive_features = [feats(vocab["positive"]), "pos"]
        negative_features = [feats(vocab["negative"]), "neg"]
        neutral_features = [feats(vocab["neutral"]), "neu"]

        train_set = [positive_features, negative_features, neutral_features]

        return NaiveBayesClassifier.train(train_set)


    def classify(classifier, words):
        count_pos = 0
        count_neg = 0

        for word in words:
            result = classifier.classify(feats(word))

            if result == "pos":
                count_pos += 1
            elif result == "neg":
                count_neg += 1

        score_pos = count_pos / len(words)
        score_neg = count_neg / len(words)

        return score_pos, score_neg


    def main(sentence):
        classifier = train(VOCAB)

        sentence = sentence.lower()
        # Or use a tokenizer.
        words = sentence.split(" ")

        score_pos, score_neg = classify(classifier, words)

        print(f"Positive: {score_pos}")
        print(f"Negative: {score_neg}")


    if __name__ == "__main__":
        main("Awesome movie, I liked it")
    ```

Example use:

```sh
$ python classify.py
```
```
Positive: 1.0
Negative: 0.0
```

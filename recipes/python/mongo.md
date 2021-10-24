# Mongo

## mongoengine

Standalone script to show how to connect to MongoDB, define a model and
do a valid and invalid operation on it.

Code used from an introductory [tutorial][] on Python and Mongo:
   
[tutorial]:  https://realpython.com/introduction-to-mongodb-and-python/
    
```python
"""
Mongo demo.
"""
import datetime

from mongoengine import *


connect('mongoengine_test', host='localhost', port=27017)


class Post(Document):
    title = StringField(required=True, max_length=200)
    content = StringField(required=True)
    author = StringField(required=True, max_length=50)
    published = DateTimeField(default=datetime.datetime.now)

    @queryset_manager
    def live_posts(self, queryset):
        return queryset.filter(published=True)


def main():
    print("Insert")
    post_1 = Post(
        title='Sample Post',
        content='Some engaging content',
        author='Scott'
    )
    post_1.save()       
    print(post_1.title)
    
    print("Edit")
    post_1.title = 'A Better Post Title'
    post_1.save()      
    print(post_1.title)

    print("Validation error")
    post_2 = Post(content='Content goes here', author='Michael')
    
    try:
        post_2.save()
    except ValidationError as e:
        print(e)


if __name__ == "__main__":
    main()
```


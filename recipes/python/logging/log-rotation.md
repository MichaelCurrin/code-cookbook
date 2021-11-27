# Logger with file rotation


Based on: [Blog post](https://www.blog.pythonlibrary.org/2014/02/11/python-how-to-create-rotating-logs/).

```
second (s)
minute (m)
hour (h)
day (d)
w0-w6 (weekday, 0=Monday)
midnight
```

If `when` is "s" and interval is 3 then it rotates every 3 seconds.

If `when` is "midnight" then interval of 1 rotates once a day.


```python
import logging
import time
 
from logging.handlers import TimedRotatingFileHandler
 
 
def create_timed_rotating_log(path):
    logger = logging.getLogger("Rotating Log")
    logger.setLevel(logging.INFO)
 
    handler = TimedRotatingFileHandler(
        path,
        when="s",
        interval=5,
        backupCount=5
    )
    logger.addHandler(handler)
 
    for i in range(100):
        logger.info("This is a test! {}".format(i))
        time.sleep(2)
 
 
if __name__ == "__main__":
    log_file = "timed_test.log"
    create_timed_rotating_log(log_file)
  
```

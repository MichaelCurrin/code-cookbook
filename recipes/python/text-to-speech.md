# Speech to test

## Subprocess and say

Using `say` which is builtin on macOS. But robotic and limited.

```python
import subprocess


text_to_speak = "Hello, world!"
subprocess.run(["say", text_to_speak])
```


## Using pyttsx3

A free library for generating text to speech locally.

Allows custom rate as below but still robotic.

```sh
pip install pyttsx3
```

```python
import pyttsx3


print("init")
engine = pyttsx3.init()
print("say")
engine.say("I will speak this text")
print("run")
engine.runAndWait()


rate = engine.getProperty("rate")
print(rate)
# 200.0
engine.setProperty("rate", 150)

engine.say("I will speak this text slower")
engine.runAndWait()
```

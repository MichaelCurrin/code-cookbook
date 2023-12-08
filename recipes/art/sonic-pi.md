---
title: Sonic Pi
description: |
  "A code-based music creation and performance tool"
---

I did a blog post on [Coding and Music](https://michaelcurrin.github.io/coding-blog/2020/05/12/coding-and-music.html) covering this and similar tools.


## What is Sonic Pi?

- [Homepage](https://sonic-pi.net/)

From the repo README:

> Sonic Pi is a new kind of musical instrument. Instead of strumming strings or whacking things with sticks - you write code - live.
>
> Sonic Pi has been designed with the aim to find a harmonious balance between three core principles:
>
> - Simple enough for the 10 year old within you
> - Joyful enough for you to lose yourself through play
> - Powerful enough for your own expressions

The code typically runs in a loop. It can even run while you are editing it, making it great for living coding performances.

The syntax is based on Ruby, as you'll see from [Samples](#samples) below.

Repo:

[![sonic-pi-net - sonic-pi](https://img.shields.io/static/v1?label=sonic-pi-net&message=sonic-pi&color=142f89&logo=github)](https://github.com/sonic-pi-net/sonic-pi)
[![stars - sonic-pi](https://img.shields.io/github/stars/sonic-pi-net/sonic-pi?style=social)](https://github.com/sonic-pi-net/sonic-pi)
[![forks - sonic-pi](https://img.shields.io/github/forks/sonic-pi-net/sonic-pi?style=social)](https://github.com/sonic-pi-net/sonic-pi)


## Install

The homepage provides you with a download for Windows, macOS or Rasp Pi (it's included on that one already).

As per the docs, you can also download a `.deb` file on Rasp Pi or Linux install from that.

```sh
$ sudo apt update
$ sudo apt install ./sonic-pi_3.3.1_1_armhf.deb
```

Later you can use `sudo apt upgrade` to get the latest version.


## Samples

From the [Examples](https://sonic-pi.net/#examples) section of the homepage.

### Haunted bells

```ruby
loop do
  sample :perc_bell, rate: (rrand 0.125, 1.5)
  sleep rrand(0, 2)
end
```

### Tron bikes

Synth sounds.

```ruby
loop do
  with_synth :dsaw do
    with_fx(:slicer, phase: [0.25,0.125].choose) do
      with_fx(:reverb, room: 0.5, mix: 0.3) do
        start_note = chord([:b1, :b2, :e1, :e2, :b3, :e3].choose, :minor).choose
        final_note = chord([:b1, :b2, :e1, :e2, :b3, :e3].choose, :minor).choose

        p = play start_note, release: 8, note_slide: 4, cutoff: 30, cutoff_slide: 4, detune: rrand(0, 0.2), pan: rrand(-1, 0), pan_slide: rrand(4, 8)
        control p, note: final_note, cutoff: rrand(80, 120), pan: rrand(0, 1)
      end
    end
  end
  sleep 8
end
```

### IDM Breakbeat

Surprising complexity and appeal in this track despite how few lines there are.

```ruby
define :play_bb do |n|
  sample :drum_heavy_kick
  sample :ambi_drone, rate: [0.25, 0.5, 0.125, 1].choose, amp: 0.25 if rand < 0.125
  sample :ambi_lunar_land, rate: [0.5, 0.125, 1, -1, -0.5].choose, amp: 0.25 if rand < 0.125
  sample :loop_amen, attack: 0, release: 0.05, start: 1 - (1.0 / n), rate: [1,1,1,1,1,1,-1].choose
  sleep sample_duration(:loop_amen) / n
end
loop {play_bb([1,2,4,8,16].choose)}
```

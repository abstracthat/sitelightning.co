---
title: Media Queries Made Simple
description: Rupture takes the pain out of using media queries to style your site across various breakpoints. Here's how.
layout: post
tags:
  - stylus
  - layout
date: 05-18-15
---

[Rupture](https://github.com/jenius/rupture) takes the pain out of using media queries to style your site across various breakpoints. For writing media queries you use the less typical "block" mixin form. It's easy to do. Just append the mixin call with a `+`. Then you can pass a "block" of other styles (including other mixins) indented underneath. It makes working with media queries a breeze. Here's an example...

```stylus
h1
  rhythm()
  font-size 2.6rem
  line-height 1.2
  font-weight 800

  +above(desktop)
    font-size 4.5rem
    line-height 1.08

h2
  rhythm .25
  font-size 1.625rem
  line-height 1.2
  font-weight 600

  +above(mobile)
    font-size 2rem

  +above(desktop)
    font-size 2.25rem
```

Here I'm using variables for different widths. You can also pass `rem` or `px` values though you should really stick with `rem` to keep up with best web practices.

## Variables Make It Easy to Remember
All of the variables are defined in `settings.styl` so you can easily tweak them for your site.

```stylus
mobile = rupture.mobile-cutoff = mobile-cutoff = 28rem
tablet = tablet-cutoff = 40rem
desktop = rupture.desktop-cutoff = desktop-cutoff = 53rem
site = rupture.hd-cutoff = site-max-width = max-site-width = max-width = 55rem
```

## Mobile First (Or Not)
I think it is simplest to design for mobile first and pile media queries on top. So I almost always just use the `+above()` mixin. But there are also mixins for `+below()` and `+at()`. It's your site, no one says you can't mix and match... but it's easier if you pick one method and stick to it.

## Using the Breakpoint Scale
Another option is to use numbered indexes from this scale:
```stylus
rupture.scale = 0 (mobile) (mobile + ((tablet - mobile) / 2)) (tablet) (desktop) (site)
```

Basically it's an array of 6 values:
- 0
- mobile
- halfway between mobile and tablet
- tablet
- desktop
- the site's maximum width

The array is 0 indexed so to get the third breakpoint for example you would use `2`.

```stylus
+above(2)
  color red
```

Here the `2` index represents `(mobile + ((tablet - mobile) / 2))` which is just a long-winded way of saying halfway between mobile and tablet.

## Keep It Simple
Want to keep it simple? Style for mobile and then add in styles for each fule that needs to look different on larger screens using `+above()` where you pass `mobile`, `tablet` or `desktop` variables.

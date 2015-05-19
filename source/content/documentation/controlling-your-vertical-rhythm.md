---
title: Controlling Your Vertical Rhythm
description: Don't lose control of the vertical spacing in your project. Reign it in with these simple Stylus mixins.
layout: post
tags:
  - stylus
  - layout
date: 05-18-15
---

Designers are always keen to use grid systems which tend to keep track of your horizontal grid but leave the vertical spacing of elements up to you. That's good but it's easy to let arbitrary decisions into the loop causing your site's layouts to have an uneven vertical rhythm.

Keep your styles on the beat with [Downbeat](https://github.com/abstracthat/downbeat). By establishing baseline units, you can easily keep a consistent flow for all of your layouts using just a few handy mixins.

## No Pixels Please
It is a best web practice to not set a pixel value for the `html` element as this can disrupt user disability preferences. This library will set your html font-size to 100% so don't override it.

We also use rems so polyfill if you need to go below IE9. Rems are the most convenient and reliable way to set vertical spacing.

## Vertical Rhythm Settings
We start out by definining variables in `settings.styl` for `body-font-size` and a `body-line-height`. Use a **unitless** number for the line-height and a **rem** unit for the font-size. The product of these two variables gives us our `base` unit which we will use for consistent rhythm.

This libary is set up to give a boost to the size of the type and base unit on larger screens. This is a common and useful design pattern. You have all of that screen real estate, may as well make it easier to read and a bit more vertically relaxed.

## Bottom Margin and the Rhythm Mixin
It's easy to get confused in your layouts with what is pushing what element around. One way to make it simpler is to try your best to avoid using `margin-top`. When you only apply margin on the bottom you know where the push is happening and you avoid the common "double-margins" issue.

The `rhythm()` mixin adds `margin-bottom` (and if you want, `margin-top`) in increments of the base unit. You can use floated numbers like .5, etc. It also includes a media query for using the larger base unit on large screens. Basically it's a shortcut for writing...

```stylus
.example
  margin-bottom base // 1.5rem
  +above(site)
    margin-bottom large-base // 1.605rem (depends on your settings)
```

Instead you could say the same thing with...

```stylus
.example
  rhythm()
```

Pass no arguments to use the default of 1 base unit to the bottom. Pass one argument to set the margin-bottom only. Pass two arguments to set the top (first) and bottom (second) margins. Note that it is top first when passing two args. This follows the CSS order for margin.

Also aliased as `margin-rhythm()` and `rhythm-margin()`

```stylus
header
  rhythm .5
```

This example will give you a .75rem margin-bottom and a .8025rem margin-bottom for desktop.

I like to stick with increments of .5 or sometimes .25 to keep my rhythm feeling consistent.

## Padding Rhythm
Same as Rhythm mixin but for padding. Note that it defers in that it adds padding to top and bottom since that's usually what you want to do with vertical padding. Adds `padding-top` and `padding-bottom` in increments of the baseline-grid. You can use floated numbers like .5. Includes a media query for using the larger baseline on large screens.

Pass no args for .5 units on top and bottom padding. Pass one arg to set top and bottom padding to the same number of base units. Pass two args to set top (first) and bottom (second) padding.

```stylus
header
  padding-rhythm 2 1
```

## Padding & Margin: Vertical or Sides
These mixins are more for convenience but they do help you remember to be consistent with your spacing. Also it's nice not to have to write `padding-top`, `padding-bottom` when you don't want to mess up your left/right values by using just `padding`. There's no extra media query included in these--it's just plain padding and margin.

```stylus
.content
  padding-sides()

.element
  padding-vertical 3rem

.spaced
  margin-sides()
  margin-vertical()
```

Another handy shortcut is `pad()`. This gives you the left/right padding set to the gutter and the `padding-rhythm()` mixin called to set the top/bottom padding including a media query for the large-base.

Here's the source for these mixins so you can see what's going on.

```stylus
padding-sides(left = gutter, right = left)
  padding-left left
  padding-right right

// aliases
sides-padding = side-padding = sides = padding-sides

padding-vertical(top = (base / 2), bottom = top)
  padding-top top
  padding-bottom bottom

// pad sides by gutter, top/bottom by base and mq for large-base
pad()
  padding-sides()
  padding-rhythm()

margin-sides(left = gutter, right = left)
  margin-left left
  margin-right right

margin-vertical(top = (base / 2), bottom = top)
  margin-top top
  margin-bottom bottom
```

The library also includes mixins for carefully adjusting and debugging your vertical baseline, but this is for advanced use (and/or vertical rhythm snobbery) so I'll just refer you to the [readme](https://github.com/abstracthat/downbeat) if you want more on that.

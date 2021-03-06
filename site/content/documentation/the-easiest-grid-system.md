---
title: Introducing The Easiest Grid System
description: Site Lightning uses Happy Grid --- the easiest grid you've ever used. Guaranteed designer happiness.
layout: post
tags:
  - grid
  - layout
  - Stylus
date: 05-18-15
---

A grid system should be simple and make your inner designer happy. Create rows, make columns, offset them, and change their source ordering. Here's how the [Happy Grid](https://github.com/abstracthat/happy-grid) works...

## Only Two Simple Grid Settings
In `settings.styl` you'll find just two variables for the grid. The `gutter` is used to set `padding` on rows and `margin-right` on columns. The `max-site-width` gives you a default for the `center()` mixin width. Typically you would set it to the `max-width` of your site.

```stylus
gutter = 3%
max-site-width = 60rem
```

## Clearfix Your Rows
Any parent containers need to clear their floated children elements. This simple mixin is based on [Nicolas Gallagher's micro clearfix](http://nicolasgallagher.com/micro-clearfix-hack). It's aliased as `cf()` and the more semanitcally named, `group()` as well.

Any element that uses the `center()` mixin has a clearfix already applied to it. You can also use `.container` to apply it with a class.

```stylus
.parent
  group()
```

## The Center Mixin
This one is used to horizontally center a container element with optional padding to it (and automatically apply `clearfix()`). Pass any unit for the `max-width` and padding. It uses the default `max-site-width` from `settings.styl` if called without any arguments. It's aliased as `row()` as well.

This one is really handy to use with the various width variables from `settings.styl`. For instance it is already applied to `.main .content` to give a nice readable measure for your prose, based on the `tablet` variable width.

```stylus
.main .content
  center tablet
```

## Easy, Infinitely Nestable Columns
Here's the star of the show. The `column()` mixin creates a column that is a fraction of the size of it's containing element with a margin (a.k.a. gutter). You don't need to pass any additional ratios as the grid system will make use of CSS `calc()`.

Note that the ratio must always be a **fraction wrapped in quotes**... i.e. `column('1/2')`, NOT `column(1/2)` and NOT `column(.5)`.

**Margin**: The margin on the right side of the element used to create a gutter. Typically this is left alone and the global gutter setting will be used, but you can override it here if you want certain elements to have a particularly large or small gutter (pass 0 for no gutter at all).

**Cycle**: The grid works by assigning a `margin-right` to all elements except the last in the row. It does this by using the denominator of the fraction you used. To override this default pass a `cycle` parameter. e.g. `column('2/4', cycle: 2)`.

```stylus
.element
  column '1/3'

.gutter-override
  column '1/3' 2%

.cycle-override
  column('2/6', cycle: 3)

.gutter-and-cycle-override
  column('2/6', margin: 2em, cycle: 3)
```

## Offset
Margin to the left or right of an element depending on if the fraction passed is positive or negative.

```stylus
.two-elements
  column '1/3'

  &:first-child
    offset '1/3'
```

## Move
Source ordering. Shift elements left or right by passing a positive or negative fraction. Aliased as `shift()` also.

```stylus
.reversed-order
  column '1/2'

  &:first-child
    move '1/2'

  &:last-child
    move '-1/2'
```

And that's all there is to it.

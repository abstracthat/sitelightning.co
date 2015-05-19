---
title: How To Use Gulp As A Static Site Generator
description: There are a million static site generators out there but you don't need them. Just use Gulp with this handy data mapping script.
layout: post
tags:
  - Gulp
  - CLI
  - map
date: 5-5-15
---

Many have heard of Jekyll. I was previously tooling this out for Hexo. Harp is nice too but not free. Front-end developers are spoiled. There are a million static site generators out there -- but you don't need them. Here's why...

I wrote a [fairly simple Node script](https://github.com/abstracthat/gulp-lightning/blob/master/src/map.coffee) that Gulp can use to build all of your site's pages and their meta-data content into a structured data object.

After you have run the default `gulp` task take a look at `site.json` in the root of your project.

The top-most structure looks like this (in Coffeescript because I'm typing this out for you and who likes to actually "write" JSON?)...

```coffee
site:
  name: ''
  url: ''
  title: ''
  description: ''
pages:
  url:
  title:
  description:
collections:
  '/blog/example-post/':
    url: ''
    title: ''
    description: ''
    pages: [
      { url: ''
        title: ''
        description: ''
        tags: []
        date: ''
        datetime: ''
        intro: ''
        image: ''
      }
    ]
footer: []
header: []
scripts: []
styles: []
google_fonts: []
social: []
mailchimp: {}
disqus: ''
```

This is what enables us to loop through collections for index pages or find the url and title for the "next" or "previous" page in a collection. 

All of this data is available in your templates as variables. For instance `h1!= site.name` will render the site's name. Easy peasy.

Collections are keyed by the url. So you can use `collections['/blog/'].pages` to return an array of page objects in the `blog` folder. Check out `collection.jade` for a working example.

If you need a globally accessible variable you can add it to `site.yml` and rerun the `gulp` command.

---
title: How To Make the Home Page Your Collection Index
description: Sometimes you just want to make a simple site with the home page listing out your blog index or maybe your most recent post. It's easy.
layout: post
tags:
  - Jade
date: 05-31-15
---

Site Lightning is designed to allow you to have multiple collections of pages. But maybe you just have one. If you are making a simple site and just want to list your collection index on the home page it's easy to do. Here's how...

## Making a Blog Home Page
Let's say you want to make a basic blog. You can put all of your posts in `content/blog` inside the site directory. This makes it so that `welcome-to-my-blog.md` gets the url `http://mysite.com/blog/welcome-to-my-blog/`. That works great for a permalink but there is no point in having your collection index at `/blog/` if you just want it on the home page.

In this case, don't bother making an `index.jade` that extends the collection template inside the `blog` folder like you normally would. Instead make your own loop on the home page `content/index.jade`.

The array of pages is keyed by the collections **absolute url**. So in our case the "blog" pages array can be accessed as `collections['/blog/].pages`. The array is a collection of objects. So the Jade template to list them all out would look like this...

```jade
extends ../templates/page

block content
  section.articles
    each page in collections['/blog/'].pages
      article.summary
        h2: a(href= page.url)!= page.title
        if page.image
          a(href= page.url)
            img(src= page.image, alt!= page.title)
        p!= page.intro
        a(href= page.url) Read more &raquo;
```

This is basically a rip out of the `collection.jade` template. You can change the markup as you see fit.

### Redirecting `/blog/` to The Home Page
If you set it up this way you should consider adding a redirect. If you are using the [Nginx server setup script](https://github.com/abstracthat/server-setup), then I have built in a handy hook for a file you can add to your `site/root` folder called `.redirects.conf` (note the leading dot on the filename).

You can put Nginx rewrite rules in here. Here's how you would redirect `/blog/` to go to your homepage instead. Just paste this into `/site/root/.redirects.conf`...

```
rewrite ^/blog/*$ / permanent;
```

This is a regex that says the url starts with `/blog` and ends with `/` (or not). This will redirect anyone hitting `/blog/` or `/blog`. But it won't redirect `/blog/my-post/`. Putting `permanent` at the end will return a 301 response from the server which is the appropriate response in this case.

## Put the Most Recent Post on the Home Page
Maybe you want to render the most recent post in full onto the homepage. You can access the entire post content with the page's `post` object key.

```jade
block content
  - var firstPost = collections['/thoughts/'].pages[0]
  h1!= firstPost.title
  if date
    time(datetime= datetime) Written on #{date}
  != firstPost.post
```

You should probably also include a link to the permanent home of that post (`firstPost.url`) incase someone wants to link to it. It also causes a bit of duplicate content on your site so you might want to consider adding other content to the home page as well.

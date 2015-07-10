---
title: Front-Matter Meta Data Cheat Sheet
description: Based on best SEO, social, and web practices, get all of the page meta data you need in the right spot.
layout: post
tags:
  - SEO
  - Open Graph
  - Front-matter
  - YAML
date: 5-7-15
---

We'd all just like to get down to writing the content but in reality we need some meta data for every page in order to make our content more useful to people finding it in search engines or social sites. So we have to learn to love SEO and [Open Graph](http://ogp.me/) tags.

Site Lightning is set up to parse the front-matter out of all of your files. If you've never heard of "front-matter" before it's basically just a meta-data object to pass in values to our templates. It's written in [YAML](http://yaml.org/) syntax.

## Typical Usage
Typically you would use the following. Note that you don't need `layout` if it's a Jade file.

```yaml
title: 50-55 characters
description: 150-160 characters
layout: post
tags:
  - fun
date: 1-2-15
og_title: 70 characters
og_description: 200 characters
og_image: 1200x627.jpg
```

## Minimal Meta for a Jade Page
If you don't at least include a title and description then Jade will through an error during compile. This is intentional to force you into using good SEO standards.

```yaml
title: Title
description: Meta description
```

## Minimal Meta for a Markdown Page
For markdown files, at the minimum you should use a `title`, `description` and `layout`. Pages in collections are sorted by date (newest first) so you might also want `date`. It's not required though.

```yaml
title: Title
description: Meta description
layout: post
date: 1-2-15 # optional
```

## All the Meta
Here's a cheat sheet of them all.

### title
Title of The Page Here (50-55 characters).

### meta_title
An Alternate Title to Use for the page's `<title>` tag.

### og_title
The Open Graph Title, else we use the Title (60-90 characters).

### twitter_title
Limit to 70 characters, else og-title, else title.

### description
The meta description often found on search engine result pages (150-160 
characters).

### og_description
The Open Graph description, else we use the meta description (200 characters).

### twitter_description
Limit to 200 characters, else, og-description, else description.

### layout
If it's markdown this is the Jade template to render with.

### tags
\- not currently used
\- but could be useful
\- especially for search

### date
In this format, month-day-2digityear... 1-2-15.

### image
The absolute path for a feautred image for the page. Else we use the first image from the page. Can be used when designing a collection index for instance.

### intro
The map function will scrape the first paragraph or you can override it with your own if you want. Can be used in designing a post list index. You should use`!=` since it includes HTML.

### og_image
The open graph image should ideally be 1.91/1 ratio 1200px x 627px.

### twitter_type
Twitter cards can be summary, photo, video, product, app, gallery, and “large 
version” summary. If blank we assume summary

### no_comments
If you have Disqus set up in your `site.yml` then posts will have the Disqus comments div inserted automatically. If you don't want the comments to show for a particular post then just include `no_comments: true`.

## Need More Help?
[This article](https://blog.kissmetrics.com/open-graph-meta-tags/) was very helpful for me when I set up the open graph template.

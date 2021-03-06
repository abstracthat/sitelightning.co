---
title: Learn How the Page Template is Structured
description: The page template is really minimal. Here's the main parts you need to know.
layout: post
tags:
  - Jade
  - layout
date: 05-14-15
---

The `page.jade` template extends `base.jade` which is really just a wrapper for the stuff that goes in the head tag. The page template is kept pretty minimal on purpose so that it is useful for other templates to extend from. Here's the main sections...

```jade
.page
  .site-header

  article.main(role='main')
    header.page-header
    section.content

  .promotion
  .site-footer
```

## Page Wrapper
The page is wrapped in `.page`. This is used to contain your site. Without it your site would be 100% of the browser width all the time. The styles are in `page.styl`.

```stylus
.page
  center site
```

The only style on `.page` presently centers the page in the browser using margin auto on the sides. This mixin also sets the max-width defined by the `site` variable which is in `settings.styl`. Want your site max-width bigger or smaller? Change that variable in settings.

## Site Header
Next we have the site header and menu. This is a component with a fair number of styles to get the layout working. The styles for this are in `site-header.styl`. The Jade component is in `site-header.jade`.

```jade
header.site-header
  a.logo(href='/')!= site.name

  .toggle#menuToggle: .icon

  .menu
    ul
      li(class= isCurrentPage)
        a(href= page.url)!= page.title
```

The markup is very simple. It's just `a.logo` for the site name, a mobile menu toggle icon, and an unordered list for the menu.

The site header is in a block called `header` so you can always remove it from a content page by just passing an empty block to `block header`.

The site header relies on quite a few style rules (for the mobile menu, toggle, etc. There are variables at the top of `site-header.styl` to help you change the broad strokes.

## Main Article
Then we have the `.main` content area. The only styles applied here are to give the content some padding on the sides (the `gutter` as defined in the settings) once you go below the max site width. That way your content is not smooshed against the browser window on mobile or smaller desktop sizes.

```stylus
.main
  padding-sides()
  padding-rhythm 0 1

  +above(site + gutter)
    padding-sides 0
```

We open a block called `main` right after this that contains the next two blocks. That way you can overwrite the page header and `section.content` divs if you want. That will give you a full-width blank page with just the site's header, promotion, and footer.

### Page Header
Then we have the page header which is just a `h1` wrapped in a `header.page-header`. The `h1` is set to render your page's `title` meta-data attribute. This is in a block called `page-header` so you can append to it (like we do in the `post` template) or replace it with more content (like we do on the home page).

```stylus
.page-header
  padding-rhythm 1.5
  text-align center

  h1
    margin-bottom 0
```

The style on this is just some vertical padding on the header and to remove the bottom margin on the h1 (since we have the padding in the header already). It's also currently `text-align: center` but that's easy enough to remove if you don't want the text centered.

### Content Section
After the page header, but still inside the `article.main` is the place for your main content to go. We start a block called `content` right after this element.

This is usually a good block to use when you extend this template for a Jade page in your `site/content` folder. This is also where markdown files get their contents rendered. So it's safe to set `layout: page` in the front-matter of a markdown only content page.

```stylus
.content
  center tablet
```

The style here is to contain the contents (which are assumed to be prose) to a readable horizontal measure. In this case we again use the `center()` mixin this time with the `tablet` variable which is defined in settings to be 40rem.

If you are making a content page with Jade that doesn't have a block of prose then use the `main` block which will overwrite the `page-header` and `content` blocks.

## Page Footer
If you have a website, it's a good idea to grow an email list. That's why the `page-footer` block has a `.promotion` section waiting for you.

There is a component for an email optin form that hooks up with Mailchimp (defined in `site.yml`). Create some value and a reason to optin. This block has basic styles defined in `promotion.styl`. It's also using some of the site-wide form styles in `forms.styl`.

```jade
+signup('xxlistIDxx', 'Sign Up Now')
  :markdown
    ## Header
    Enticing copy.
```

If you have a content page or template that is extending page and you don't want the promotion to show then just pass an empty block to `promotion`.

There is some validation going on for this in `submit-form.coffee` so make sure you include an `h2` tag above your form as we are currently pushing error messages there. I realize this is brittle and I'd like to eventually replace it with some form validation / error message library like [parsely.js](http://parsleyjs.org/). Pull request, anyone?

## Site Footer
And last is the site footer. The styles are basic and defined in `site-footer.styl`. The menu items are defined in `site.yml`.

## Examples
I hope you see the modularity of the page layout. Check the `collection` and `post` template files for examples of extending the `page` template.

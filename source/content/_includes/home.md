## Quick Start for Developers
You need [Node](http://nodejs.org), [Gulp](http://gulpjs.com/) and [Bower](http://bower.io/): `npm i -g gulp bower`. You'll also probably want syntax support in your text editor for Jade, Stylus, Coffeescript, and YAML.

Getting started is easy... just download the boilerplate, install the dependencies and run Gulp.

```bash
curl -L -o site-lightning-master.zip https://github.com/abstracthat/site-lightning/archive/master.zip
unzip site-lightning-master.zip
cd site-lightning-master
npm install
gulp
```

That will get everything installed and start the development server so you can get to work. Your first install will probably take a few minutes due to graphics library testing.

The default site is pretty bare since there is no content other than an almost empty `index.jade` file. If you want to see an example with more content feel free to clone the repo for the site you are reading now.

```bash
git clone https://github.com/abstracthat/sitelightning.co.git
cd sitelightning.co
npm install
gulp
```

Now that you are up and running here's what you need to know.

## Set Up Your Site
In the root of the project you will find `site.yml`. Fill in your site details (name, url, etc). Setup your header and footer menus too.

The social account settings will be used to set up open-graph tags (used by Facebook, Twitter, etc) for your site.

We also define the css and js files here, as well as settings for Mailchimp, Google Fonts, Typekit, and various analytics / testing accounts.

## Source Folder Structure Overview
All of your work happens in the `source` folder. There are folders for `content`, `images`, `scripts`, `styles`, `fonts`, and `templates`.

The files you create in `source/content` turn into your pages and any folders in there turn into your collections. Collections should include an `index.jade` file that extends the collection template and gives you a nice list of your pages (most recent first if you have set a date on each).

Inside `source/content` is one special folder called `_includes`. This is for content that you are including from a jade file. For instance, really long blocks of markdown (like you are reading now), or copy that you are trying to keep seperate from your template, like `promotion.jade`.

You can write each page as Jade or markdown with YAML front-matter for the page's meta-data at the top. Markdown files should use the `.md` extension only and must include a `layout` in the front-matter so we know which Jade template to wrap the content in. There are default templates for `page`, `post`, and a `collection` index.

You can and should use `:markdown` for blocks of prose in your jade files. See an example in the source for this page you are reading: `index.jade`.

Your Jade templates go in `source/templates`. All Jade files should extend at least the `base` template.

The rest of the folders in `source` (`images`, `scripts`, `styles`, `fonts`) are pretty self-explanatory and will be covered in detail in the main [documentation](/documentation/).

## Keeping Your Styles Organized
All of your styles go in `source/styles`. Presently there are not too many styles but quite a bit of scaffolded structure. It's a solid baseline foundation for you to build on.

Base styles that affect the entire site go in `base`. If something is modular and used in a similar way on multiple pages you can put it in `components` (like a button or email signup styles).

If it's layout of basic styles for a template it should go in `templates` and otherwise it's probably specific to a particular page and should go in `pages`.

There is also a `settings.styl` file for site wide variables and a `main.styl` file to collect all the styles.

### Stylus Mixins
[Stylus Lightning](https://github.com/abstracthat/stylus-lightning) mixins are included. You also have the very nice stylus library, [Axis](http://axis.netlify.com/). It includeds many useful mixins so have a look at their [docs](http://axis.netlify.com/).

#### [Media Queries](/documentation/media-queries-made-simple/)
Media queries are handled by [Rupture](http://jenius.github.io/rupture/). I've tweaked the breakpoint slices and variable names which you can see in `settings.styl`.

#### [Grid System](/documentation/the-easiest-grid-system/)
For the grid we use [Happy Grid](https://github.com/abstracthat/happy-grid). This is a library I maintain that is forked from Cory Simmon's Lost grid. It's extremely lean and clean and supports nested grids in IE9 (+ IE8 if you use a calc polyfill). The default gutter is set at 3%. That's in the settings file too.

#### [Vertical Rhythm](/documentation/controlling-your-vertical-rhythm/)
We use my own library [Downbeat](https://github.com/abstracthat/downbeat) to maintain consistent baseline spacing. Check the readme there for the docs.

## Client-Side Coffeescript
Your own client-side scripts go in `source/scripts`. If you have a lot of code and want to make it modular then do it the Node way and `require` your modules. The Gulp file calls [Browserify](http://browserify.org/) so, it just works. If this is new to you, here's a tutorial on the idea, [Understanding Modules](http://www.sitepoint.com/understanding-module-exports-exports-node-js/).

### Third Party Libraries
Feel free to add modules from NPM and require them in `main.coffee` if they are appropriate for client-side use. Browserify will find them and add add them during the build.

#### Bower Integration
To add a library that is not in NPM you can use [Bower](http://bower.io/). Remember to save it... `bower install --save fastclick`. You'll have to restart `gulp` as we don't currently watch the `bower_components` folder.

To use a library from Bower, add the main CSS/JS file(s) to `site.yml`. During development it will be multiple files served from a `lib` folder but the final production deploy will concat and minify all that together with your own scripts / styles in the order you have it in `site.yml`.

## Read the Docs
The full [documentation is a work in progress](/documentation/). Here are the docs for the libraries and languages used.

0. [Happy Grid](https://github.com/abstracthat/happy-grid)
0. [Rupture](http://jenius.github.io/rupture/)
0. [Downbeat](https://github.com/abstracthat/downbeat)
0. [Axis](http://axis.netlify.com/)
0. [Jade](http://jade-lang.com/reference)
0. [Stylus](http://learnboost.github.io/stylus/)
0. [Coffeescript](http://coffeescript.org/)
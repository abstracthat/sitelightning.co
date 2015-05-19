---
title: Take Control of Your Project With Gulp
description: Gulp makes running tasks for your static site project easy. Get and overview of what's available to you.
layout: post
tags:
  - Gulp
  - CLI
date: 5-6-15
---

The gulpfile in your project is just a wrapper for [Gulp Lightning](https://github.com/abstracthat/gulp-lightning). This makes it easy to keep your project up to date with the latest Gulp file. You can see the source file [here](https://github.com/abstracthat/gulp-lightning/blob/master/src/index.coffee). Basically you just use `gulp` to develop and `gulp deploy` to deploy production ready files to your server.

To view the production ready files before deploying you can use `gulp preview`. Another useful one is `gulp clean` if you need to banish some old files while developing.

## Restarting Gulp
There are a few things that we don't have Gulp watching for changes on. These will require you to stop Gulp and run it again with `gulp`.

0. If you make a change to `site.yml`
0. If you add new markdown or Jade files in content and want them to show up in your index list
0. If you change the front-matter in a file and want it to show up in your development environment

These are due to the fact that the [map command](https://github.com/abstracthat/gulp-lightning/blob/master/src/map.coffee) only gets run once. In the future we can watch for changes but I haven't gotten to it yet. Anyone want to make a Pull Request?

## All the Tasks
Here is a list of all of the tasks, though you not typically run them in isolation.

- map
- markdown
- jade
- stylus
- coffee
- js
- installBower
- bower
- compile
- optimize
- cacheresources
- cacheref
- cachebust
- images
- move
- clear
- clean
- browser
- previewBrowser
- rsync
- develop
- default
- build
- preview
- deploy

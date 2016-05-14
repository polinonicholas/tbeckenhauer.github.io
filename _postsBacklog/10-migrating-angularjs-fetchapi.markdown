---
layout: post
title:  "Migrating From Angular JS to Vanilla JS"
date:   2018-04-29 00:00:00
categories: jekyll update
---

Many profitable applications are currently built on AngularJS right now, and now that the Google Team has decided they will no longer support AngularJS as of 2021.  It's time to commit to a long term strategy.  What are our options?

In the past the web was not as mature as it is now.  The platform provides a lot of functionality that previously was provided by various frameworks or libraries.  So I would encourage you to first adopt the new technologies made available by the platform, and then if there are still gaps in functionality that you need, choose the library that is going to serve you the best.

## Directives to Web Components

Web components are up and coming, and to me they seem like a good replacement
for Angular.js directives.  Let's go over some of the features provided by AngularJS Directives and

| Technology   | AngularJS |  WebComponents |
|--------------|-----------|----------------|
| Templating   | [Yes](https://docs.angularjs.org/guide/templates)               | [Yes](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/template) |
| Transclusion | [Yes](https://docs.angularjs.org/api/ng/directive/ngTransclude) | [Yes](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/slot) |
| Scoped CSS   | No[^1]                                                          | [Yes](https://developers.google.com/web/fundamentals/web-components/shadowdom) |
| Data Binding | [Yes](https://docs.angularjs.org/guide/databinding)             | No[^2] |
| Filters      | [Yes](https://docs.angularjs.org/guide/databinding)             | No     |

## $http to Fetch Api

One of the cool things about $http was that it was promise based, well so is the
Fetch Api.  This seems like a good replacement for this part of an Angular.js
App

## $injector to es6 modules
I am also interested in seeing how this would work out.

## ui-router to ??????
I don't know of any router built into the standards, so we may have to build or
borrow one. I don't expect this to be too hard.

## Other Resources

 1. [Web Components Specifications](https://github.com/w3c/webcomponents/issues)
 2. [Databinding with Web Components](https://docs.google.com/document/d/1kpuR512G1b0D8egl9245OHaG0cFh0ST0ekhD_g8sxtI)
 3. [PolymerJS]()

## Footnotes

[^1]: [Target your styles](https://www.reddit.com/r/angularjs/comments/4ek4j2/ask_reddit_css_scoping_with_angular_15_components/d20umtu/) by scoping them with .component-name { /* component styles */ }


[^2]: It looks like this isn't available natively from the platform, but [PolymerJS has support for data binding](https://www.polymer-project.org/2.0/docs/devguide/data-system).






 <!-- 1. We can migrate to a new framework.  I would advise against it.
 2. We can replace what AngularJS provides with various libraries, this is better, but not ideal.
 3. We can adopt the Web Standards that are available now,

I would recommend against trying to migrate to a new framework.  This is a philosophical discussion we can have at

## Upgrade/Migrate to Framework XYZ
I don't recommend this option.  I would recommend staying away from frameworks,  I would instead suggest migrating to VanillaJS technologies.

## Migrating from AngularJS to VanillaJs

One of the things I am interested in right now is exploring current and upcoming
web standards that can be used to migrate away from AngularJS. -->

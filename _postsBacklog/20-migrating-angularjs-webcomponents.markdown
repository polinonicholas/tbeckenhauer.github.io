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
[ Custom Attributes] | Yes                                                       | No     |

Shadow Dom
https://dom.spec.whatwg.org/#shadow-trees

## Other Resources

 1. [Web Components Specifications](https://github.com/w3c/webcomponents/issues)
 2. [Databinding with Web Components](https://docs.google.com/document/d/1kpuR512G1b0D8egl9245OHaG0cFh0ST0ekhD_g8sxtI)
 3. [PolymerJS]()

## Footnotes

[^1]: [Target your styles](https://www.reddit.com/r/angularjs/comments/4ek4j2/ask_reddit_css_scoping_with_angular_15_components/d20umtu/) by scoping them with .component-name { /* component styles */ }


[^2]: It looks like this isn't available natively from the platform, but [PolymerJS has support for data binding](https://www.polymer-project.org/2.0/docs/devguide/data-system).

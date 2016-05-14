---
layout: post
title:  "Naming: No Magic Numbers"
tags: [Programing, CodingStyle, Always]
permalink: /no-magic-numbers/
---

A common problem that I see is the use of magic variables.  Many developers already know what these are, but all do not. The concept is pretty simple and just about everyone agrees on it(I think). I've never heard any dissent.  

The idea is that you shouldn't inline strings or numbers.  Now with strings, it may depend on the string, but we aren't going to worry about that here.  Let's take a look at a good example I have found in the wild(in the Vue 3 source code), and what it would look like without.

[Vue JS 3 not using magic numbers.]( https://github.com/tbeckenhauer/vue-next/blob/9036f88d8304a3455265f1ecd86ec8f4a5ea4715/packages/runtime-core/src/hydration.ts#L28 )

See the example inline below.  The point isn't for the enum declaration. The point is to make the isComment function declaration more readable. When reading the main logic of `isComment` you can read `node.nodeType === DOMNodeTypes.COMMENT`; as opposed to the alternative if the magic number had been inlined, `node.nodeType === 8`

{% highlight typescript %}
const enum DOMNodeTypes {
    ELEMENT = 1,
    TEXT = 3,
    COMMENT = 8
}

let hasMismatch = false

const isSVGContainer = (container: Element) =>
    /svg/.test(container.namespaceURI!) && container.tagName !== 'foreignObject'

const isComment = (node: Node): node is Comment =>
    node.nodeType === DOMNodeTypes.COMMENT
{% endhighlight %}

Let's take a look at what the function would have looked like without. Now because of the short function it is still possible to infer what the 8 means, but it is certainly less obvious what's going on.

{% highlight typescript %}
const isComment = (node: Node): node is Comment =>
    node.nodeType === 8
{% endhighlight %}

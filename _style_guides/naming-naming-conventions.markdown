---
layout: post
title:  "Naming: Naming Conventions"
tags: [Programing, CodingStyle, NamingConventions, ItDepends]
permalink: /naming-conventions/
---

They say there are two hard problems in computer science: Caching, Naming things, and off by one errors.

No? Ok.

Let's talk about naming things. I don't think it has to be that hard.  I have a few guidelines to keep in mind that go beyond the usual suspects. Let's run through them real quick.

1. Most important words first
2. Consider the scoping

<!--
3. maybe suffix your variables with the type
4. Don't camel/kebab/snake case compound words
-->

## Most important words first.
This is a specific use case of my more general principle "most important thing first".

So frequently I will see developers write variables as they may speak them, and yes I do think that is good sometimes, the problem though is English grammar isn't the best.  I like Spanish grammar better.  In case you don't know in Spanish you generally place the noun before the adjective, and verbs before adverbs.  Everyone agrees this makes sense.  The reason it makes sense is because it puts the most important words first.

I would say consider this when choosing variable names.  One of the reasons why I like this is because it can make your code more scannable.  Let's take a look at an example.  Many moons ago, working on an application, we needed some colors.  Thus _colors.scss was born.


{% highlight css %}
:root {
  --gray-white-color : #FFFFFF
  --gray-medium-color: #AAAAAA
  --gray-black-color : #000000
  --blue-light-color : #48CAE4
  --blue-medium-color: #00B4D8
  --blue-dark-color  : #023E8A
}
{% endhighlight %}

Lets take a look at an alternative, more common, naming scheme.

{% highlight css %}
:root {
  --white-color: #FFFFFF
  --medium-gray-color: #AAAAAA
  --black-gray-color: #000000
  --light-blue-color: #48CAE4
  --medium-blue-color: #00B4D8
  --dark-blue-color: #023E8A
}
{% endhighlight %}

Now maybe you don't agree with suffixing the type just yet.  We will talk about that later, but it doesn't help.

{% highlight css %}
:root {
  --white: #FFFFFF
  --medium-gray: #AAAAAA
  --black-gray: #000000
  --light-blue: #48CAE4
  --medium-blue: #00B4D8
  --dark-blue: #023E8A
}
{% endhighlight %}

One of these is clearly easier on the eyes.  It should be clear that when you put the most important word first, the characters automatically align themselves, making it easier for your eyes to scan a block of text.  Next time try pushing your nouns to the front of your variables, and your verbs to the front of your functions.  Then suffix with your adjectives and your adverbs.

<!--
First of all, pretend your speaking Spanish. In Spanish

Most important word first.

Consider how things might get sorted in a file explorer.

All of these are basically the same idea.

Choose the most imporant words first, and what you would like to be ordered together first.
Use spanish as a guide nounAdjative rather than adjativeNoun
-->

## Consider the scoping.

Here is a quick summary.

|          | Wide Scope | Narrow Scope |
| -------- | ---------- | ------------ |
| Function | Short Name | Long Name    |
| Variable | Long Name  | Short Name   |

<br />

<!--
Got it? If your function has global scope, it probably can use a very succinct name.  If you function has very narrow scope, it's probably doing something super specific, and could use some self documenting name.  If you variable is global
-->

I can't quite explain why this works, but I have two things to back up my claim. First, an appeal to an authority.  This is a recommendation from Bob Martin.  You'll have to watch his videos to see it though, a quick search doesn't turn anything up.  Second, a few examples.


### Function - Wide scope
Meaning how widely used is it? Consider Lodash and jQuery or maybe some other constructors.

Good Examples:
- _.map()
- $("#appContainer")
- new Vue()

Increasingly Bad Examples:
- Something that is pushing the limit of "short":
    - ReactDOM.render(/**/)
- How come the jQuery constructor feels much more natural than the native version?
    - document.querySelectorAll("#appContainer")

### Function - Narrow scope 
functions that have a super specific purpose should speak for themselves.
- [cudaGetTextureAlignmentOffset](https://www.cs.cmu.edu/afs/cs/academic/class/15668-s11/www/cuda-doc/html/group__CUDART__TEXTURE_g6076c6bf0b1f2e52a36cd51af9d78fb4.html)

I bet you have a decent idea what this function is for.  Now it's especially good for this example here because it mentions the library name, but that may not be best in practice.  I don't want cuda eating up 4 characters everytime I call it.  I know we are using cuda! Stop with the branding Nvidia! Keep in mind this isn't the narrowest scoped function possible, just one of the more narrow ones that can be readily shared.  Let's say I did get my way though and could trim off the cude from the function name what would we have?
{% highlight c++ %}
    someObject.getTextureAlignmentOffset(offset, texref)
{% endhighlight %}
Beautiful.

## Variable - Narrow scope
Let's not be tempted to stick with the previous example.  The problem is that function has a wide audience and so do the variables. So shortening them is probably not a good idea.  Let's make something up.  Let's convert drivers licenses into applications.
{% highlight javascript %}
const applications = driversLicenses.map((dL, i, arr) => {
    return { 
        id: i, 
        userName: dL.name, phone:dL.phoneNumber 
    };
});
{% endhighlight %}
- I bet you didn't need me to explain dL stood for Drivers License. It might have even annoyed you if I had spelled it out.  The further away some data gets from it origin the more it will need to be explained. But with one or two lines, one or two characters is probably just fine.
    
### Variable - Wide scope
Think a public database, or maybe color names.
- Css Color Names is tricky because there are good and bad strategies for managing your applications colors.  But if you are trying to create names for all 16 million colors your going to need some long names.  Good luck keeping all of them meaningful.
- Public Databases: I can say it is 72°F but that doesn't mean much unless I also specify where and when. Which could be considered part of the name.  I know I am stretching this here, but we haven't gone too far yet.  If you wanted to make a public database of temperatures your api might be
- tempsDB.atLocation(48.85827172505176, 2.294531782785587).atTime(946645199)
- tempsDB.atLocation("Eiffel tower").atTime("Midnight")
- We are definitely stretching the definition of name to encompass that, but I don't think it's a stretch to say that we required a very long identifier to specify a piece of data we were looking for that had a wide scope.
- it's also easy to imagine a config file that would be consumed by an application that would require long names to specify different pieces of data the application would consume.

### Reflection

Did you make it this far?  I will agree that some of the later examples got rougher, so I do not want to push this as gospel.  Just something to consider while you are writing your code.  Something that I reflected on as I was writing this is maybe this is a rule of thumb on when it is ok to abbreviate your names.  Ok, that kind of works.  If you are making a library like lodash or jquery, or another very commonly used function inside your own codebase; shortening that function name might be a good idea; and if you are where a variable is only going to live for 4 lines because you just pulled it from somewhere and are moving it somewhere else, then it might be ok to shorten that variable name.

<!--
## Don't camel/kebab/snake case compound words
-->



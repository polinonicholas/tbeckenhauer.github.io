---
layout: post
title:  "AEM Clientlib Basics"
date:   2018-11-29 00:00:00
categories: frontendDevelopment contentManagementSystem adobeExperienceManager aem clientlibs
---
- Creating First ClientLib
- Embed and Dependencies
- Creating Page Component
- Transitive Addition
- Multiple Client libs with same categories
- ClientLibs in Apps Folder
- Dumb libs Console (Client Library)
- Minification

I am learning AEM, and I am new to the system.  I think this post will illustrate that, but possibly help other newbies.

When making an AEM component, if you want to create js or css files that go along with that component you will need to use the client lib system.  I am going to go over the steps to set this up and one of the gotchas that got me.

First let's make our clientlib directory.  
{% highlight bash %}
mkdir navigation/clientlibs
{% endhighlight %}

Ok, great.  Next we need to create the .content.xml.  This is a AEM/[JCR](https://en.wikipedia.org/wiki/Content_repository_API_for_Java) thing.  You will find your source code littered with these .content.xml files.  On one level they feel like a mess, because they are everywhere.  On another level, they feel like a simple way to annotate folders with information.  I would suggest getting used to reading them, although they are not too bad.

{% highlight bash %}
vim navigation/clientlibs/.content.xml
{% endhighlight %}

{% highlight xml %}
<?xml version="1.0" encoding="UTF-8"?>
<jcr:root xmlns:cq="http://www.day.com/jcr/cq/1.0"
          xmlns:jcr="http://www.jcp.org/jcr/1.0"
    jcr:primaryType="cq:ClientLibraryFolder"
    categories="[navigation]"/>
{% endhighlight %}


Ok, next we need to create the html file for our component. We will keep it simple at that is not the point.

{% highlight bash %}
vim navigation/navigation.html
{% endhighlight %}

{% highlight xml %}
<div data-sly-use.clientLib="${'/libs/granite/sightly/templates/clientlib.html'}"></div>
<output data-sly-call="${clientlib.css @ categories='navigation'}" data-sly-unwrap/>

<nav class="navigationBlock">
    <ul class="list">
        <li class="element">
            <a>Home</a>
        </li>
        <li class="element">
            <a>About us</a>
        </li>
        <li class="element">
            <a>Contact us</a>
        </li>
    </ul>
</nav>

<output data-sly-call="${clientlib.js @ categories='navigation'}" data-sly-unwrap/>
{% endhighlight %}

Ok, now we are going to create our css file.

{% highlight bash %}
vim navigation/clientlibs/navigation.css
{% endhighlight %}

{% highlight css %}
.navigationBlock .list {
    margin: 0;
    
    box-sizing: border-box;
    display: flex;
    flex-direction: row;
}

.navigationBlock .element {
    list-style: none;
    
    flex-grow: 1;
    text-align: center;
}
{% endhighlight %}


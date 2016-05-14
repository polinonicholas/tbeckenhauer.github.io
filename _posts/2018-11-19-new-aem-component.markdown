---
layout: post
title:  "Copy And Pasting AEM Components"
date:   2018-11-19 00:00:00
categories: Programing, CodingStyle
---
I am learning AEM, and I am very new to the system.  I think this post will illustrate that, and possibly help other newbies.

So the ticket I was working on was to make a header for some of the new landing pages for this site we are building.  A similar component already existed but didn't fill all the use cases, so I figured I could copy and paste the component, so I don't break the old one with my inexperience, but I have a new one two experiment with.

So I copied and pasted the new page from another page. Surprisingly that worked pretty well.  I don't recall having to make any special changes.

so this was fine.
{% highlight bash %}
> cp ui.content/../usa/en/originalpage ui.content/../usa/en/copiedpage
{% endhighlight %}

but the trouble I ran into was when I tried to copy-paste an existing component, to work off of.
{% highlight bash %}
> cp ui.apps/../components/content/originalcomponent ui.apps/../components/content/copiedcomponent
{% endhighlight %}

I searched the code several times looking for references to 'originalcomponent', but I had forgotten to search by file name.  So I can't quite explain it, but I seem to recall that AEM looks for files of the same name of the folder first, and that worked for me.

This make me think of the [Resource Mapping][resource-mapping], and while I think that is related, I don't think that is exactly what was going on.

So I also needed to run
{% highlight bash %}
> mv copiedcomponent/originalcomponent.html copiedcomponent/copiedcomponent.html
{% endhighlight %}

So I am pretty sure this also is related to how AEM can handle different file types for the same page.  So if you wanted to also define a JSP for a page then you could also
{% highlight bash %}
> vim copiedcomponent/copiedcomponent.jsp
{% endhighlight %}


and then users could GET two different versions of the same page.
{% highlight bash %}
> curl example.com/usa/en/copiedcomponent.jsp
> curl example.com/usa/en/copiedcomponent.html
{% endhighlight %}

This might be more useful with something like html/pdf, or json/xml, but I really don't know, at this point I am hypothesizing.

[resource-mapping]: https://helpx.adobe.com/experience-manager/6-4/sites/deploying/using/resource-mapping.html

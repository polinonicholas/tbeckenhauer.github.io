---
layout: default
---

<div class="home">

  <h1 class="page-heading">Posts</h1>

  <ul class="post-list">
    {% for style_guide in site.style_guides %}
      <li>
        <h2>
          <a  class="post-link" 
              href="{{ style_guide.url | prepend: style_guide.baseurl }}">{{ style_guide.title }}</a>
        </h2>
      </li>
    {% endfor %}
    {% for tutorial in site.tutorials %}
      <li>
        <h2>
          <a  class="post-link" 
              href="{{ tutorial.url | prepend: tutorial.baseurl }}">{{ tutorial.title }}</a>
        </h2>
      </li>
    {% endfor %}
    {% for post in site.posts %}
      <li>
        <h2>
          <a  class="post-link" 
              href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
        </h2>
      </li>
    {% endfor %}
  </ul>

  <p class="rss-subscribe">subscribe <a href="{{ "/feed.xml" | prepend: site.baseurl }}">via RSS</a></p>

</div>

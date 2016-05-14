---
layout: post
title:  "Returning Early"
date:   2021-03-17 00:00:00
categories: Programing, CodingStyle, ItDepends
permalink: /returning-early/
---

Note: This is post is part of a pair with [When Validating Input](/when-validating-input/)

In this post we are going to argue for 'guard clauses' and 'returning early'.  Let's look at some of the common arguments for this.

1. Early Returns are better than Nested Conditionals
2. Early Returns let you get negative use cases out of the way to focus and simplify the main use case.
3. Early Returns are a good place to throw exceptions.

## Better than Nested Conditionals.

I think the benefits here are quite obvious. Let's take a look at some nested conditionals.

{% highlight javascript %}
function getPayAmount() {
  let result;
  if (isDead)
    result = deadAmount();
  else {
    if (isSeparated)
      result = separatedAmount();
    else {
      if (isRetired)
        result = retiredAmount();
      else
        result = normalPayAmount();
    }
  }
  return result;
}
{% endhighlight %}

Compared with:

{% highlight javascript %}
function getPayAmount() {
  if (isDead) return deadAmount();
  if (isSeparated) return separatedAmount();
  if (isRetired) return retiredAmount();
  return normalPayAmount();
}
{% endhighlight %}

The latter is obviously much cleaner.  Returning early can be used to prevent excess nesting of code blocks.

## Get negative use cases out of the way early
So here is a pretty good use case for early returns [in the wild in FirefoxLite](https://github.com/tbeckenhauer/FirefoxLite/blob/master/app/src/main/java/org/mozilla/focus/bookmark/BookmarkAdapter.java#L35).  Another way it may be written is to wrap the whole function in an if test that will check for the positive use case. I've seen code like that and have even written code like that, but the early return here is easily better.

{% highlight java %}
@Override
public void onBindViewHolder(@NonNull SiteItemViewHolder holder, int position) {
    final BookmarkModel item = getItem(position);
    if (item == null) {
        return;
    }

    holder.rootView.setTag(item.getId());
    holder.textMain.setText(item.getTitle());
    holder.textSecondary.setText(item.getUrl());
    holder.rootView.setOnClickListener(v -> {
        listener.onItemClicked(item.getUrl());
    });
    final PopupMenu popupMenu = new PopupMenu(holder.btnMore.getContext(), holder.btnMore);
    popupMenu.setOnMenuItemClickListener(menuItem -> {
        if (menuItem.getItemId() == R.id.remove) {
            listener.onItemDeleted(item);
        }
        if (menuItem.getItemId() == R.id.edit) {
            listener.onItemEdited(item);
        }
        return false;
    });
    popupMenu.inflate(R.menu.menu_bookmarks);
    holder.btnMore.setOnClickListener(v -> {
        popupMenu.show();
        TelemetryWrapper.showBookmarkContextMenu();
    });
}
{% endhighlight %}

{% highlight java %}
@Override
public void onBindViewHolder(@NonNull SiteItemViewHolder holder, int position) {
    final BookmarkModel item = getItem(position);
    if (item) {
        holder.rootView.setTag(item.getId());
        holder.textMain.setText(item.getTitle());
        holder.textSecondary.setText(item.getUrl());
        holder.rootView.setOnClickListener(v -> {
            listener.onItemClicked(item.getUrl());
        });
        final PopupMenu popupMenu = new PopupMenu(holder.btnMore.getContext(), holder.btnMore);
        popupMenu.setOnMenuItemClickListener(menuItem -> {
            if (menuItem.getItemId() == R.id.remove) {
                listener.onItemDeleted(item);
            }
            if (menuItem.getItemId() == R.id.edit) {
                listener.onItemEdited(item);
            }
            return false;
        });
        popupMenu.inflate(R.menu.menu_bookmarks);
        holder.btnMore.setOnClickListener(v -> {
            popupMenu.show();
            TelemetryWrapper.showBookmarkContextMenu();
        });
    }
}
{% endhighlight %}

## Early Returns are a good place to throw exceptions.
See the "[Throw Early Catch Late](https://howtodoinjava.com/best-practices/java-exception-handling-best-practices/)" principle.
This is pretty solid.  Since you are probably using early returns to validate input (backend or frontend), throwing an exception in an early return is the soonest you can throw it.


Sources:
1. https://cleancoders.com
2. https://refactoring.com/catalog/replaceNestedConditionalWithGuardClauses.html
3. https://softwareengineering.stackexchange.com/q/18454/36411
4. https://cis.temple.edu/~ingargio/cis71/software/roberts/documents/loopexit.txt
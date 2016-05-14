---
layout: post
title:  "Structuring: When Validating Inputs"
date:   2021-03-09 00:00:00
categories: Programing, CodingStyle, ItDepends
section: 200
---

[comment]: <> (Note: This is post is part of a pair with [Returning Early]&#40;/returning-early/&#41;)

Note: Another good and related topic that I won't cover in depth here/yet. Is how when building a codebase/system. You should be validating your input's at the boundary of the system. Don't litter every function you write with checks that variables are of a certain type.  If you want that you need to consider TypeScript or any other typed language. On the backend if you are fetching data from other systems you don't own, you need to be rigorously validating it, On the frontend rigorously validating user input. Everything else in between needs to be rigorously checked via unit testing.

Note: I know it's common for developers to 'return early' from functions or write 'guard clauses'.  I remain unconvinced.  But I do know several programmers that I respect that prefer this. So, maybe I will change my mind later or maybe I will change everyone elses mind.  https://softwareengineering.stackexchange.com/a/18459/36411

A common issue I see when reviewing code is developers using negative test cases when validating inputs

When validating input, use positive test cases, meaning test that the input/variable is the format you want rather than what you don't want.  Consider which is more effective.

{% highlight javascript %}

function comsumeUserInputGood(fieldOne, fieldTwo) {
  if(_.isNumber(fieldOne) && _.isNumber(fieldTwo)) {
      //execute behavior you want.
      return fieldOne + fieldTwo;
  } else {
      //execute exceptional case.
  }
}

function comsumeUserInputBad(fieldOne, fieldTwo) {
  if(_.isNull(fieldOne) || _.isNull(fieldTwo)) {
      //Handle the null case. Maybe there is something special you can do here.
  }
  if(_.isUndefined(fieldOne) || _.isUndefined(fieldTwo)) {
      //Handle the undefined case. Maybe there is something special you can do here.
  }
  //execute behavior you want.
  return fieldOne + fieldTwo;
}

{% endhighlight %}

I think the differences here are obvious
- In the "bad" case it's more likely to break. Maybe it wont. Maybe your input field has type=number. So in practice you are dealing with null and numbers. Ok, that's fine. The point is if you are going to be validating your input, positive test cases won't let anything slip through the cracks.

But there is another interesting side effect that should be discussed
- In the "good" case we are propagating the most interesting code to the top of the function.  It's what you probably need to be reading. It gets straight to the point. We need a number, then get on with what you're going to do with it. Littering the top of the function with negative checks is everything I am not interested in.

Another scenario that mixes the above but the point remains would be

{% highlight javascript %}

function comsumeUserInputGood(fieldOne, fieldTwo) {
  fieldOne = _.isNumber(fieldOne) ? fieldOne : 0;
  fieldTwo = _.isNumber(fieldTwo) ? fieldTwo : 0;

  return fieldOne + fieldTwo;
}

function comsumeUserInputBad(fieldOne, fieldTwo) {
  fieldOne = fieldOne || 0;
  fieldTwo = fieldTwo || 0;

  return fieldOne + fieldTwo;
}

{% endhighlight %}

I don't have to tell you an empty array or empty object would slip through the checks in the second function. [Which could lead to some fun math.](https://github.com/denysdovhan/wtfjs#funny-math)

{% highlight javascript %}
> {} + []
> 0
{% endhighlight %}

I hope I have sufficiently proved in most cases if you need to validate some input there is a good chance you should be using positive test cases.  If you have any exceptions that prove the rule, I would be interested to see them.


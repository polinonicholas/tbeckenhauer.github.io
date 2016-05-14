---
layout: post
title:  "Structuring: Ordering the functions in your class"
tags: [Programing, CodingStyle, MoreOftenThanNot]
permalink: /ordering-the-functions-in-your-class/
---

This recommendation is to help out with the readability.  It's pretty straight forward.  

## Summary
Order the entry points, or the functions that best summarize your class to the top of your class.  Order the helper functions or functions that carry low level details towards the bottom of the class.  For this example we are going to be looking at a class from todomvc. Let's take a look at a [real-ish example from todomvc](https://github.com/tbeckenhauer/todomvc/blob/master/examples/react/js/todoItem.jsx).

## Looking at todoItem.jsx without improved ordering.
Let's see how much we can figure out when we are looking at [the version before my updates](https://github.com/tbeckenhauer/todomvc/blob/master/examples/react/js/todoItem.jsx).  With my updated todoItem.jsx, the render function ended on line 47.  So we are going to look at the best things we can find out when we look above line 47 without my changes.  For the purposes of this exercise, don't read past line 47. <!-- The purpose of this recommendation is to make your code more readable, and scannable.  -->

1. The name of this file todoItem.jsx
2. handleSubmit: We trim the text, and set the state with it.
3. handleEdit: On edit, we also set the state.
4. handleKeyDown: We can cancel or submit our changes via the keyboard.
5. getInitialState: React boilerplate code.

Do you know what's going on here? I don't. It's clear we are handling some user interaction, but given the above information there is still plenty of mystery. Given this information I could have guessed wildly wrong about what this class was for.  Let's turn to the improved ordering.

## Looking at todoItem.jsx with improved ordering.
Let's see what we can find by looking at the name of the file, and the first 47 lines with [the improved ordering](https://github.com/tbeckenhauer/todomvc/blob/4ee910f1ff50a4827804e4bdc258094fd2110988/examples/react/js/todoItem.jsx).
1. The name of this file todoItem.jsx
2. The top level html element is an `<li>...</li>`
3. Inside that is a `<input type=checkbox />`
4. Following that is a `<input type=text />`
5. It looks like there are some other functions called from here that handle... stuff.

Ok, you should have a pretty good idea for what is going on here, without the need for scrolling around trying to figure out what is happening.  

## Conclusion
In the 'original' version the top of the class is littered with functions like `handleSubmit()`, `handleEdit()`, and `handleKeyDown()`.  While I agree even [The Small Stuff](https://web.archive.org/web/20210206042814/http://thecodelesscode.com/case/1) is important, some things are more important.  Easily the most important function, and the one that would give a developer reading this class for the first time the best overview for what is going on, would be `render()`.  By reading `render()` and only render you should have a good idea of what's going on in your class.  When you are writing code, please try to put the most important things first. Don't drag me down in the details right away.

<!--
1. [Another example of moving helper functions down[(https://github.com/vuejs/vue-next/pull/3538)



(https://github.com/tbeckenhauer/todomvc/compare/master...tbeckenhauer:codeSamples-OrderingTheFunctionsInYourClass?diff=split).
I find many programmers not doing this, and I don't blame them. Many times languages don't support it.  Thankfully, Javascript does allow one way to do this.

That is [react/js/todoItem.jsx](https://github.com/tbeckenhauer/todomvc/compare/master...tbeckenhauer:codeSamples-OrderingTheFunctionsInYourClass?diff=split).
(https://github.com/tbeckenhauer/todomvc/compare/master...tbeckenhauer:codeSamples-OrderingTheFunctionsInYourClass?diff=split). 
-->

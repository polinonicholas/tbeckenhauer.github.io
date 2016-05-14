---
layout: post
title:  "Structuring: Using Sane Defaults"
date:   2021-03-16 00:00:00
categories: Programing, CodingStyle, ChooseWhereYourComplexityIs
section: 1
---

Here I would like to argue for a style of code I have come to like. There are a few phrases I associate with it.
1. Using sane defaults
2. Write your code so that it is always true.
3. [Null object pattern](https://en.wikipedia.org/wiki/Null_object_pattern#JavaScript)
4. Dynamic Dispatch

Now it's not that 3 and 4 are 1 and 2, but rather it is because I find Null Object's to be sane defaults, and Dynamic Dispatch to be a way to write your code so that it's always true.  I'll leave discussion of Null object's and Dynamic dispatch for another time.

A recent issue that came up put this at the forefront of my mind. It involved updating a pie chart. Now this pie chart could have many states, but two basic ones, we will throw in a third for good measure.
1. Loading
2. Empty
3. Populated

Now during the pie chart initialization code, I saw something like

{% highlight javascript %}
const pieChartEmpty = {
   text: 'This pie chart is empty, something broke!'
}
const pieChartLoading = {
   text: 'Please wait while the data loads...'
};
const pieChart = {
};
{% endhighlight %}

Do you see where this is going? Let's attach that loading state.

{% highlight javascript %}
   attachPieChart(pieChartLoading)
{% endhighlight %}

Let's fetch some data.

{% highlight javascript %}
function fetchData() {
   fetch(fromSomeEndpoint)
       .then((data) => {
           if(isEmpty(data)) {
               attachPieChart(pieChartEmpty)
           } else {
               pieChart.data = data
               attachPieChart(pieChart)
           }
       })
       .catch(() => {
           attachPieChart(pieChartEmpty)
       })
}
{% endhighlight %}

Maybe the user manipulates the data in some way.

{% highlight javascript %}
handleSomeUserInteraction(data) {
   if(isEmpty(data)) {
       attachPieChart(pieChartEmpty)
   } else {
       pieChart.data = data
       attachPieChart(pieChart)
   }   
}
{% endhighlight %}

My issue is why are we creating special cases?  I am sure this empty pie chart and the loading pie chart aren't going to be that far off from the normal pie chart. We probably only need to feed in the right data for it to work correctly.  The primary problem here is that in the developers mind they are creating these special scenarios where we need to start littering the code with if/else checks to see which scenarios we are in and then run a different set of instructions.

A more robust way to deal with this solution is to
#### 1. Validate your input/Use sane defaults

  - This is slightly different than my other post, but in the more normal sense of the expression.  If you don't want to deal with, maybe in this case, nulls and undefineds then check for that at the boundary of your system and ensure they never make it in.  Switch out those nulls for integer zeros which your pie chart is more likely to handle.  We will assume we are fetching the data from your internal backend system that you have control over.  The reason why I can put these two things together is sometimes we are the source of our own bad input.

#### 2. Make your target component more robust/Write your code so that it's always true.

  - In this particular case maybe your input is already feeding you zeros, and your component is having trouble handling that.  Ok if a section has a zero, shouldn't it not take up any space on a pie chart?  And if everything is zero, wouldn't it be reasonable to gray out the chart?  If someone is explicitly feeding me zeros that doesn't sound crazy, and it would probably be good to call out that section on the legend.

#### 3. Choose where your complexity is.

  - I am going to make a separate blog post on this, but this is an excellent example of it, so I would like to go ahead and call it out.  Sometimes good engineering is about choosing where your complexity is.  As an engineer you are given problems to solve and you don't get to decide how complex the problems are you get to design the solutions.  Meaning you get to decide the types of tools and how those tools come together to reflect the problem. You also get to decide which parts of the system are more complex than the others.  In this case you should move the complexity from the fetchData function and the handleUserInteraction functions and move this complexity to the backend, and move complexity to the UI Component to handle more scenarios.  Frequently when the business folks say they want something simple what they mean is they want something fast, so don't confuse those two.  If they give you a complex problem it will never truly be solved by a simple solution, it's going to miss use cases.  If you bring too complex of a solution to a problem, it's not going to be worth it to maintain. It needs to fall in a 'goldilocks zone' it needs to be 'just right'.  Even still you can choose where your complexity is.

Now let's try it again with some of these suggestions.


{% highlight javascript %}
const pieChart = {
   text: 'Please wait while the data loads...'
};
attachPieChart(pieChart)
{% endhighlight %}

Ok, only one thing to think about.

{% highlight javascript %}
function fetchData() {
   fetch(fromSomeEndpoint)
       .then((data) => {
           //We will do this here, but if it's the backend that is calling an external api, the backend should verify the input.
           return data.map((val) => {
               if(isNumber(val)) {
                   return val;
               else if(isNull(val)) {
                   return 0;
               } else {
                   throw new Exception("Unhandled Input");
               }
           });
       })
       .then((data) => {
           pieChart.data = data
           pieChart.text = 'Click on a section'
       })
       .catch(() => {
           pieChart.text = 'This pie chart is empty, something broke!';
       })
}
{% endhighlight %}

The attachPieChart function will probably need some additional robustness to handle responding to a changing object.  That's fine, that's a feature. 


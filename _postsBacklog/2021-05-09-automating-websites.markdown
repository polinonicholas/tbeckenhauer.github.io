---
layout: post
title:  "Automate Your Work"
tags: [Programing, ItDepends]
permalink: /automate-your-work/
---

I am assuming if you are reading this blog you are a programmer, want to be a programmer, or at least interested in programing.  I have worked with a lot of developers and it is rare that I see developers really embracing the idea of automating their work. So I just want to throw out this simple idea and example that I turn to frequently, because I wish I saw more developers using it.

Feel free to open the developer tools on a website and start hacking together userscripts to make the website do what you want it to.  2 Examples.

First example is from Atlasian.  I was cleaning up my email inbox, and took note of how many emails atlassian was sending me.  I found my self looking at all of my watched issues in atlassian, and decided I needed to clean that up.  There wasn't an obvious way in atlassian to batch remove them So I hacked myself together a quick script that could do the job.

![Too Many Watched Issues](/assets/watched-atlassian-issues.png)

//atlassian
function clickAllTheButtons(i) {
	$(".issue-list li")[i].click();
    window.setTimeout(function () {
		$(".watch-state-on").click()
        window.setTimeout(function () {
            if(i>30) {
                return;
            } else {
                clickAllTheButtons(i+1)
            }
        }, 1500)
	}, 1500)
}


//lastpass
function clickAllTheButtons(i) {
	$("button.itemButton.rejectShare")[i].click();
    window.setTimeout(function () {
		$("#confirmationDialog [automation-id=okButton]").click()
        window.setTimeout(function () {
            if(i>30) {
                return;
            } else {
                clickAllTheButtons(i+1)
            }
        }, 5000)
	}, 1000)
}

//LinkedIn Learning Not giving you a full screen option.
(function() {
    'use strict';
    document.querySelector(".classroom-layout__stage").style.maxHeight = "100%"
    document.querySelector(".classroom-layout__stage").style.flex = "0 0 100%"
})();
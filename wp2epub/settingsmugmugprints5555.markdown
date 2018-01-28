
[Setting SmugMug
Print Size Keywords with Jupyter and Python](http://analyzethedatanotthedrivel.org/2018/01/28/setting-smugmug-print-size-keywords-with-jupyter-and-python/)
-----------------------------------------------------------------------------------------------------------------------------------------------------------

*Posted: 28 Jan 2018 07:27:10*

For the last few weeks, my normal hobbies have been preempted by my
obsessive *refactoring* of an old SmugMug keyword setting program. Many
years ago I wrote a small application that helped me maintain meaningful
SmugMug keywords. I used this application for years until inevitable
software changes broke it. Replacing it with something better has been
on my to-do list for ages.

I kept putting it off because I knew the tools I used in the past,
mostly J and VB, were not well suited to REST API programming. Yes, I
know just about any programming tool can be forced to serve, Turning
completeness guarantees it, but I have grown weary of programming to
prove tiresome points. If a tool makes something more difficult or
tedious than it should be then change tools!

The downside of changing tools is that it usually results in learning
yet another programming language. I always try to avoid this! I briefly
considered languages with decent REST support that I already
*sort-of-know*[^5555a], C\#, JavaScript, VB.Net and decided that proper 64
bit versions were either too expensive (C\#, VB.Net) or that I didn’t
want to stare at ugly bracket infested syntax for weeks. I’m talking
about you JavaScript. Even your fanboys admit that you’re an ugly
duckling.

I eventually decided to go with Python. I’ve always found Python code
more readable than many other programming languages. This is a
widespread opinion. Python is free, open source, and comes with a large
diverse set of tools. One of the best tools to come out of the Python
world is Jupyter. [Jupyter](https://jupyter.org/) is the first public
domain open source [literate
programming](https://en.wikipedia.org/wiki/Literate_programming) tool
that has gained a large following.

I’ve been a fan of literate programming ever since I read [Knuth’s
seminal book](https://en.wikipedia.org/wiki/Literate_programming). He
used the technique to create some of the [best program documentation
ever
created](https://www.amazon.com/TeXbook-Donald-Knuth/dp/0201134489). I
always wondered why literate programming never caught on. I suspected
the basic problem was simply that many programmers are not particularly
literate. Well, Jupyter is proving me wrong.

*Jupyter is certainly helping me write and program with such clarity
that all my ideas seem trivial.*

Compare this notebook, (use the first link for the best layout), to my
[earlier blog
post](https://analyzethedatanotthedrivel.org/2010/02/21/assigning-smugmug-print-size-keys/)
about setting SmugMug print size keywords.

1.  **Nbviewer**: [Setting SmugMug Print Size Keywords with Jupyter and
    Python](https://nbviewer.jupyter.org/github/bakerjd99/smugpyter/blob/master/notebooks/Setting%20SmugMug%20Print%20Size%20Keywords%20with%20Jupyter%20and%20Python.ipynb)

2.  **GitHub**: [Setting SmugMug Print Size Keywords with Jupyter and
    Python](https://github.com/bakerjd99/smugpyter/blob/master/notebooks/Setting%20SmugMug%20Print%20Size%20Keywords%20with%20Jupyter%20and%20Python.ipynb)

[^5555a]: Be highly suspicious of people who claim to fully understand any
    programming language. Only delusional nitwits would make such a
    claim for any natural language. Does anybody, even luminaries like
    Shakespeare, truly understand English? We all *sort-of-know* our
    mother tongues and if we’re honest, we’re continually surprised by
    how others make use of it. *Literature, it’s a thing.* The same
    holds for programming languages. Every day I’m surprised, by
    unusual, stupid, silly, clever and freaking brilliant code fragments
    in programming languages that I have used for decades.

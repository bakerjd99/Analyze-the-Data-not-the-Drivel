 
[Jacks Repository](https://bakerjd99.wordpress.com/2013/12/21/jacks-repository/)
-------------------------------------------------------------------------------

*Posted: 21 Dec 2013 19:30:56*

The other day I attempted to browse a [J
script](https://github.com/bakerjd99/jacks/blob/master/geotagged/kml.ijs)
described in an [old blog
post](https://bakerjd99.wordpress.com/2009/10/04/google-earth-image-touring/)
only to find that my employer’s network monkeys had blocked the [file
sharing service](https://app.box.com/). I’ve railed about [IT control
freaks](https://bakerjd99.wordpress.com/2012/06/09/controlling-cell-phones-the-new-it-frontier/)
in the past. They will not rest until it’s impossible to do useful work.
I fumed and grumbled until I perceived a bigger problem. I have so many
references to program code in this blog that it’s getting tedious
tracking them down. Wouldn’t it be nice if my hacks were neatly
organized in one coherent repository?

Let me introduce [`jacks`](https://github.com/bakerjd99/jacks). `jacks`,
or “J-hacks”, organizes the [J related code referenced in this
blog](https://github.com/bakerjd99/jacks) into a single
[GitHub](https://github.com/bakerjd99/jacks) repository. Most of the
scripts in `jacks` are one-offs but some have [proven so
useful](https://bakerjd99.wordpress.com/2012/02/25/wordpress-to-latex-with-pandoc-and-j-using-texfrwpxml-ijs-part-3/)
that it makes sense to store them in a repository and track changes.
From now on `jacks` will be the first place to look for code from this
blog. You pull the contents of `jacks` into a new Git repository with
the commands:

        git init
        git remote add jacks https://github.com/bakerjd99/jacks.git
        git pull jacks master

It took me a few moments to settle on the name “jacks.” I considered
“jokes” because programmers often take their code too seriously and
“jocks” because J programmers are wild out of control convention
eschewing code jocks but `jacks` won out when I remembered the refrain
“jack be nimble, jack be quick, jack jump over” *whatever coding problem
is pissing you off.*

 
[More J Pandoc Syntax HighLighting](https://analyzethedatanotthedrivel.org/2020/02/19/more-j-pandoc-syntax-highlighting/) 
------------------------------------------------------------------------------------------------------------------------

*Posted: 20 Feb 2020 02:48:09*

Syntax highlighting is essential for blogging program code. Many blog
hosts recognize this and provide tools for highlighting programming
languages. [WordPress.com](https://wordpress.com/) (this host) has a
[nifty highlighting
tool](https://en.support.wordpress.com/wordpress-editor/blocks/syntax-highlighter-code-block/)
that handles dozens of mainstream programming languages. Unfortunately,
one of my favorite programming languages, [J](//www.jsoftware.com), (yes
it’s a single letter name), is way out of the mainstream and is not
supported.

There are a few ways to deal with this *problem.*

1.  Eschew J highlighting.

2.  Upgrade[^1x5741] your *WordPress.com* subscription and install custom
    syntax highlighters that can handle arbitrary language definitions.

3.  Find another blog host that freely supports custom highlighters.

4.  Roll your own or customize an existing highlighter.

A few years ago I went with the fourth option and hacked the superb
open-source tool [pandoc](https://pandoc.org/). The grim details are
described in [this blog
post](https://analyzethedatanotthedrivel.org/2012/09/20/pandoc-based-j-syntax-highlighting/).
My hack produced a customized version of pandoc with J highlighting. I
still use my hacked version and I’d probably stick with it if current
pandoc versions had not introduced *must-have features like converting
[Jupyter](https://jupyter.org/) notebooks to Markdown, PDF, LaTeX and
HTML.* Jupyter is my default *thinking-things-through* programming
environment. I’ve even taken to [blogging with Jupyter
notebooks](https://github.com/bakerjd99/smugpyter/blob/master/notebooks/Unified%20XKCD%20Colors.ipynb).
If you write and explain code you owe it to yourself to give Jupyter a
try.

Unwilling to eschew J highlighting or forgo Jupyter I was on the verge
of re-hacking pandoc when I read the current pandoc (version 2.9.1.1)
documentation and saw that ***J is now officially supported by
pandoc.*** You can verify this with the shell commands.

The pandoc developers made my day! I felt like [Wayne meeting a rock
star](https://www.youtube.com/watch?v=lBEn3a4TIUw).

Highlighting J is now a simple matter of placing J code in markdown
blocks like:

        ~~~~ { .j }
            ... code code code ...
        ~~~~

and issuing shell commands like:

```BASH
pandoc --highlight-style tango --metadata title="J test" -s jpdh.md -o jpdh.html
```

The previous command generated the HTML of this post which I pasted into
the WordPress.com *Classic Editor.* Not only do I get J code
highlighting on the cheap I also get footnotes which, *for god freaking
sakes*,[^2x5741] are not supported by the new WordPress block editor for low
budget blogs.

***The source [markdown used for this post is available here
enjoy!](https://github.com/bakerjd99/jacks/tree/master/pandocexamples)***


[^1x5741]: The pay more option is always available.

[^2x5741]: WordPress.com is beginning to remind me of Adobe. Stop taking away
    longstanding features when upgrading!

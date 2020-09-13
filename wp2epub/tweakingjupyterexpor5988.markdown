
[Tweaking Jupyter export HTML with Templates](http://analyzethedatanotthedrivel.org/2020/07/31/tweaking-jupyter-export-html-with-templates/)
-------------------------------------------------------------------------------------------------------------------------------------------

*Posted: 31 Jul 2020 22:34:35*


In a [previous post](https://analyzethedatanotthedrivel.org/2020/06/01/better-blogging-with-jupyter-notebooks-on-wordpress-com/), I outlined some handy hacks for converting Jupyter notebooks to WordPress.com oriented HTML. This addendum describes the use of [Jupyter templates](https://www.datacamp.com/community/tutorials/jinja2-custom-export-templates-jupyter) and CSS edits to fine-tune exported HTML.

Jupyter exports notebooks in a variety of formats. I regularly export notebooks as Markdown, HTML, and LaTeX. When blogging I mainly use HTML and Markdown. Standard 
HTML output labels code blocks with numbered prompts and indents text. The following [Rust](https://www.rust-lang.org/) [hello world](https://en.wikipedia.org/wiki/%22Hello,_World!%22_program) program illustrates this layout.


```Rust
// This is the main function
fn main() {
    // Statements here are executed when the compiled binary is called

    // Print text to the console
    println!("Hello World!");
}
```

For a few simple examples numbered indented blocks are fine but for longer posts, the redundant numbering and space-wasting indents grow tiresome. I used standard HTML output for [Using jodliterate](https://analyzethedatanotthedrivel.org/2020/05/25/using-jodliterate/) and around  prompt `In[7]:` I was irritated with Jupyter's defaults.

Here's something you should know about me.

***I don't like being irritated!***

In addition to indented numbered prompts the standard format suffers from other [*boo-boos*](https://www.dictionary.com/browse/boo-boo) when run through [Benny's](https://github.com/bennylp) Jupyter to WordPress.com [transmogrifier](https://calvinandhobbes.fandom.com/wiki/Transmogrifier). Markdown source code like `source` code `McCodeyFace` is set off in ugly blocks and any use of LaTeX generates hideous inline images with nontransparent backgrounds like:

$$ \varphi (u) = \int_{\Omega} \left[
\dfrac{\|\nabla u\|^2}{2} +
\lambda\dfrac{u^2}{2} -
\dfrac{(u^+)^p}{p} \right] d\mu $$

You can hack the background color of WordPress.com LaTeX by bolting in a HEX color code suffix. This blog's background color is *currently* set to `cfcdcd` so `\sqrt[n]{1+x+x^2+x^3+\dots+x^n}&bg=cfcdcd` yields:

$$ \sqrt[n]{1+x+x^2+x^3+\dots+x^n} $$

As far as I know, there is no global WordPress.com 
LaTeX background color setting. You are forced to hard code the suffix into
every expression and if you ever change your theme's background color you have to
do it all over again.

***Remember that bit about how I don't like being irritated?***

Hard coding is euphemistically called a ["code smell."](https://www.codegrip.tech/productivity/everything-you-need-to-know-about-code-smells/) In this case, it's a foul stench.
This isn't Jupyter's fault. Jupyter sensibly uses [MathJaX](https://www.mathjax.org/) to render mathematics with proper scaled outline fonts, but MathJax is an external JavaScript library and WordPress.com does not allow cheap peons like *moi* to drag in alien JavaScript libraries.

> Side note to WordPress.com. Make an exception to your no JavaScript rule for MathJax. MathJax is a well
> established standard library and you're being pigheaded by not allowing it.

Some of these problems can be fixed with CSS tweaks, Jupyter templates, and `nb2wp` edits.
#### Tweaking Jupyter export formats

You can adjust Jupyter export formats with templates. Templates modify how 
[nbconvert](https://nbconvert.readthedocs.io/en/latest/) transforms notebook JSON `.ipynb` files into HTML, Markdown, and other formats. Here's a good basic [introduction to Jupyter templates](https://nbconvert.readthedocs.io/en/latest/customizing.html).

Jupyter templates are versatile and powerful but with "*great formatting power comes extreme annoyance.*" I don't want to learn yet another programming language to tweak my fricking blog! Fortunately, it's not necessary to get deep in the [jinja](https://jinja.palletsprojects.com/en/2.11.x/) weeds to remove a few block labels. The following template `tpl` file meets my meager needs.

#### A brain dead Jupyter template: blankfull.tpl

```PYTHON
{% extends 'full.tpl'%}

## change the appearance of execution count
{% block in_prompt %}
&nbsp;&nbsp;&nbsp;&nbsp;
{% endblock in_prompt %}

{% block prompt %}
{% endblock prompt %}

{% block output_area_prompt %}
&nbsp;&nbsp;&nbsp;&nbsp;
{% endblock output_area_prompt %}

{% block output_area %}
{% endblock output_area %}
```

Save the preceding as UTF-8 text with extension `tpl` in Jupyter's `nbconvert` share directory. 
The location of this directory will vary for different systems. On this Windows 10 machine it can be found here:

```
C:\Anaconda\share\jupyter\nbconvert\templates\html
```

Refer to `nbconvert` documentation to determine where to save `tpl` files on your system.

Stashing a custom template in the proper location removes block prompts and indentation but it doesn't
fix CSS issues. The [CSS style file](https://github.com/bennylp/nb2wp/blob/master/style.css) distributed with `nb2wp`
needs a few lines changed to prevent `MarkdownText` from getting a white background. The values after the line numbers 
on the left are the settings you need to give `CodeyMcCodeFace` text `FRAGMENTS` transparent backgrounds. 

```CSS
 1077:   background-color: transparent;  background-color: #fff;
 1529:   background-color: transparent;  background-color: #f9f2f4;
10126:   background-color: transparent;  background-color: #fff;
```

Finally, to control annoying LaTeX color backgrounds add another argument
`bg_color_hex=''` to the Python function `nb2wp`. 

#### Running nb2wp with adjustments


```python
import os
import sys

# append nb2* script directory to system path
sys.path.append(r'C:\temp\nb2wp')

import nb2wput as nbu
```


```python
# set notebook files - the source for this blog post
nb_file_0 = r'C:\temp\nb2wp\TweakingJupyterExportTemplates0.ipynb'
nb_file_1 = r'C:\temp\nb2wp\TweakingJupyterExportTemplates1.ipynb'
```


```python
# convert notebook with (nb2wp) using
# defaults for unspecified arguments
nbu.nb2wp(nb_file_0, out_dir=r'C:\temp\nb2wp\tmp',
    css_files=[r'C:\temp\nb2wp\style.css'], save_css=True, 
    remove_attrs=True, template='full', latex="wp",
    img_dir=r'C:\temp\nb2wp\tmp\img', footer=False)
```

    Using template: full
    Using CSS files ['C:\\temp\\nb2wp\\style.css']
    Saving CSS to C:\temp\nb2wp\tmp\style.css
    C:\temp\nb2wp\tmp\TweakingJupyterExportTemplates0.html: 23132 bytes written in 7.650s
    


```python
# convert notebook using tweaked CSS and custom template
nbu.nb2wp(nb_file_1, out_dir=r'C:\temp\nb2wp\tmp',
    css_files=[r'C:\temp\nb2wp\my_nb2wp_style.css'], save_css=True, 
    remove_attrs=True, template='blankfull', latex="wp", bg_color_hex='cfcdcd',
    img_dir=r'C:\temp\nb2wp\tmp\img', footer=False)
```

    Using template: blankfull
    Using CSS files ['C:\\temp\\nb2wp\\my_nb2wp_style.css']
    Saving CSS to C:\temp\nb2wp\tmp\style.css
    C:\temp\nb2wp\tmp\TweakingJupyterExportTemplates1.html: 57127 bytes written in 12.055s
    

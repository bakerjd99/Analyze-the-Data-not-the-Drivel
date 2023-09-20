## [Let ChatGPT Index Your LaTeX Documents](http://analyzethedatanotthedrivel.org/2023/09/18/let-chatgpt-index-your-latex-documents/) {#let-chatgpt-index-your-latex-documents .unnumbered}

*Posted: 18 Sep 2023 18:00:10*

Indexing documents is an ongoing chore. You would think picking out
"good" book or article index words would be a trivial
pseudo-sampling-sorting task, but that is not the case. Building a
useful index requires something like "comprehending" the text. You must
read the document, understand what's in it, and then judiciously select
words that elucidate, navigate, and summarize the contents. Until
recently, coding "reading comprehension" has been beyond my meager
means. Then the other day, I had a brain fart; maybe ChatGPT can index
LaTeX documents.

As a test, I decided to index my blog post *[Sympathy for
Ptolemaic Epicyclers](https://analyzethedatanotthedrivel.org/2023/04/07/sympathy-for-ptolemaic-epicyclers/).*
For years I have been converting my WordPress blog posts to LaTeX with
my J-based hack *[WordPress to LaTeX with Pandoc and
J](https://analyzethedatanotthedrivel.org/2012/02/11/wordpress-to-latex-with-pandoc-and-j-prerequisites-part-1/)*
and storing the generated LaTeX code on GitHub. Here is the [LaTeX for
Ptolemaic
Epicyclers](https://github.com/bakerjd99/Analyze-the-Data-not-the-Drivel/blob/master/wp2latex/sympathyforptolemaic7823.tex).
With code in hand, I logged into ChatGPT 3.5 and had this chat.

I first asked ChatGPT to summarize *Sympathy for Ptolemaic Epicyclers*.

> `Me: Please summarize the following text.`

*... upload of LaTeX code for Ptolemaic Epicyclers ...*

> `ChatGPT: The provided text discusses the historical perspective of astronomy and the Ptolemaic system. It highlights that often, older theories are unfairly portrayed as ignorant and backward, whereas in reality, they were based on empirical observations and provided reasonable approximations. The text points out that the transition to new theories typically happens when the new model demonstrates its superiority in making predictions.`
>
> `The author also mentions their recent work on a J script called "riseset," used for calculating when International Astronomical Union (IAU) stars culminate in their backyard. They explain that astronomical calculations, both in the past and today, are complex and require constant adjustments.`
>
> `In conclusion, the text offers sympathy and respect for ancient astronomers who worked with limited tools and still made valuable contributions to understanding the cosmos. It emphasizes that these astronomers were not morons but rather practical philosophers trying to make sense of the observable universe.`

If you read my blog post, you'll see that ChatGPT's summary is dead on.
Also, ChatGPT's concluding remarks are better than mine. No wonder
ChatGPT is scaring credentialed pseudo-intellectuals everywhere. I then
asked.

> `Me: Please pick out good words to index from the text that you just summarized.`

> `ChatGPT: Here are some good words or phrases to index from the summarized text:`
>
> `Ptolemaic system Old theory holdouts Copernicus Heliocentric model Aristarchus Sun-centered models International Astronomical Union (IAU) GitHub Astronomical calculations Empirical observations Modern calculations N-body celestial mechanics Gravitational theories Backyard amateur astronomer Ancient epicyclers`
>
> `You can use these words or phrases as entries in the index of your LaTeX document to help readers easily find relevant information.`

You'll notice that ChatGPT didn't just pick out words, it synthesized
useful phrases that eerily sum up the contents of my post. I have no
objections to the generated phrases even though I doubt I would have
come up with them myself. I was impressed. This thing is a great
sounding board for writers.

Feeling lucky I decided to go for broke and ask ChatGPT to insert
LaTeX indexing codes into my document.

> `Me: Please insert the latex index codes for the words you selected in the text I provided.`

> `ChatGPT: Certainly! Here are the LaTeX index codes inserted into the provided text for the selected words:`

*... download of modified LaTeX code with \\index{} commands inserted
...*

ChatGPT effortlessly inserted the index codes into my document, and we
concluded our chat with:

> `Me: Thank you`

> `ChatGPT: You’re welcome! If you have any more questions or need further assistance, feel free to ask. Good luck with your LaTeX document!`

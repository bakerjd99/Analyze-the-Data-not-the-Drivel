
[Affinity Photo 
Review](http://analyzethedatanotthedrivel.org/2017/01/22/affinity-photo-review/)
--------------------------------------------------------------------------------

*Posted: 22 Jan 2017 23:40:20*

There’s a new image processor on my computers. Recently the chief
developer of one of my favorite image editors, [Picture Window
Pro](http://www.dl-c.com/) (PWP), sent out a sad email letting all PWP
users know that he is stopping PWP development. He thanked us for over
twenty years of support and as a last gift converted the final version
of PWP to freeware. You can now download and run Picture Window Pro
without a key. PWP is a superb program! It’s still the fastest and
meanest image editor I have ever used and I am constantly trying image
editors. If you’re interested in getting a free copy of PWP download the
program before the distribution website shuts down.

I was saddened by this news but all good things eventually end. With PWP
going away I decided, for the n^th^ time, to look for alternatives. I
reconsidered Photoshop. I’ve used full-blown Photoshop but frankly, I’ve
never been impressed. It’s expensive and slow! I use an old copy of
Photoshop Elements, mainly to remove blemishes on film scans, but in my
opinion, the only Adobe image processing product worth paying for is
[Lightroom](https://www.adobe.com/products/photoshop-lightroom.html).
Adobe is the evil image processing empire. They squeeze you with
sluggish performance and abusive subscription payment models and then
act like they’re doing you a favor. It didn’t take me very long to
abandon Photoshop (again) and keep looking for PWP alternatives. Lucky
for me there’s this thing called
[DuckDuckGo](https://start.duckduckgo.com/) that quickly led me to
[Affinity Photo.](https://affinity.serif.com/en-us/)

Affinity Photo is a relatively new image editor that got started in the
Mac world and, as of November 2016, is also available for 64 bit Windows
systems. Affinity has snagged dozens of [positive
reviews](https://fstoppers.com/photoshop/affinity-photo-finally-true-alternative-photoshop-windows-153211)
and, unlike Photoshop, is reasonably priced. I decided to give myself a
little Christmas present and bought Affinity Photo.

The Affinity Windows download file is large: over 200 megabytes.
Affinity Windows depends on `.Net 4.6.2` which is also installed if it’s
not on your machine. It took a few minutes to suck down and install all
the required bytes but things went smoothly and I eagerly started the
program.

Before relating my impressions of Affinity Photo I will describe my
*binary image format philosophy*. Image editors typically create and
manipulate vendor specific proprietary binary image files. Binary image
files like PSDs, NEFs, DNGs, and now Affinity’s AFPHOTOs, have a nasty
tendency to evolve on vendor whim. This poses fundamental long-term
image storage problems. Even if you conscientiously backup and archive
your original image files you may discover, a decade hence, that you can
no longer load them with current software. I hate this! *Photography is
for the ages, not the marketing cycles of software and camera
companies!* If you have ever wondered why the lowly JPG image format
still reigns supreme despite its abundant technical deficiencies stop
wondering. The JPG format is an open and well described eight-bit
channel format. Any competent programmer can write software to read and
write JPGs. The same holds for TIFs, PNGs and a few other open formats.
This is not true for vendor dominated formats. The specifications, even
if disclosed, can change on a moment’s notice.

How can photographers deal with *transient* binary image formats? There
are two basic approaches. You can convert all your images to an open
image format. Some photographers convert camera RAW files to high bit
TIFs. Converting large numbers of image files is a tedious and resource
hungry process but it’s probably the best bet for long-term storage. I
use the second lazier approach: maintain at least two independent image
programs that can read and write the binary image formats you work with.
I use Nikon cameras; they crank out proprietary NEF binaries. Currently,
I have four programs on this machine that can read NEFs: PWP, Lightroom,
Affinity and [ThumbsPlus](http://www.cerious.com/). I will tolerate
proprietary binaries *if and only if* I have options. Don’t let software
and camera companies box you in.

I started using image editors about fifteen years ago. My first editor
came with my first digital camera: a one megapixel HP. I cannot remember
the name of this program; I only used it long enough to discover its
appalling deficiencies. Within a week I had purchased my first version
of Photoshop Elements (PE). I was happy with PE until I encountered
[posterization](https://en.wikipedia.org/wiki/Posterization) (read the
link for the gory technical details). Posterization wreaks prints and
it’s easy to posterize eight-bit channel images. The answer then, as it
is now, is to increase your working bit depth. Adobe recommended
upgrading from PE to full Photoshop. Why fork over \$70 bucks when you
can fork over \$500? Photoshop Elements has a long history of half-assed
support for sixteen-bit channel images and the reason is painfully
obvious. If Photoshop Elements fully embraced sixteen-bit channel images
there would be very little need for full Photoshop. You could save
yourself hundreds of dollars. Adobe decided not to compete with
themselves and adopted the time-tested pseudo-monopolistic practice of
sodomizing the customer. I did not embrace the
[butthurt](http://www.urbandictionary.com/define.php?term=ButtHurt)! I
started looking for low-cost programs that properly handled sixteen-bit
images. It didn’t take me long to find PWP.

This early experience shaped my entire image processing approach.
Instead of adopting a single monolithic “industry standard” program and
joining the *nerd herd* I decided to go my way and use many small
programs. Instead of a Goliath, I went with many Davids.[^1] When you
take the David approach interoperability moves to the top of the stack.
The output of one program must effortlessly become the input of another.
How programs play together matters. Additionally, when you apply the
David approach, you never look to completely replace your tool set.
General purpose tools like Affinity may be able to do all the things
more specialized tools can do but probably not as efficiently or as
well.

So, before adding Affinity to my trusted tools I asked:

1.  Does Affinity play nice with others?

2.  Is Affinity’s user interface (UI) tolerable?

3.  Does Affinity streamline common tedious tasks?

4.  What new capabilities does Affinity offer?

With these points in mind let’s look at Affinity Photo.

**Does Affinity play nice with others?**

One of the first things I look for in image processors is *tolerable*
loading times. Part the reason I’ve never been able to stick with full
Photoshop is because it takes forever to get the damn thing up. Affinity
on Windows easily beats full Photoshop but it’s still slower than good
old C coded PWP. PWP comes up in a flash. It’s one of the many reasons I
stuck with it for over a decade. Affinity’s loading speed is comparable
to [GIMP](https://www.gimp.org/), Photoshop Elements and Lightroom: fast
enough to not drive me crazy.

After loading Affinity, I immediately started testing the program’s
ability to read and write sixteen-bit TIF files. The basic single layer
sixteen-bit TIF file format is one of the best supported lossless image
formats. It’s often the only way to move information from one program to
another without trashing bits. JPGs are universal, but every time you
write a JPG you lose data: that’s the [lossy part of
JPG](http://www.howtogeek.com/142174/what-lossless-file-formats-are-why-you-shouldnt-convert-lossy-to-lossless/)
compression. Lossy image formats are fine for the web and final
presentation but are a total disaster for image editing. Affinity can
read and write sixteen-bit TIFs. It can also read and write a number of
other important formats like Photoshop Elements PSDs. Affinity converts
PSD layers to AFPHOTO layers. It also handles JPGs, PNGs and many RAW
formats like Nikon’s NEFs. *Affinity plays well with others.*

**Is Affinity’s user interface UI tolerable?**

Once I had satisfied myself that I could slosh bits through Affinity I
started evaluating the program’s user interface. UIs have ruined many
editors. I’m immediately suspicious when reviewers start lauding a
program’s UI before spending a few hundred hours using it. UIs either
help or hinder. Affinity’s UI is decent. If you have ever used a layer
oriented image editor you will quickly adjust to how Affinity works. [I
strongly recommend watching the Affinity tutorial
videos](https://affinity.serif.com/forum/index.php?/topic/10119-in-house-affinity-photo-video-tutorials/);
they are among the best video tutorials I’ve seen and quickly show what
the program can do.

Once Affinity is loaded it’s pretty zippy. Common image handling
operations are fast enough to *fly under my annoyance radar*. Image
processing can be very demanding. Don’t expect to stitch 500-megabyte
panoramas from original RAW files instantly. With current hardware and
software, some things will take time. It’s fair to say that Affinity’s
performance compares favorably to other image processors. *I can put up
with Affinity’s user interface.*

**Does Affinity streamline common tedious tasks?**

After playing with Affinity for a few days I used the program to help
restore some old scanned slides. Old pictures are always damaged; they
all need a bit, or a lot, of retouching. The problems most people
associate with old pictures, tears, color changes, and loss of tone are
usually easily fixed in most editors. The biggest job is removing
thousands of scratches, spots, and stains. Most restorers give up and
crop or blur away such defects but I’m with Lady Macbeth: “out, out damn
spots.” Any tool that helps me hunt down and exterminate spotty pests
will be lovingly embraced.

The Affinity [inpainting brush](https://vimeo.com/130966523) works a lot
better than the corresponding Photoshop Elements healing brush. In
particular, it crosses linear backgrounds, buildings, fabric patterns,
and so forth without unduly destroying detail. Removing long linear
scratches that cross regular structured detail is a soul draining chore.
Whenever I see such defects I typically give up and find another picture
to restore; I have a big backlog of scans awaiting restoration! This
slide of the southern coast of Beirut Lebanon, taken by my

[Image link: Southern Coast of Beirut Lebanon](https://conceptcontrol.smugmug.com/Places/Overseas-Places/Beirut-Lebanon-1960s-1/i-xVRksrK/A)

father in 1968, is typical of many images in my backlog. There were
dozens of long linear scratches running through the buildings. It would
have taken hours to fix them with PE. All it took was a few passes with
Affinity’s inpainting brush to remove them. I was impressed. This single
tool significantly speeds up restoring scratched and spotted images and
justifies Affinity’s purchase price all by itself.

Another Affinity tool that streamlines common image processing tasks is
the Affinity panorama tool. Most modern image editors have fairly decent
panorama tools and building a panorama is easier than it used to be. In
the image editing Dark Age, you had to manually select control points
and master blend masks to build decent panoramas. It could take hours to
align a single image. Current editors use effective automatic control
point detection and advanced blending algorithms. In most cases, it’s a
simple matter of using good capture technique followed by loading the
individual images into a panorama tool to generate decent to excellent
results.

We are living in a panoramic golden age but there are still problems. I
shoot entirely in RAW because RAW preserves the most information and
affords the greatest post processing options. Panoramas often encompass
scenes of high contrast. Image tones will vary from extremely bright to
very dark. It’s not uncommon for ordinary panoramas to span twelve or
more stops of dynamic range. When processing high dynamic range pictures
it’s extremely advantageous to do all your work on sixteen-bit or
thirty-two-bit channel images. Blending eight-bit panoramas
can release[ *the posterization
Kraken*](https://www.youtube.com/watch?v=7SqC_m3yUDU); trust me, you
don’t want that monster savaging your scenes.

Unfortunately, the Photoshop Elements panorama tool is inherently
eight-bit. This means I must do all my major tone adjustments in
Lightroom before panorama stitching. Adjusting the tones of a single
image is tedious, doing it for many panorama frames is cruel and unusual
punishment. Adobe’s answer is always the same; give us a lot of money
and we’ll release you from eight-bit Hell! Lucky for us Affinity gets us
out of eight-bit panorama Hell for a lot less.

This panorama of the mountains near the eastern entrance of

[Image link: Glacier National Park Panorama](https://conceptcontrol.smugmug.com/Themes/Manipulations/Panoramas-1/i-DDThBLs/A)

Glacier National Park was directly generated from Nikon NEF RAW files.
All feature detection and blending calculations were high-bit. Tone
adjustments were aided by [regular tone
mapping](https://vimeo.com/192632826). Tone mapping is like an automatic
[Zone System](https://en.wikipedia.org/wiki/Zone_System). Compared to
what I used to put up with [ten years
ago](https://conceptcontrol.smugmug.com/Trips/USA-and-Canada/Arizona-Toodling-1/i-fMPPrqd/A)
Affinity panorama building is almost as easy as scanning scenes [with an
iPhone](https://conceptcontrol.smugmug.com/Themes/Manipulations/Panoramas-1/i-phFMbnJ/A).
*Affinity significantly streamlines routine retouching and panorama
building.*

**What new capabilities does Affinity offer?**

So far, the features I’ve discussed are common to most image editors.
Does Affinity offer anything new or special? There is one Affinity
feature, the *FFT (Fast Fourier Transform) Denoise filter*, that greatly
mitigates one of my long-standing retouching nightmares: regular
patterns.

Many old portraits were printed on patterned paper. This image
is a crop of an old (1935) baby picture of my mother.

[Image link: Crop of patterned baby picture](https://bakerjd99.files.wordpress.com/2017/01/evelynpattern.jpg)

As you can see the entire picture is covered with tiny regular hexagons.
Patterned prints were popular in the early and mid-20^th^ century. The
pattern adds depth and luster and has the nice side effect of making
prints difficult to copy. Patterns also make retouching difficult.
Retouching spots and scratches on patterned backgrounds tends to make
them more, not less conspicuous. If only there was some way to remove
the damn pattern before retouching. Affinity’s [FFT
Denoise](https://vimeo.com/161180581) filter does just that.

I applied the FFT Denoise filter to my mother’s baby picture and then
ran through my regular retouching regime: see the following before and after
diptych.

[Image link: Before After Diptych](https://conceptcontrol.smugmug.com/Themes/Manipulations/Restorations-1/i-jg2v6DD/A)

**Affinity Conclusion**

Affinity, like PWP, is a great value. The first Windows version is
already superior to every version of Photoshop Elements I’ve ever used.
It’s not as comprehensive as full Photoshop, but if you subtract the
marginal features of Photoshop and keep the essential core elements,
you’ve basically described Affinity’s feature set. Affinity is a layer
editor but it’s not a Photoshop clone. The UI is completely modern, RAW
development is built in, sixteen-bit layers are the default, and useful
stack operations like automatic alignment are a click away. Affinity
also supports [thirty-two-bit HDR](https://vimeo.com/192633552) file
formats and high dynamic range composites. There’s a lot of bang for the
buck: strongly recommended!

[^1]: If you remember what happened to Goliath siding with David doesn’t
    seem like much of a risk.

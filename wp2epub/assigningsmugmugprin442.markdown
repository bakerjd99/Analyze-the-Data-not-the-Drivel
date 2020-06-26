 
[Assigning SmugMug Print Size Keys](https://bakerjd99.wordpress.com/2010/02/21/assigning-smugmug-print-size-keys/)
-----------------------------------------------------------------------------------------------------------------

*Posted: 21 Feb 2010 21:56:27*

I believe that a picture’s [aspect
ratio](https://en.wikipedia.org/wiki/Aspect\_ratio\_(image)), its *width*
divided by its *height*, should be tuned to its contents. Consequently,
I am not a slave to standard aspect ratios and print sizes like the ones
shown in the following table.

    Aspect Ratio       Print Sizes
    (Short/Long)       (Inches)
    ---------------    ------------------------
    0.5                 4x8, 5x10, 8x16, 10x20
    0.7                 3.5x5, 7x10
    0.666666667         4x6, 8x12, 10x15, 12x18
    0.714285714         5x7
    0.772727273         8.5x11


Over the years I have clipped and cropped my pictures producing a large
number of *nonstandard* ratios. This is not a problem until I decide to
order prints.

Pictures sites like [SmugMug](https://www.smugmug.com/) offer many
standard sizes but they cannot accommodate every crank with an aspect to
grind. To print a strangely shaped picture on SmugMug you have to open
up the website’s print selection tool and fit one side or your picture
to a standard print size. This leaves part of the print blank and is
often called the [letterbox](https://en.wikipedia.org/wiki/Letterbox)
method. Letterboxing is not ideal but it gets the job done.

For standard print sizes there is a much better way. The following [J
verb](https://www.jsoftware.com/) takes the pixel dimensions of my images
and computes standard, [300
DPI](https://www.rideau-info.com/photos/mythdpi.html), print size keys
like: 4x6, 5x7 and 8x10. After assigning print size keys you can select
and print all standard sizes with a few mouse clicks.

```J
smugprintsizes=:3 : 0

NB.*smugprintsizes v-- compute largest print size for given dpi.
NB.
NB. Computes the  largest  print size  (relative  to  DPI x)  for
NB. SmugMug images. Only images that have aspect ratios  close to
NB. the ratios  on  (SMUGPRINTSIZES) are associated  with a print
NB. size.
NB.
NB. monad:  st=. smugprintsizes btclImages
NB.
NB.   'albums images'=. readsmugtables 0
NB.   smugprintsizes images
NB.
NB. dyad:  st=. iaDpi smugprintsizes btclImages
NB.
NB.   200 smugprintsizes images

SMUGPRINTDPI smugprintsizes y
:
nsym=.s:<''

NB. reduce image table on PID
images=. }. y [ imhead=. 0 { y
pidpos=. imhead i. <'PID'
if. 0=#images=. images #~ ~:pidpos {"1 images do. 0 2$nsym return.end.

NB. compute print sizes table
pst=. printsizestable SMUGPRINTSIZES

NB. image dimensions short x long
idims=. _1&".&> (imhead i. ;:'WIDTH HEIGHT') {"1 images
'invalid image dimensions' assert -. _1 e. idims
idims=. (/:"1 idims) {"1 idims

NB. aspect ratio and print area (square inches)
ratios=. SMUGASPECTROUND round %/"1 idims
areas=.  SMUGAREAROUND round (*/"1 idims) % *: x

NB. mask table selecting images with ratio
masks=. (SMUGASPECTROUND round ;0 {"1 pst) =/ ratios
if. -.1 e. ,masks do. 0 2$nsym return.end.

masks=. <"1 masks
pids=.  s:&.> masks #&.> <pidpos {"1 images

NB. largest print area for selected images at current DPI
masks=. (1 {"1 pst) </&.> masks #&.> <areas
pids=.  (<"1&.> masks #"1 &.> pids) -. L: 0 nsym
sizes=.  <"0&.> 2 {"1 pst
; |:&.> ; pids ,: L: 0 (# L: 0 pids) # L: 0 sizes
)
```

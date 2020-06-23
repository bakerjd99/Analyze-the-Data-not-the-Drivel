 
[Turn your iPhone into a jPhone](http://bakerjd99.wordpress.com/2012/06/23/turn-your-iphone-into-a-jphone-2/)
-------------------------------------------------------------------------------------------------------------

*Posted: 23 Jun 2012 15:24:15*

[Jsoftware](http://www.jsoftware.com/) recently released a *free* J app
for the iPhone. Search for “jsoftware” in Apple’s app store and you will
land right on it. There are many excellent free iPhone apps, I have
half-a-dozen on my iPhone, but this little jewel sets a new standard for
power in your palm.

Let’s start with the good news; this is not a crippled version of J.
It’s the same high-caliber interpreter that J programmers have used on
Windows, Linux and Mac machines for years. Anything this app’s big
desktop brothers can do this little app can do. You won’t see the same
blistering desktop speed but I think you’ll be pleasantly surprised at
how fast this app munches numbers. I have run desktop J since the 1990’s
and J on the iPhone 4 matches or beats what I was seeing on laptops ten
years ago. This is the real J deal.

Now for a few caveats — this J app is not a complete J development
environment. To meet Apple’s restrictive app store rules C-style APIs,
JAL addons, GUI tools and third-party libraries like
[`opengl`](http://www.jsoftware.com/jwiki/OpenGL) and
[`lapack`](http://www.jsoftware.com/jwiki/Addons/math/lapack) are not
included. With this app you get the J interpreter and a few of the most
useful J addons like [`plot`](http://www.jsoftware.com/jwiki/Plot).
Despite these limitations this J app is probably the most powerful,
*purely local,* calculator available for the iPhone.

Don’t believe me? Turn off Wi-Fi and set your iPhone to Airplane mode:
Airplane mode cuts off phone and internet access. Now try computing [the
following](https://www.box.com/s/dadb252a1b49635d6c05) on your favorite
iPhone calculator.


    NB. generate one million random numbers and average them
    (+/ % #) ? 1000000#10000
       
    NB. generate a 50 50 random matrix, invert it and multiply with the 
    NB. original - rounding to the nearest 0.0001 to form an identity matrix 
    round=: [ * [: <. 0.5 + %~
    matrix=: ? 50 50 $ 10000
    invmat=: %. matrix
    identity=: 0.0001 round matrix +/ . * invmat
       
    NB. sum of the diagonal elements of matrix (identity) is 50 
    50 = +/ (<0 1) |: identity
       
    NB. multiply two polynomials with complex number coefficients
    polyprod=:  +//.@(*/) 

    NB. complex number coefficients - AjB is J's notation for A + Bi
    poly0=: 2j5 3j7 0 1
    poly1=: 1j2 0 3j7 0 0 2
    poly0 polyprod poly1

    NB. prime factorization table of 50 random integers less than one billion
    (<"0 nums) ,: -.&0 &.> <"1 q: nums=.50?1e9

The J app blows through these examples on my iPhone 4 in a few seconds.
Of course this is only a tiny taste of what J on the iPhone is capable
of. I have managed to run 1000+ line J scripts on this app. The only
desktop J code I have not been able to run depends on external compiled
libraries like
[`regex`](http://www.jsoftware.com/help/user/script\_regex.htm).

Cell phones are powerful little computers and it’s gratifying to finally
see software that can focus that power on something other than [Angry
Birds](http://itunes.apple.com/us/app/angry-birds/id343200656?mt=8). If
you’re interested in learning an array oriented functional programming
language or if you’re already familiar with J and want to *pack serious
computational heat* then this app is for you!


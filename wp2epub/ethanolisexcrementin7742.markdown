
[Ethanol is Excrement in the Gas Tank](https://analyzethedatanotthedrivel.org/2023/01/17/ethanol-is-excrement-in-the-gas-tank/) 
----------------------------------------------------------------------------------------------------------------------------------

*Posted: 17 Jan 2023 22:40:24*

Like many U.S. government programs, the blended corn ethanol mandate has
done little to address its avowed goals, i.e., strengthen energy
security, [reduce carbon
emissions](https://www.factcheck.org/2015/11/ethanol-higher-emissions-or-lower/),
and lower prices for consumers. By [some
accounts](http://large.stanford.edu/courses/2011/ph240/sojka2/) it,
consumes more energy than it produces, increases consumer prices,
[distorts food
production](https://www.ucsusa.org/resources/land-use-changes-and-biofuels),
wastes vast tracts of arable land, and [contributes to groundwater and
aquifer
depletion](https://news.climate.columbia.edu/2011/03/21/ethanol%E2%80%99s-impacts-on-our-water-resources/).
*What's not to like?*

The corn ethanol program has been [called a
boondoggle](https://the-pipeline.org/the-great-ethanol-boondoggle/), by
just about anyone that isn't *directly cashing ethanol checks,* but
instead of shutting this abomination down, the idiots in Washington are
being pushed by their donors (yes there is a [big ethanol
lobby](https://www.bloomberg.com/news/articles/2021-11-16/ethanol-lobby-to-white-house-blend-rule-rollback-would-backfire#xj4y7vzkg))
to expand corn ethanol production, [increase the amount of
ethanol](https://www.popularmechanics.com/cars/hybrid-electric/a11687/four-things-to-know-about-e15-15096134/)
blended into gasoline, and keep on [screwing the
public](https://www.forbes.com/sites/dianafurchtgott-roth/2022/12/02/higher-ethanol-mandates-are-a-lose-lose-for-americans/?sh=331fc2e05c8d)
in perpetuity. As it's currently *constipated*,[^7742x1] the ethanol mandate
mainly buys votes in the Midwest and funnels billions of government
dollars to ethanol refiners and their investors. *The ethanol program is
pure squealing pork.* You almost have to admire the rapacious cabal
that's sold this stupid program to an even dumber public.

Like many beleaguered citizens, I do my best to ignore government
stupidity. I simply don't have the time, energy, or patience, to engage
with the mental, moral, and cosmetic pygmies that infest government.
Unfortunately for me, and you too, the ethanol mandate is hard to ignore
because of the "mandate" bit. If you doubt this go out and try and buy
some ethanol-free gasoline. You will quickly discover that ethanol-free
gas is not always available, and even when it is; it's more expensive
and comes in fewer octane ratings than ethanol-polluted gas. Some gas
stations sell ethanol-free gas, but hardly any sell premium
(octane 91 and above) ethanol-free gas.

You may ask, "How about letting gas stations sell whatever gasoline
blends their customers prefer? If the public prefers pure to
ethanol-contaminated gas, then so be it."

Oh, you poor naïve dolt. If you think we're living in a "free market"
just pour gas, pure or ethanol, over yourself and strike a match!
Virtually everything on sale is regulated in one way or another. The
"free market" is as real as LGBTQ werewolves. In tiny regulator minds,
consumer choice must be constrained because *unfettered consumers may
not buy your crap!* Big ethanol knows consumers prefer comparably priced
pure gas to their poisoned alternative because:

1.  Ethanol-free gas gets better mileage.

2.  It burns at lower temperatures in engines reducing wear and tear.

3.  Is less corrosive and damaging to engine parts.

If corn ethanol met its promises, you could make a case that it's worth
damaging engines, draining aquifers, and restricting consumer choice but
it doesn't. As I said the program is pure pork. It's not designed to
benefit the public and it doesn't. And, barring an *electoral miracle*
that tosses all the corrupt congress critters that voted for this
affront out of office, we're going to be saddled with ethanol in our
tanks forever.

So, what can you do to limit the ethanol excrement in your gas tank?

*If money isn't an issue buy an electric car or always fill up with
ethanol-free gas.* If money is an issue remember; *dilution is the
solution to pollution.* I alternate between pure and ethanol gas when I
fill up. This is cheaper than pure gas and it keeps the ethanol
concentration down.

The Python function `ethanol_concentration` (see below) estimates
my average ethanol gas tank concentration assuming:

1.  I always fill up when the tank is half-empty (I'm a pessimist).

2.  I start with a full tank of ethanol E10 (10%) gas.

3.  I alternate between pure and ethanol gas.

If spreadsheets are more your bag [this
sheet](https://bakerjd99.files.wordpress.com/2023/01/eigt.xlsx) carries
out the same calculations.

When you run this function for the dilution schemes:

1.  $t = 1$ always use pure gas

2.  $t = 2$ alternate between ethanol and pure

3.  $t = 3$ one pure for every two ethanol

4.  $t = 4$ one pure for every three ethanol

You get:

    (1, 10, 0.2, 10, 1.5777218104420236e-29)
    (2, 10, 5.066666666666666, 10, 3.3333333333333335)
    (3, 10, 6.728571428571428, 10, 4.285714285714286)
    (4, 10, 7.553333333333333, 10, 4.666666666666667)

Observe that alternating, as expected, cuts the ethanol concentration in
half and that the concentration creeps up as you put less and less pure
gas in your tank. There's still excrement in your tank --- just less of
it.

```python
def ethanol_concentration(F, E, T):
    r"""
    Compute average ethanol concentration over:
      F = number of fill ups
      E = ethanol concentration
      T = tank filling 
      
    example:
      ethanol_concentration(100, 10, 2)
    """

    # initial tank concentrations - start with ethanol gas
    c = [0] * F
    c[0] = E

    # gas ups - 1 ethanol, 0 ethanol free
    g = [min(1, (1 + i) % T) for i in range(F)] 
    g[0] = 0

    # calculate concentrations
    for i in range(len(c)-1):
        c[i+1] = 1/2*(c[i] + E*g[i+1])
        
    return (T, E, sum(c)/len(c), max(c), min(c))
```

[^7742x1]: And I mean *constipated*. Government only serves the interests of
    the donor class. If you aren't punting *serious moola* to your
    "representative," he, she, or *trans-it*, doesn't give a ding-dong
    damn about your tiresome little problems.

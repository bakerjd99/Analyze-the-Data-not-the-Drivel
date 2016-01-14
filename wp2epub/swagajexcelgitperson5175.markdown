
[SWAG a J/EXCEL/GIT 
Personal Cash Flow Forecasting Mob](https://bakerjd99.wordpress.com/2016/01/10/swag-a-jexcelgit-personal-cash-flow-forecasting-mob/)
------------------------------------------------------------------------------------------------------------------------------------

*Posted: 19 Jan 2016 23:14:39*

While browsing in a favorite bookstore with my son, I spotted a display
of horoscope themed Christmas tree ornaments. The ornaments were glass
balls embossed with golden birth signs like Aquarius, Gemini, Cancer, et
cetera, and a descriptive phrase that “summed up” the character of
people born under a sign. Below my birth sign golden text declared,
“Imaginative and Suspicious.”

I said to my son, “I hate it when astrological rubbish is right.”

I am imaginative and suspicious; it’s a curse. When it comes to money my
“suspicious dial” is permanently [set on
eleven](https://www.youtube.com/watch?v=4xgx4k83zzc). I assume everyone
is out to cheat and defraud me until there is overwhelming evidence to
the contrary. Paranoia is generally crippling but when it comes to cold
hard cash it’s a sound retention strategy.

Prompted by an eminent life move, I found myself in need of a cash flow
forecasting tool. Normal people deal with forecasting problems by buying
standard finance programs or cranking up spreadsheets; imaginative and
suspicious people roll their own.

**SWAG**

SWAG, (Silly Wild Ass Guess), is a hybrid J/EXCEL/GIT mob[^1] that meets
my eccentric needs. I wanted a tool that:

1.  Abstracted away [*accounting
    noise*](http://www.investopedia.com/terms/a/accountingnoise.asp).

2.  Was general and flexible.

3.  Used highly portable, durable, and version control friendly inputs
    and outputs.

4.  Reflected what ordinary people, not tax accountants, actually do
    with money.

5.  Is open source and unencumbered by parasitic software patents.

Amazingly, my short list of no-brainer requirements eliminates most
standard finance programs. Time to code!

**SWAG Inputs**

The bulk of SWAG is a [JOD
generated](http://code.jsoftware.com/wiki/Addons/general/jod)
self-contained J script. You can [peruse the script
here](https://github.com/bakerjd99/jacks/blob/master/swag/scripts/Swag.ijs).
SWAG inputs and outputs are brain-dead simple TAB delimited text tables.
Inputs consist of monthly, null-free, numeric time series tables,
scenario tables, and name cross reference tables. Outputs are simple,
null-free, numeric time series tables. Input and output time series
tables have identical formats.

A few examples will make this clear. 

[Here  is a typical SWAG input and output time series table](https://github.com/bakerjd99/jacks/blob/master/swag/tabsheets/s_77Actuals.txt).

The first header line is a simple list of names. The first name “Date”
heads a column of first of month dates in YYYY-MM-DD format. The SWAG
clock has month resolution and dates are the only nonnumeric items.
Names beginning with “E” like `E0`, `E1`, …, are aggregated expenses.
Names beginning with “I” like `I0`, `I1`, `I2` … are income totals. “R”
names are reserves: basically savings, investments, equity and so forth.
“D” names are various debts. `BB` is basic period balance, `NW` is
period net worth and “U” names are utility series. Utility series
facilitate calculations. Remaining names are self-explanatory totals. Be
aware that this table has been formatted for this blog. Examples of raw
input and output tables [can be found
here](https://github.com/bakerjd99/jacks/tree/master/swag/tabsheets).

The next ingredient in the SWAG stew is what many call a scenario. A
scenario is a collection of prospective assumptions and actions. In one
scenario you buy a Mercedes and assume interest rates remain low. In
another, you take the bus and rates explode. When forecasting I evaluate
five basic scenarios, grim, pessimistic, expected, optimistic, and
exuberant. Being a negative [Debbie
Downer](http://www.urbandictionary.com/define.php?term=Debbie+Downer)
type I rarely invest time in exuberant scenarios. I concentrate on grim
and pessimistic scenarios because once you are mentally prepared for the
worst anything better feels like a lottery win.

[Here is a typical SWAG scenario table](https://github.com/bakerjd99/jacks/blob/master/swag/scenarios/s_77scenario.txt). 

Scenario tables, like time series tables, are simple TAB delimited text files.
Again, the first header row is a simple list of names. Most scenario
names are self-explanatory but four `OnDate`, `OffDate`, `Method`, and
`MethodArguments` merit some explanation. SWAG series methods `assume`,
`history`, `reserve`, `transfer`, `borrow`, and `spend` are modeled on
what people typically do with cash.

1.  `assume` sets expected interest rates and other global assumptions
    for a given time period. SWAG series methods operate over a
    well-defined time period. The period is defined by `OnDate` and
    `OffDate`.

2.  `history` looks at past periods and estimates a numeric value that
    is projected into the future. Currently, history computes simple
    means but the underlying code can employ arbitrary time series
    verbs.

3.  `reserve` manages savings, investments, equity and other cash-like
    instruments.

4.  `borrow` borrows money and sets future loan payments. `borrow`
    supports simple amortization loans but is also capable of reading an
    arbitrary payment schedule that can be used for *exotic*[^2] loans.

5.  `transfer` moves money between reserves, debts, expenses and income
    series.

6.  `spend` does just what you expect.

SWAG series methods adjust all the series impacted by the method. As you
might expect the arguments of SWAG methods can be detailed.
`MethodArguments` uses a restricted J syntax to set SWAG arguments.
Argument order does not matter but only supported names are allowed.
Many examples of SWAG `MethodArguments` can be found in the [EXCEL
spreadsheet
tp.xlsx](https://github.com/bakerjd99/jacks/blob/master/swag/tests/tp.xlsx).
I use EXCEL as a scenario editor. By setting EXCEL filters, you can
manage a large number of scenarios.

The final SWAG input is a name cross reference table. It is another TAB
delimited text file that defines SWAG names. You can inspect a typical
[cross-reference table
here](https://github.com/bakerjd99/jacks/blob/master/swag/tests/CrossReference.txt).

**Running SWAG**

To run SWAG you:

1.  Prepare input files.

2.  Start J, any front-end `jconsole`, `JQT` or `JHS` will do, and load
    the Swag script.

3.  Execute `RunTheNumbers`.

4.  Open the EXCEL [spreadsheet
    `swag.xlsx`](https://github.com/bakerjd99/jacks/blob/master/swag/swag.xlsx),
    click on the data ribbon and then press the “Refresh All” button.

Let’s work through the steps.

**Prepare Input Files**

By far the most difficult step is the first. Here you review your
financial status which means checking bank balances, stock values, loan
balances and so on. Depending on your holdings this could take anywhere
from minutes to hours. I call this updating actuals. Not only is
updating actuals the most difficult and time-consuming step it is also
the most valuable. Money that is not closely watched leaks away.

I store my actuals in a simple tabbed spreadsheet. Each tab maintains an
image of a text file. I enter my data and then cut and paste the sheets
into a text editor where I apply final tweaks and then save the sheets
as TAB delimited files.

Monthly income, expenses and debts are easy to update but some of my
holdings do not provide monthly statements. The verb
`RawReservesFromLast` [in
Swag.ijs](https://github.com/bakerjd99/jacks/blob/master/swag/scripts/Swag.ijs)
fills in missing months with the last known values. When I’m finished
preparing input files I’m left with four TAB delimited files,
`RawIncome.txt`, `RawExpenses.txt`, `RawReserves.txt`, and
`RawDebts.txt`. You can inspect [example actual files
here](https://github.com/bakerjd99/jacks/tree/master/swag/rawact).

**Start J and load the Swag script**

The SWAG script is relatively self-contained. It can be run in any J
session that loads the standard J profile. Load Swag with the standard
load utility.

     load 'c:/pd/fd/swag/swag.ijs'

[Here SWAG is loaded in JHS](https://github.com/bakerjd99/Analyze-the-Data-not-the-Drivel/blob/master/wp2latex/inclusions/jhsswag.png).

**Execute `RunTheNumbers`**

`RunTheNumbers` sets the SWAG configuration, loads scenarios, copies
actuals to each scenario, and then evaluates each scenario. Scenarios
are numbered. I use positive numbers for “production” scenarios and
negative numbers for test scenarios. It sounds more complicated that it
is. This is all you have to do to execute `RunTheNumbers`

     RunTheNumbers 0 1 2 3 4 

The code is simple and shows what’s going on.

    RunTheNumbers=:3 : 0

    NB.*RunTheNumbers v-- compute all scenarios on list (y).
    NB.
    NB. monad:  blclFiles =. RunTheNumbers ilScenarios
    NB.
    NB.   RunTheNumbers 0 1 2 3 4

    NB. parameters sheet is the last config sheet
    ModelConfiguration_Swag_=:MainConfiguration_Swag_
    parms=. ".;{:LoadConfig 0
    scfx=. ScenarioPrefix

    ac=. toHOST fmttd ActualSheet 0
    ac write TABSheetPath,'MainActuals',SheetExt

    sf=. 0$a:
    for_sn. y do.
      ac write TABSheetPath,scfx,(":sn),'Actuals',SheetExt
      sf=. sf , parms Swag sn [ LoadSheets sn
    end.

    sf 
    )

`RunTheNumbers` writes a pair of TAB delimited forecast and statistics
files for each scenario it evaluates.

**Open swag.xlsx and press “Refresh All”**

The [spreadsheet
`swag.xlsx`](https://github.com/bakerjd99/jacks/blob/master/swag/swag.xlsx)
loads SWAG TAB delimited text files and plots results.[^3] I plot
monthly cash flow, estimated net worth and debt/equity for each
scenario. [Here is a typical cash flow plot](https://github.com/bakerjd99/Analyze-the-Data-not-the-Drivel/blob/master/wp2latex/inclusions/meanbalance.png). It
estimates mean monthly cash balance over the scenario time range.
[Here is typical net worth plot](https://github.com/bakerjd99/Analyze-the-Data-not-the-Drivel/blob/master/wp2latex/inclusions/networth.png). It estimates
mean net worth over time.

So far SWAG has met my basic needs and forced me to pay more attention
to the proverbial bottom line. As I use the system I will fix bugs,
refine rough spots, and add *strictly necessary* features. Feel free to
use or adapt SWAG for your own purposes. If you do leave a note on this
blog or follow the [SWAG repository on
GitHub](https://github.com/bakerjd99/jacks/tree/master/swag).

[^1]: What do you call *dis-integrated* collections of programs that you
    use to solve problems? Declaring such dog piles “systems” demeans
    the word “system” and gives the impression that everything has been
    planned. This is not how I roll. “Mob” is far more appropriate. It
    conveys a proper sense of disorder and danger.

[^2]: When borrowing money you should always plan on paying it all back.
    Insist on a complete iron clad repayment schedule. If such a
    schedule cannot be provided run like hell or prepare for the thick
    end of a baseball bat to be rammed up your financial ass.

[^3]: It may be necessary to adjust file paths on the EXCEL DATA ribbon
    to load SWAG TAB delimited text files.

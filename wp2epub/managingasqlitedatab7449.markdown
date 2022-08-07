
["Managing" a SQLite Database with J (Part 1)](http://analyzethedatanotthedrivel.org/2022/08/03/managing-a-sqlite-database-with-j-part-1/)
------------------------------------------------------------------------------------------------------------------------------------------

*Posted: 03 Aug 2022 18:40:26*

*[Previously](https://analyzethedatanotthedrivel.org/2022/07/17/branding-xmp-sidecar-files-with-j/),
I promised to write three posts about dispatching irritants with J.
This, my third post, is proving more irritating than the others, so I
will split it over two posts.*

[SQLite](https://sqlite.org/index.html), by many estimates, is the most
widely deployed SQL database system on Earth. It's everywhere. It's in
your phone, your laptop, your cameras, your car, your cloud, and your
breakfast cereal. SQLite's global triumph is a gratifying testament to
the virtues of technical excellence and the philosophy of "less is
more."

Readers of this blog will know that I admire the *set-theoretic* basis
of SQL while despising the *IT administrative state* that has grown up,
like septic tank scum, around it. You'll know what I'm talking about if
you have ever:

1.  Requested access to a particular *corporate* database.

2.  Waited for DBAs to sign off on a query.

3.  Asked for a new index.

4.  Had the gall to install "unauthorized" software tools in
    "production."

There is so much administrative shit covering big Oracle, SQLServer, or
DB2 systems that it's almost impossible to get anything done without
constantly fellating *administrative* dick!

**SQLite saves SQL**

The creators of SQLite had another idea. Let's drop the administrative
crap and provide a simple stand-alone implementation of SQL. Let's also
structure our system as a single highly portable C source file that can
be compiled anywhere. Furthermore, let's test the shit out of our code
with comprehensive test suites that hit every line. Finally, let's fix
our damn bugs. The SQLite developers did all this so well that SQLite
slowly, then all at once, conquered the whole damn world. The SQLiters
earned their dominance.

So, what does this have to do with J?

J provides a useful [SQLite
addon](https://code.jsoftware.com/wiki/Addons/data/sqlite/Overview) that
lets J programmers navigate the vast cosmos of SQLite database files. I
mainly use J's SQLite addon to access
[ThumbsPlus](http://www.thumbsplus.com/) and
[Darktable](https://www.darktable.org/) image databases, but it's
surprisingly handy in many contexts simply because SQLite database files
are everywhere. SQLite database files are so pervasive that they've
become a *de facto* binary data exchange format. If you have data in
dire need of distribution, stuff them in a SQLite database file.

**It's still SQL**

SQLite is a superb tool, but it's still SQL, and SQL has an ancient
deficiency. Loading data into SQL systems has always been a pain. So
much so that a plethora of grisly, kludge-infested hacks, charitably
labeled *ETL tools* (**E**xtract **T**ransform and **L**oad), have taken
root in the *SQLverse*. ETL tools, no matter how polished or optimized,
all seem like afterthoughts.

> "Hey, this set-theoretic SQL shit would be so much better if there was
> some data in our database!"

If you "manage" SQL systems, you must slay ETL dragons. SQLite hasn't
fixed this, but its almost universal adoption means you can slay ETL
dragons with your favorite programming spears. One of my favorite spears
is the [J programming
language](https://code2.jsoftware.com/wiki/Main_Page).

**Toy or tool**

When I started writing this post, I considered composing a short
tutorial on how to create, load, and query a simple SQLite database with
the J addon. Then I realized the Internet drips with simple SQLite *toy
tutorials.* Do we really need another one? Simple SQL tutorials help
when getting started, but they invariably gloss over the ETL problem.
The ETL problem never goes away and it's always more complex than
expected. A realistic introduction to using SQLite, or any SQL system,
would keep this nasty fact front and center. So, in a following post, I
will outline a small but nontrivial SQLite-based *tool* I use to manage
messy data I care about.

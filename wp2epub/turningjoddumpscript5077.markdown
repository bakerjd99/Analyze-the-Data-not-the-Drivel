
[Turning JOD 
Dump Script Tricks](https://bakerjd99.wordpress.com/2015/07/04/turning-jod-dump-script-tricks/)
-----------------------------------------------------------------------------------------------

*Posted: 04 Jul 2015 20:32:40*

*Have you ever wondered how extremely prolific bloggers do it? How is it
possible to crank out thousands of blog entries per year without
creating a giant stinking pile of mediocre doo-doo? Like most deep
medium mysteries it’s not very deep and there are no mysteries. The
spewers, people who post like teenage girls tweet, use two basic
strategies:*

1.  ***Multiple authors:** The heroic image of the lone blogger waging
    holy war against a sea of Internet idiocy is largely a myth. Many
    popular prolific blogs are the work of many hands. The editor at
    [Analyze the Data not the Drivel](https://bakerjd99.wordpress.com/)
    eschews this tactic. Apparently he’s an incontinent and
    argumentative prima donna that sane people steer clear of.*

2.  ***Content recycling:** In elementary school this was called
    copying. Now that we’re all grown up we use terms like,
    “excerpting”, “abstracting”, and my favorite “re-purposing.” The
    basic idea is simple. Take something you’ve written elsewhere and
    repackage it as something new. Hey, all the cool kids are doing it!*

*The following is a slightly edited new appendix I have just added to
the JOD manual. I am working to properly publish the [JOD
manual](https://app.box.com/shared/gajfu50gc0) mostly so I can say that
I’ve written a legitimate, albeit strange and queer, book.*

*I created this post by running the `LaTeX` code of the manual
appendix through the excellent utility [pandoc](http://pandoc.org/),
tweaking the resulting
[markdown](http://daringfireball.net/projects/markdown/syntax), and then
using pandoc again to generate `html` for this blog. pandoc is a great
“re-purposing” tool!*

*Finally, re-purposing is not entirely cynical. The act of moving
material from one medium to another exposes problems. I found a few
editing errors while creating this post that eluded my `LaTeX` eyes.
If you find more this is your chance to tell me what a moron I am.*

* * * * *

Dump script generation is my favorite JOD feature. Dump scripts
serialize JOD dictionaries; they are mainly used to back up dictionaries
and interact with version control systems. However, dump scripts are
general J scripts and can do much more! Maintaining a stable of healthy
JOD dictionaries is easier if you can turn a few dump script tricks.[^5077a]

1.  **Flattening reference paths:** Open JOD dictionaries define a
    *reference path.* For example, if you open the following
    dictionaries:

           NB. open four dictionaries   
           od ;:'smugdev smug image utils'
        +-+-----------------------+-------+----+-----+-----+
        |1|opened (ro/ro/ro/ro) ->|smugdev|smug|image|utils|
        +-+-----------------------+-------+----+-----+-----+

    the reference path is `/smugdev/smug/image/utils`.

    When objects are retrieved each dictionary on the path is searched
    in reference path order. If there are *no compelling reasons* to
    maintain separate dictionaries you can improve JOD retrieval
    performance and simplify dictionary maintenance by flattening all or
    part of the path.

    To flatten the reference path do:

           NB. reopen the first three dictionaries on the path   
           od ;:'smugdev smug image' [ 3 od ''
        +-+--------------------+-------+----+-----+
        |1|opened (ro/ro/ro) ->|smugdev|smug|image|
        +-+--------------------+-------+----+-----+

           NB. dump to a temporary file (df)   
           df=: {: showpass make jpath '~jodtemp/smugflat.ijs'
        +-+---------------------------+-----------------------+
        |1|object(s) on path dumped ->|c:/jodtemp/smugflat.ijs|
        +-+---------------------------+-----------------------+

           NB. create a new flat dictionary   
           newd 'smugflat';jpath '~jodtemp/smugflat' [ 3 od ''
        +-+---------------------+--------+--------------------+
        |1|dictionary created ->|smugflat|c:/jodtemp/smugflat/|
        +-+---------------------+--------+--------------------+

           NB. open the flat dictionary and (utils)   
           od ;:'smugflat utils'
        +-+-----------------+--------+-----+
        |1|opened (rw/ro) ->|smugflat|utils|
        +-+-----------------+--------+-----+

           NB. reload dump script ... output not shown ...     
           0!:0 df

    The collapsed path `/smugflat/utils` will return the same objects as
    the longer path. It is important to understand that the collapsed
    dictionary `smugflat` does not necessarily contain the same objects
    found in the three original dictionaries `smugdev`, `smug` and
    `image`. If objects with the same name exist in the original
    dictionaries only the first one found will be in the collapsed
    dictionary.

2.  **Merging dictionaries:** If two dictionaries *contain no
    overlapping objects* it might make sense to merge them. This is
    easily achieved with dump scripts. To merge two or more dictionaries
    do:

           NB. open and dump first dictionary   
           od 'dict0' [ 3 od ''
        +-+--------------+-----+
        |1|opened (rw) ->|dict0|
        +-+--------------+-----+   
           df0=: {: showpass make jpath '~jodtemp/dict0.ijs'
        +-+---------------------------+--------------------+
        |1|object(s) on path dumped ->|c:/jodtemp/dict0.ijs|
        +-+---------------------------+--------------------+

           NB. open and dump second dictionary   
           od 'dict1' [ 3 od ''
        +-+--------------+-----+
        |1|opened (rw) ->|dict1|
        +-+--------------+-----+   
           df1=: {: showpass make jpath '~jodtemp/dict1.ijs'
        +-+---------------------------+--------------------+
        |1|object(s) on path dumped ->|c:/jodtemp/dict1.ijs|
        +-+---------------------------+--------------------+

           NB. create new merge dictionary   
           newd 'mergedict';jpath '~jodtemp/mergedict' [ 3 od ''
        +-+---------------------+---------+---------------------+
        |1|dictionary created ->|mergedict|c:/jodtemp/mergedict/|
        +-+---------------------+---------+---------------------+

           NB. open merge dictionary and run dump scripts   
           od 'mergedict'
        +-+--------------+---------+
        |1|opened (rw) ->|mergedict|
        +-+--------------+---------+

           NB. reload dump scripts ... output not shown ...     
           0!:0 df0     
           0!:0 df1

    Be careful when merging dictionaries. If there are common objects
    the last object loaded is the one retained in the merged dictionary.

3.  **Updating master file parameters:** When a new parameter is added
    to `jodparms.ijs` it will not be available in existing dictionaries.
    With dump scripts you can rebuild existing dictionaries and update
    parameters. To rebuild a dictionary with new or custom parameters
    do:

           NB. save current dictionary registrations   
           (toHOST ; 1 { 5 od '') write_ajod_ jpath '~temp/jodregister.ijs'

           NB. open dictionary requiring parameter update    
           od 'dict0' [ 3 od ''
        +-+--------------+-----+
        |1|opened (rw) ->|dict0|
        +-+--------------+-----+

           NB. dump dictionary and close   
           df=: {: showpass make jpath '~jodtemp/dict0.ijs'
        +-+---------------------------+--------------------+
        |1|object(s) on path dumped ->|c:/jodtemp/dict0.ijs|
        +-+---------------------------+--------------------+

           3 od ''
        +-+---------+-----+
        |1|closed ->|dict0|
        +-+---------+-----+

           NB. erase master file and JOD object id file   
           ferase jpath '~addons/general/jod/jmaster.ijf'
        1   
           ferase jpath '~addons/general/jod/jod.ijn'
        1

           NB. recycle JOD - this recreates (jmaster.ijf) and (jod.ijn)    
           NB. using the new dictionary parameters defined in (jodparms.ijs)      
           (jodon , jodoff) 1
        1 1

           NB. re-register dictionaries   
           load jpath '~temp/jodregister.ijs'

           NB. create a new dictionary - it will have the new parameters   
           newd 'dict0new';jpath '~jodtemp/dict0new' [ 3 od ''
        +-+---------------------+---------+-------------------+
        |1|dictionary created ->|dict0new|c:/jodtemp/dict0new/|
        +-+---------------------+---------+-------------------+

           od 'dict0new'
        +-+--------------+--------+
        |1|opened (rw) ->|dict0new|
        +-+--------------+--------+

           NB. reload dump script ... output not shown ...   
           0!:0 df  

    Before executing complex dump script procedures *back up your JOD
    dictionary folders* and play with dump scripts on test dictionaries.
    Dump scripts are essential JOD dictionary maintenance tools but like
    most powerful tools they must be used with care.

[^5077a]: Spicing up one’s rhetoric with a double entendre like “turning
    tricks” may be construed as a
    [*microaggression*](http://thefederalist.com/2015/03/24/microaggressions-and-trigger-warnings-meet-real-trauma/).
    The point of colored language is to memorably make a point. You are
    unlikely to forget *turning dump script tricks.*
